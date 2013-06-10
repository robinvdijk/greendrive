$(document).ready(function() {
	$(window).load(function() {
		if($('#new_user li').find('.field_with_errors').length){
		tooltip = $('#new_user li').find('.help_text')
    field = $(tooltip).prev()
    $(tooltip.eq(0)).appendTo(field.eq(0))
    $(tooltip.eq(1)).appendTo(field.eq(1))
    $(tooltip.eq(2)).appendTo(field.eq(2))
		}
	});
});
