/*global $*/
/*global location*/
// $(function(){...});

//ページURL＝リンクURLの際の挙動
$(document).on("turbolinks:load", function(){
  $(".navbar-nav li a").each(function(){
    let linkURL = $(this).attr("href");
    if(location.pathname == linkURL) {
      $(this).parent("li").addClass("current");
    } else {
      $(this).parent("li").removeClass("current");
    }
  });
});
$(document).on("turbolinks:load", function(){
  $(".navbar-nav li a").each(function(){
    let currentURL = location.pathname;
    if(currentURL.match("corp")) {
      $("#doctor-btn").css({
        "background-color": "#F8A055",
        "border-color": "#FFA07A"
      });
    } else if(currentURL.match("user")) {
      $("#sales-btn").css({
        "background-color": "#F8A055",
        "border-color": "#FFA07A"
      });
    }
  });
});
//スライドラインの設定
$(document).on("turbolinks:load", function(){
  let currentItem = $('.current');
  if(currentItem[0]) {
    currentItem.css({
      "width": currentItem.width(),
      "left": currentItem.position().left
    }),
    $("#slide-line").css({
      "width": currentItem.width(),
      "left": currentItem.position().left
    });
  }
  $("#navigation li").hover(function(){
    $("#slide-line").css({
      "width": $(this).width(),
      "left": $(this).position().left
    });
  },
  function(){
    if(currentItem[0]) {
      $("#slide-line").css({
        "width": currentItem.width(),
        "left": currentItem.position().left
      });
    } else {
      $("#slide-line").width(0);
    }
  });
});