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
  $(function() {
    $('#openModal').click(function(){
        $('#modalArea').fadeIn();
    });
    $('#closeModal , #modalArea').click(function(){
      $('#modalArea').fadeOut();
    });
  });
  $(function() {
    $('#mini1').mouseover(function(){
      $('.sub').css('opacity','.4');
      $(this).css('opacity','1');
      $('.main').not('#photo1').css('display','none');
      $('#photo1').fadeIn();
    })
    $('#mini2').mouseover(function(){
      $('.sub').css('opacity','.4');
      $(this).css('opacity','1');
      $('.main').not('#photo2').css('display','none');
      $('#photo2').fadeIn();
    })
    $('#mini3').mouseover(function(){
      $('.sub').css('opacity','.4');
      $(this).css('opacity','1');
      $('.main').not('#photo3').css('display','none');
      $('#photo3').fadeIn();
    })
    $('#mini4').mouseover(function(){
      $('.sub').css('opacity','.4');
      $(this).css('opacity','1');
      $('.main').not('#photo4').css('display','none');
      $('#photo4').fadeIn();
    })
  });
  $(function() {
    $('#mini1').click(function(){
      $('#modalArea3').add('#modal1').fadeIn();
    })
    $('#modalArea3').click(function(){
      $('#modalArea3').add('#modal1').fadeOut();
    });
    $('#mini2').click(function(){
      $('#modalArea3').add('#modal2').fadeIn();
    })
    $('#modalArea3').click(function(){
      $('#modalArea3').add('#modal2').fadeOut();
    });
    $('#mini3').click(function(){
      $('#modalArea3').add('#modal3').fadeIn();
    })
    $('#modalArea3').click(function(){
      $('#modalArea3').add('#modal3').fadeOut();
    });
    $('#mini4').click(function(){
      $('#modalArea3').add('#modal4').fadeIn();
    })
    $('#modalArea3').click(function(){
      $('#modalArea3').add('#modal4').fadeOut();
    });
  })
});
