$(document).ready(function () {
	$(".popup").hide();

	var documentWidth = document.documentElement.clientWidth;
	var documentHeight = document.documentElement.clientHeight;
	var cursor = $('#cursorPointer');
	var inputRef = ".input__range__area > input"
	var cursorX = documentWidth / 2;
	var cursorY = documentHeight / 2;

	function triggerClick(x, y) {
		var element = $(document.elementFromPoint(x, y));
		element.focus().click();
		return true;
	}

	window.addEventListener('message', function (event) {
		document.getElementById("hair").value = event.data.hairModel;
		document.getElementById("haircolor").value = event.data.firstHairColor;
		document.getElementById("haircolor2").value = event.data.secondHairColor;
		document.getElementById("makeup").value = event.data.makeupModel;
		document.getElementById("makeupcolor").value = event.data.makeupcolor;
		document.getElementById("lipstick").value = event.data.lipstickModel;
		document.getElementById("lipstickcolor").value = event.data.lipstickColor;
		document.getElementById("eyebrow").value = event.data.eyebrowsModel;
		document.getElementById("eyebrowcolor").value = event.data.eyebrowsColor;
		document.getElementById("beard").value = event.data.beardModel;
		document.getElementById("beardcolor").value = event.data.beardColor;
		document.getElementById("blush").value = event.data.blushModel;
		document.getElementById("blushcolor").value = event.data.blushColor;
		document.getElementById("eyesColor").value = event.data.eyesColor;
		document.getElementById("chestModel").value = event.data.chestModel;

		if (event.data.openBarbershop == true) {
			$('body').show().css("display", "flex");
			$('.label-value').each(function () {
				var label = $(this);
				var max = label.attr('data-legend');
				var input = label.closest('.openBarbershop').find('.input__range__area input');
				var val = input.val();
				label.innerHTML = `<input  class="inputValue" data-range-id="${label.attr('data-range-id')}" type="number" value="${val}"/>/${max}`;
			});

			document.querySelectorAll('.label-value').forEach(data => {
				var parent = data.parentNode;
				var parent2 = parent.parentNode;
				const max = data.getAttribute('data-legend')
				data.innerHTML = `<input  class="inputValue" data-range-id="${parent2.querySelector('input').id}" type="number" value="${parent2.querySelector('input').value}"/>/${max}`;
			})

			$('.selected').removeClass('selected');
			$('#head').addClass('selected');
		}

		if (event.data.openBarbershop == false) {
			$("body").hide();
		}

		if (event.data.type == "click") {
			triggerClick(cursorX - 1, cursorY - 1);
		}
	});


	function attInputNumber(parent, valor, max, rangeId) {
		const inputNumberHtml = `<input class="inputValue" type="number" value="${valor}" max="${max}" data-range-id="${rangeId}" />/${max}`;
		parent.find('.label-value').html(inputNumberHtml);
	}


	var debounceTimer;
	$(document).on('input', 'input[type="range"]', function () {
		const newValue = $(this).val();
		const max = $(this).attr('max');
		const parent = $(this).closest('.input__range__area');
		const rangeId = $(this).attr('id');

		attInputNumber(parent, newValue, max, rangeId);

		sendCallBackUpdate();
	});

	$(document).on('keyup', '.inputValue', function () {
		clearTimeout(debounceTimer);
		const newValue = $(this).val();
		const rangeId = $(this).data('range-id');
		const inputRange = $('#' + rangeId);
		const max = inputRange.attr('max');

		debounceTimer = setTimeout(() => {
			if (newValue > max) {
				$(this).val(max);
			} else if (newValue < 0) {
				$(this).val(0);
			}

			inputRange.val(newValue);
			attInputNumber(inputRange.closest('.sections'), newValue, max, rangeId);

			sendCallBackUpdate();
		}, 500);
	});


	$('.arrow').click(function () {
		const parentSection = $(this).closest('.sections');
		const inputRange = parentSection.find('input[type="range"]');
		let currentValue = parseInt(inputRange.val());
		const maxValue = parseInt(inputRange.attr('max'), 10);
		const minValue = parseInt(inputRange.attr('min'), 10);
		const rangeId = $(inputRange).attr('id');


		if ($(this).hasClass('arrow-right') && currentValue < maxValue) {
			currentValue++;
		} else if ($(this).hasClass('arrow-left') && currentValue > minValue) {
			currentValue--;
		}


		inputRange.val(currentValue);
		attInputNumber(parentSection, currentValue, inputRange.attr('max'), rangeId);
		sendCallBackUpdate();
	});


	function sendCallBackUpdate() {
		$.post('http://vrp_barbershop/updateSkin', JSON.stringify({
			value: false,
			hairModel: $('.hair').val(),
			firstHairColor: $('.haircolor').val(),
			secondHairColor: $('.haircolor2').val(),
			makeupModel: $('.makeup').val(),
			makeupintensity: $('.makeupintensity').val(),
			makeupcolor: $('.makeupcolor').val(),
			lipstickModel: $('.lipstick').val(),
			lipstickintensity: $('.lipstickintensity').val(),
			lipstickColor: $('.lipstickcolor').val(),
			eyebrowsModel: $('.eyebrow').val(),
			eyebrowintensity: $('.eyebrowintensity').val(),
			eyebrowsColor: $('.eyebrowcolor').val(),
			beardModel: $('.beard').val(),
			beardintentisy: $('.beardintentisy').val(),
			chestModel: $('.chestModel').val(),
			beardColor: $('.beardcolor').val(),
			blushModel: $('.blush').val(),
			blushintentisy: $('.blushintentisy').val(),
			blushColor: $('.blushcolor').val(),
			eyesColor: $('.eyesColor').val()
		}));
	}


	$('.yes').on('click', function (e) {
		e.preventDefault();
		$.post('http://vrp_barbershop/updateSkin', JSON.stringify({
			value: true,
			hairModel: $('.hair').val(),
			firstHairColor: $('.haircolor').val(),
			secondHairColor: $('.haircolor2').val(),
			makeupModel: $('.makeup').val(),
			makeupintensity: $('.makeupintensity').val(),
			makeupcolor: $('.makeupcolor').val(),
			lipstickModel: $('.lipstick').val(),
			lipstickintensity: $('.lipstickintensity').val(),
			lipstickColor: $('.lipstickcolor').val(),
			eyebrowsModel: $('.eyebrow').val(),
			eyebrowintensity: $('.eyebrowintensity').val(),
			eyebrowsColor: $('.eyebrowcolor').val(),
			beardModel: $('.beard').val(),
			beardintentisy: $('.beardintentisy').val(),
			chestModel: $('.chestModel').val(),
			beardColor: $('.beardcolor').val(),
			blushModel: $('.blush').val(),
			blushintentisy: $('.blushintentisy').val(),
			blushColor: $('.blushcolor').val(),
			eyesColor: $('.eyesColor').val()
		}));
		$('.popup').hide();
	});

	document.onkeydown = function (data) {
		if (data.which == 65) {
			$.post('http://vrp_barbershop/rotate', JSON.stringify("right"));
		}
		if (data.which == 68) {
			$.post('http://vrp_barbershop/rotate', JSON.stringify("left"));
		}
		if (data.which == 27) {
			$.post('http://vrp_barbershop/closeNui');
		}
	}



	$('.submit').on('click', function (e) {
		e.preventDefault();
		$('.popup').fadeIn(200).css("display", "flex");
	});


	$('.popup .no').on('click', function (e) {
		e.preventDefault();
		$('.popup').fadeOut(200);
	});

});


$(document).ready(function () {

	function close() {
		$.post('http://vrp_barbershop/closeNui');
	}
	$('.cancel').click(function () {
		close();
	});
});


function setCam(cam) {
	$('.selected').removeClass('selected');
	$('#' + cam).addClass('selected');
	$.post('http://vrp_barbershop/setCam', JSON.stringify({ cam: cam }));
}


var x = 0;
var n = 1000;
$(document).keydown(function(e){
	if (e.which == 40){
		x += n;
		$('#formBarbershop').animate({
			scrollTop: x
		},4000);
	}

	if (e.which == 38){
		x -= n;
		$('#formBarbershop').animate({
			scrollTop: x
		},4000);
	}
});