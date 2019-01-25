$(document).on('turbolinks:load', function() {
  $(function(){
    if ($('.slider').length > 0) {
      $(".slider").not('.slick-initialized').slick({
        autoplay: true,
        prevArrow: '<img src="https://www.mercari.com/jp/assets/img/common/jp/top/carousel-prev.png" class="slide-arrow prev-arrow">',
        nextArrow: '<img src="https://www.mercari.com/jp/assets/img/common/jp/top/carousel-next.png" class="slide-arrow next-arrow">'
      });
    }
  });
  // アイテム詳細画面で削除をクリックするとモーダルが発生
  $(function() {
    $('#openModal').click(function(){
        $('#modalArea').fadeIn();
    });
    $('#closeModal , #modalArea').click(function(){
      $('#modalArea').fadeOut();
    });
  });
  // アイテム詳細画面で小さい画像をホバーすると大きい画像が変更される
  $(function() {
    $('.main').each(function(index){
      $(`#mini${index + 1}`).mouseover(function(){
        $('.sub').css('opacity','.4');
        $(this).css('opacity','1');
        $('.main').not(`#photo${index + 1}`).css('display','none');
        $(`#photo${index + 1}`).fadeIn();
      })
    })
  });
  // アイテム詳細画面で小さい画像をクリックするとアップで表示される
  $(function() {
    $('.large-photo').each(function(index){
      $(`#mini${index + 1}`).click(function(){
        $('#modalArea-photo').add(`#modal${index + 1}`).fadeIn();
      })
      $('#modalArea-photo').click(function(){
        $('#modalArea-photo').add(`#modal${index + 1}`).fadeOut();
      });
    })
  })
});
