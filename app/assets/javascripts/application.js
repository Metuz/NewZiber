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
//= require ckeditor/init
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
gfx().ready(function(){
  gfx('#report_brand_id').change(function(e){
    if(gfx('#report_brand_id').val()==1){//muestro el div1 y oculto los demas
      gfx('#lolo').show();
    }else{//muestro el div3 y oculto los demas
      gfx('#lolo').hide();
    }
  });
})
gfx().ready(function(){
  var checkbox = document.getElementById('lolo');
  var tecnico_div = document.getElementById('tecnico');
  var tecnico2_div = document.getElementById('tecnico2');
  checkbox.onclick = function() {
   if(this.checked) {
     tecnico_div.style['display'] = 'block';
     tecnico2_div.style['display'] = 'none';
   } else {
     tecnico_div.style['display'] = 'none';
     tecnico2_div.style['display'] = 'block';
   }
 };
})
