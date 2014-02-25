var $container = $('#items');
    $container.imagesLoaded(function(){
    $container.masonry({
      itemSelector : '.item',
      columnWidth : 290,
      isAnimated: true
    });
  });