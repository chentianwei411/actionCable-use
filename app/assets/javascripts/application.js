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
// = require rails-ujs
//= require jquery
//= require popper
//= require bootstrap-sprockets
//= require activestorage
//= require turbolinks
//= require_tree .


// document.addEventListener("turbolinks:load", function() {
//   document.querySelectorAll(".delete-post").forEach(function(anchor) {
//     anchor.addEventListener("click", function(event) {
//       event.preventDefault();
//       var url = this.getAttribute("href");
//       Rails.ajax({
//         url: url,
//         type: "DELETE",
//         dataType: 'json',
//         success: function(data) {
//           document.getElementById("post-" + data["id"]).style.display = 'none'
//         }
//       })
//     })
//   })
// })
// document.addEventListener("turbolinks:load", function() {
//   document.querySelectorAll(".toggle-flag").forEach(function(anchor){
//     anchor.addEventListener("click", function(event) {
//       var url = this.getAttribute("data-url");
//       console.log(url);
//       Rails.ajax({
//         url: url,
//         type: "POST",
//         dataType: "json",
//         success: function(data) {
//           if (data["flag_at"]) {
//             document.getElementById("post-flag-" + data["id"]).innerHTML = data["flag_at"];
//           } else {
//             document.getElementById("post-flag-" + data["id"]).innerHTML = "";
//           }
//         }
//       })
//     })
//   })
// })
