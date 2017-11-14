Select2 with ajax loading users from .json search
===================

### JavaScript
```javascript
$(function() {
  return $('.select2AjaxGetUsers').select2({
    theme: 'bootstrap',
    language: "pt-BR",
    minimumInputLength: 3,
    maximumInputLength: 20,
    ajax: {
      // url: $('.select2-field').data('endpoint'),
      url: '/users/search.json',
      dataType: 'json',
      delay: 250,
      data: function(params) {
        return {
          q: params.term,
          page: params.page
        };
      },
      processResults: function(data) {
        return {
          results: $.map(data, function(item) {
            return {
              text: item.name,
              id: item.id
            };
          })
        };
      }
    }
  });  
});
```
### CoffeeScript
```coffeescript
$ ->
  $('.select2AjaxGetUsers').select2
    theme: 'bootstrap'
    language: 'pt-BR'
    minimumInputLength: 3
    maximumInputLength: 20
    ajax:
      url: '/users/search.json'
      dataType: 'json'
      delay: 250
      data: (params) ->
        {
          q: params.term
          page: params.page
        }
      processResults: (data) ->
        { results: $.map(data, (item) ->
          {
            text: item.name
            id: item.id
          }
        ) }
```
### Search in Controller
```ruby
  def search
    adapter = ActiveRecord::Base.connection.adapter_name
  
    case adapter
    when 'Mysql2'
      @users = User.where("MATCH (name, email) AGAINST (lower('#{params[:q].to_s.downcase}'))")
    when 'PostgreSQL' 
      @users = User.where('name ILIKE ? OR email ILIKE ?', "%#{params[:q]}%", "%#{params[:q]}%")
    else
      @users = User.where('name LIKE ? OR email LIKE ?', "%#{params[:q]}%", "%#{params[:q]}%")
    end

    respond_to do |format|
      format.json { render json: @users.map { |p| { id: p.id, name: "#{p.name} - #{p.email}" } } }
    end
  end
```

### Alter table ADD FULLTEXT in MySql > 5.6 InnoDB

```sql
-- ALTER TABLE `users` ADD FULLTEXT(name);
-- ALTER TABLE `users` ADD FULLTEXT(email);
SELECT `users`.* FROM `users` WHERE MATCH(name, email) AGAINST('Mariana');
```
