$(document).on('turbolinks:load', function(){
    $('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });
    $('.rated').raty({ path: '/assets',
      readOnly: true,
      score: function() {
        return $(this).attr('data-score');
      }
    });
    //Use elevate zoom on individual product page
    $(".img-zoom").elevateZoom({
  		zoomWindowWidth:	200,	
			zoomWindowHeight:	200,
			responsive: true
		});
});