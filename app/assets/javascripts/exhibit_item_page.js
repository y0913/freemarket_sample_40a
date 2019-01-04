$(document).on('turbolinks:load', function() {
    $(function() {
      $('#select_box').on("change", function() {
        const str = document.getElementById("1").value;
        console.log(str)
        if (str == 0) {
        $('.second').css('display', 'none');
        $('.third').css('display', 'none');
        $('.size').css('display', 'none');
        $('.brand').css('display', 'none');
        }
        if (str == 1) {
        $('.second').css('display', 'none');
        $('.third').css('display', 'none');
        $('.size').css('display', 'none');
        $('.brand').css('display', 'none');
        $('.second.1').css('display', 'block');
        }
        if (str == 2) {
        $('.second').css('display', 'none');
        $('.third').css('display', 'none');
        $('.size').css('display', 'none');
        $('.brand').css('display', 'none');
        $('.second.2').css('display', 'block');
        }
      })
      $('.second.1').on("change", function() {
        const str1 = document.getElementById("2").value;
        console.log(str1)
        if (str1 == 3) {
        $('.third').css('display', 'none');
        $('.size').css('display', 'none');
        $('.brand').css('display', 'none');
        }
        if (str1 == 4) {
        $('.third').css('display', 'none');
        $('.size').css('display', 'none');
        $('.brand').css('display', 'none');
        $('.third.1').css('display', 'block');
        }
        if (str1 == 5) {
        $('.third').css('display', 'none');
        $('.size').css('display', 'none');
        $('.brand').css('display', 'none');
        $('.third.2').css('display', 'block');
        }
      })
      $('.second.2').on("change", function() {
        const str1 = document.getElementById("3").value;
        console.log(str1)
        if (str1 == 6) {
        $('.third').css('display', 'none');
        $('.size').css('display', 'none');
        $('.brand').css('display', 'none');
        }
        if (str1 == 7) {
        $('.third').css('display', 'none');
        $('.size').css('display', 'none');
        $('.brand').css('display', 'none');
        $('.third.3').css('display', 'block');
        }
        if (str1 == 8) {
        $('.third').css('display', 'none');
        $('.size').css('display', 'none');
        $('.brand').css('display', 'none');
        $('.third.4').css('display', 'block');
        }
      })
      $('.third.1').on("change", function() {
        const str2 = document.getElementById("4").value;
        console.log(str2)
        if (str2 == 9) {
        $('.size').css('display', 'none');
        $('.brand').css('display', 'none');
        }
        else if (str2 == 10 || str2 == 11) {
        $('.size').css('display', 'block');
        $('.brand').css('display', 'block');
        $('.delivery').css('display', 'block');
        }
      })
      $('.third.2').on("change", function() {
        const str2 = document.getElementById("5").value;
        console.log(str2)
        if (str2 == 12) {
        $('.size').css('display', 'none');
        $('.brand').css('display', 'none');
        }
        else if (str2 == 13 || str2 == 14) {
        $('.size').css('display', 'block');
        $('.brand').css('display', 'block');
        }
      })
      $('.third.3').on("change", function() {
        const str2 = document.getElementById("6").value;
        console.log(str2)
        if (str2 == 15) {
        $('.size').css('display', 'none');
        $('.brand').css('display', 'none');
        }
        else if (str2 == 16 || str2 == 17) {
        $('.size').css('display', 'block');
        $('.brand').css('display', 'block');
        }
      })
      $('.third.4').on("change", function() {
        const str2 = document.getElementById("7").value;
        console.log(str2)
        if (str2 == 18) {
        $('.size').css('display', 'none');
        $('.brand').css('display', 'none');
        }
        else if (str2 == 19 || str2 == 20) {
        $('.size').css('display', 'block');
        $('.brand').css('display', 'block');
        }
      })
      $('.select_box').on("change", function() {
        const str3 = document.getElementById("8").value;
        console.log(str3)
        if (str3 == "") {
        $('.delivery_hide').css('display', 'none');
        }
        else if (str3 == 1|| str3 == 2) {
        $('.delivery_hide').css('display', 'block');
        }
      })
      $(".price__input").on('keyup', function(){
        const num = document.getElementById("price").value;
        var cost = (num * 0.1)
        var cost_num = parseInt(cost)
        var profit = num - cost_num
        if (num >= 300 && 9999999 >= num) {
          $('.exhibit_cost.price').val(''),
          $('.exhibit_cost.price').html(`<p class="exhibit_cost.price">¥${cost_num.toLocaleString()}</p>`),
          $('.exhibit_salary.price').html(`<p class="exhibit_salary.price">¥${profit.toLocaleString()}</p>`)
        } else {
          $('.exhibit_cost.price').empty('')
          $('.exhibit_salary.price').empty('')
          $('.exhibit_cost.price').html(`<p class="exhibit_cost.price">-</p>`)
          $('.exhibit_salary.price').html(`<p class="exhibit_salary.price">-</p>`)
        }
      });
      $(".rate-box").on('click', function(){
        $(".rate-box").removeClass('click')
        $(this).addClass('click')
      })
    })
})
