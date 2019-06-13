;(function($) {	

	$(window).load( function() {
		
		$('.filter-current').on('click', function() {
			$(this).siblings('ul').fadeToggle(300);
		});

		$('.filter').on('click', 'li', function() {
			$('.filter-current').text($(this).text());
			$(this).parent().fadeOut(200);
		});

		$(document).on('click', function(event) {    
			if ( $(event.target).closest('.filter').length == 0 )
				$('.filter').children('ul').fadeOut(200);
		});


		var $container = $('.works');

		$('.works').isotope({
			itemSelector : '.row-item',
			layoutMode : 'fitRows'
		});

		$('.filter-list li, .filter-select li').on('click', function() {
			$(this).addClass('active').siblings().removeClass('active');

			var selector = $(this).attr('data-filter');
			$container.isotope({ filter: selector });
		});
	});

})(jQuery);