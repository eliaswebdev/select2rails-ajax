$ ->
  $('.select2-field').select2
    theme: 'bootstrap'
    minimumInputLength: 1
    maximumInputLength: 20
    ajax:
      url: $('.select2-field').data('endpoint')
      dataType: 'json'
      delay: 250
      data: (params) ->
        {
          q: params.term
          page: params.page
        }

      processResults: (data) ->
        {
          results: $.map(data, (item) ->
            {
              text: item.full_name
              id: item.id
            }
        )}