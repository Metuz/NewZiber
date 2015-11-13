// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require jquery.smartmenus
//= require jquery.stellar
//= require SmoothScroll
//= require jquery.waypoints.min
//= require jquery.lightbox.min
//= require jquery.montage.min
//= require jquery.carouFredSel-6.2.1-packed
//= require jquery.themepunch.plugins.min
//= require jquery.themepunch.revolution.min
//= require jquery.flexslider
//= require jquery.flexslider-min
//= require jquery.easypiechart.min
//= require jquery.tooltipster
//= require TimeCircles
//= require tweetie
//= require jquery.nouislider.min
//= require init
//= require cocoon
//= require turbolinks
//= require_tree .
$().ready(function(){
  $('#report_brand_id').change(function(e){
    if($('#report_brand_id').val()==1){//muestro el div1 y oculto los demas
      $('#lolo').show();
      $('#apDiv2').hide();
      $('#apDiv3').hide();
    }else{//muestro el div3 y oculto los demas
      $('#apDiv3').show();
      $('#lolo').hide();
      $('#apDiv2').hide();
    }
  });
})
