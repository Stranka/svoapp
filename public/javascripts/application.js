// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults



$(function(){
    $('.fadein img:gt(0)').hide();
    setInterval(function(){
      $('.fadein :first-child').fadeOut(3000)
         .next('img').fadeIn(3000)
         .end().appendTo('.fadein');},
      8000);
});

//<script type="text/javascript">
function menue_action_auswahl()
    {
    var co = document.menue.menue_the_controller;
    var ac = document.menue.menue_the_action;

 if (co.options
    [co.selectedIndex].
    value == "articles")
    {
    ac.options.length = 0;
    ac.options[0] = new Option("show_content");
    ac.options[1] = new Option("index");
    $(document.getElementById("the_id")).show()
    }
    else if (co.options
    [co.selectedIndex].
    value == "news")
    {
    ac.options.length = 0;
    ac.options[0] = new Option("all_news");
    ac.options[1] = new Option("index");
    $(document.getElementById("the_id")).hide()
    }
    else if (co.options
    [co.selectedIndex].
    value == "")
    {
    $(document.getElementById("the_id")).hide()
    ac.options.length = 0;
    }
    else {
    ac.options.length = 0;
    ac.options[0] = new Option("index");
    $(document.getElementById("the_id")).hide()
    }
    };
//</script>

