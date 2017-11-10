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

  $('.select2ajax').select2({
    minimumInputLength: 1,
    maximumInputLength: 20,      
    theme: "bootstrap",    
    ajax: {
      url: '/users/search.json',
      dataType: 'json',
      delay: 250
      // Additional AJAX parameters go here; see the end of this chapter for the full code of this example
    }
  });  
});