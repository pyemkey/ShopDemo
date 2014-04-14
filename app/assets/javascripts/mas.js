// var $container = $('#items');
//     $container.imagesLoaded(function(){
//     $container.masonry({
//       itemSelector : '.item',
//       columnWidth : 290,
//       gutterWidth: 40,
//       isAnimated: true,
//       isRTL: true
//     });
//   });

$(function(){

  $('#items').masonry({
    itemSelector: '.item',
    columnWidth: 50,
    isAnimated: !Modernizr.csstransitions,
    isRTL: true
  });

});