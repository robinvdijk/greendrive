$(document).ready(function() {
	$(function(){
		$('.col_home_side div').each(function(idx){
			$(this).hover(function(evt){
				var link = $(evt.target);
				var selector = '#' + link.data('explain_block');
				$(selector).toggle();
			})
		})
	})
});
