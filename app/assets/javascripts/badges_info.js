$(document).ready(function() {
	
		$('.badge_container img').mouseenter(function(){
			t = $(this)
			badge = $(this).closest('.badge_container');
			description = $(badge).find('.badge_description');
				
				$('#sidebar_badge_info').html(t.clone(t));
				$('.avatar').addClass('badge_full');
				$('#sidebar_badge_info').append(description.addClass('badge_block').clone(badge));
				$(this).siblings('.badge_description').removeClass('badge_block');
		})

});
