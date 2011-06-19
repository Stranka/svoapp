// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

setInterval(function(){
  var imgs = $$('.fadein img'),
   visible = imgs.findAll(function(img){ return img.visible(); });
  if(visible.length>1) visible.last().fade({ duration: 2.5 });
    else imgs.last().appear({ duration: 2.5,
      afterFinish: function(){ imgs.slice(0,imgs.length-1).invoke('show');  } });
}, 8000);

