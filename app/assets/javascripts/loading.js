$(document).ready(function(){
  $('#onLoading').on('click', function() {
    setTimeout(function(){
      $(this).attr('disabled',true)
      location.reload(true)
      console.info('recarregando a tela para atualizar os dados')
    },5000)
  })
  //setInterval(()=> {$('#onLoading').trigger('click')},10000)
  $('.col-md-3').click(function(cellIndex){
    $(this).find(".card-custom").each(function() {
       $(this).find(".fix span").each(function() {
        var title = $(this).attr("title");
        window.open(`https://coinmarketcap.com/currencies/${title}/`, "_blank")
      });      
    });
  }) 
})