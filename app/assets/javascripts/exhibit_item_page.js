$(document).on('turbolinks:load', function() {
    $(function() {
      $('.second.2').on("change", function() {
        const str1 = document.getElementById("3").value;
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
        $(".rate-box").children("label").on('click', function(){
        $(".rate-box").children("label").removeClass('click')
        $(this).addClass('click')
        $(this).checked = true;
      })
    })
})
