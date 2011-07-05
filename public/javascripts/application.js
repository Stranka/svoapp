// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

setInterval(function(){
  var imgs = $$('.fadein img'),
   visible = imgs.findAll(function(img){ return img.visible(); });
  if(visible.length>1) visible.last().fade({ duration: 2.5 });
    else imgs.last().appear({ duration: 2.5,
      afterFinish: function(){ imgs.slice(0,imgs.length-1).invoke('show');  } });
}, 8000);

//<script type="text/javascript">
  function update_auswahl()
    {
    var co = document.menue.menue_the_controller;
    var ac = document.menue.menue_the_action;

 if (co.options
    [co.selectedIndex].
    value == "articles")
    {
    ac.options.length = 0;
    ac.options[0] = new Option("show_content");
    ac.options[1] = new Option("showme");
    document.getElementById("the_id").show()
    }
    else if (co.options
    [co.selectedIndex].
    value == "")
    {
    document.getElementById("the_id").hide()
    ac.options.length = 0;
    }
    else {
    ac.options.length = 0;
    ac.options[0] = new Option("index");
    document.getElementById("the_id").hide()
    }
    }
//</script>

