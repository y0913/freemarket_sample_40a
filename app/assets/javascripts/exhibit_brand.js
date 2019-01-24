
$(document).on('turbolinks:load', function() {
// ブランド候補を表示する
  function brand_options(brand){
    var html = `<li class = "brand_options_list">${brand.name}</li>`
    $("#brand_options").append(html)
  }


// ブランド入力欄に入力すると、候補を下に表示する
  $(document).on('keyup','.exhibit_select_brand',function(e){
    var input_brand = $(this).val()
    $('#brand_options').children().remove()
    $.ajax({
      url: 'brand/search',
      type: "POST",
      data: {name:input_brand},
      dataType: 'json',
    })

    .done(function(data){
      if(data == ""){}
      else{
        $.each(data.brands,function(i,brand){
          brand_options(brand)
        });
      }
    })

    .fail(function(data){
      alert('error');
    })
  })

// ブランド候補をクリックすると、入力欄にブランド名が入る
  $(document).on('click','.brand_options_list',function(e){
    var brand_name = $(this).text()
    $('.exhibit_select_brand').val(brand_name)
    $('#brand_options').children().remove()
  })

})
