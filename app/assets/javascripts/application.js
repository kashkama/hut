// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .
function adjust_textarea(h) {
    h.style.height = "20px";
    h.style.height = (h.scrollHeight) + "px";
}

          $(document).ready(function(){
            setTimeout(function(){
              $('#notice_wrapper').fadeOut("slow", function(){
                $(this).remove();
              })
            }, 3500);
          });
        
      //  maps in home#show
      function initMap() {
        var latd = parseFloat($('p#lat').text());
        var lngd = parseFloat($('p#lng').text());
        var house = {lat: latd, lng: lngd};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 15,
          center: house,
          draggable: false
        });
        var marker = new google.maps.Marker({
          position: house,
          map: map
        });
      }
  
