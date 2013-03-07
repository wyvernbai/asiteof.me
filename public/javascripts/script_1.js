$(document).ready (
    function(){
      $('#nav li a').hover(
        function() {
          if (this.className == ""){
            $(this).stop().animate({ 'padding-top' : 90, 'padding-bottom' : 10 }, 300).css({ background: '#00c6ff'});
          }
          else{
            $(this).css({ background: '#00c6ff'});
          }
        },
        function() {
          if (this.className == ""){
            $(this).stop().animate({ 'padding-top' : 60, 'padding-bottom' : 4 }, 300).css({ background: '#383838'});
          }
          else{
            $(this).css({ background: '#00c6ff'});
          }
        }
      );
    });
