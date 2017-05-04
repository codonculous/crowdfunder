$(function(){

  $('main form').on('submit',function(e){
    e.preventDefault();
    $.ajax({
      url: '/search',
      method:'POST',
      data:$(this).serialize(),
      dataType:'html'

    }).done (function(data){
      console.log("Here is your data" + data);
    });
  });

});
