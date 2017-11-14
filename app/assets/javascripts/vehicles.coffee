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