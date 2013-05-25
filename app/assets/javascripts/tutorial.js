function tutorial() {
$('#tutorial_1, #blanket').toggle();
}

function profile() {
	$('#tutorial_2, #tutorial_1').toggle();
	$('#profile').css({position: 'relative', background: 'white'});
}

function badges() {
	$('#tutorial_2').toggle();
	$('#badges').css({position: 'relative', background: 'white'});
	$('#profile').css({position: '', background: ''});
}