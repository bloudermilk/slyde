$(function () {
  $("body").on("keydown", function (event) {
    switch (event.which) {
      case 37:
        go("previous");
        break;
      case 39:
        go("next");
        break;
    }
  });

  function go (direction) {
    var $link = $("link[rel=" + direction + "-slide]"),
        href = $link.attr("href");
        console.log(href);

    if (href) location.href = href;
  }
});
