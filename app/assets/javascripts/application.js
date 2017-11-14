// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require turbolinks
//= require selectize-ajax
//= require_tree ./plugins/select2
//= require_tree .

// $(function() {
//   $('#vehicle_user_id').selectize({
//     create: true,
//     sortField: 'text'
//   });
// });


// SELECT2
$(document).ready(function() {
  // select2 default
  $(".select2").select2({
    theme: "bootstrap"
  });

  // select2 tags_list
  $(".tags").select2({
    theme: "bootstrap",
    tags: true,
    tokenSeparators: [',']
  });
 
});


$(function() {
  return $('.select2ajax').select2({
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