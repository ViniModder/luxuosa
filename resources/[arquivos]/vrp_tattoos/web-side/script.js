var oldTattoo = {}
const TattooStore = {
	currentCategory: null,
	selectedTattoos: {},
	categories: {
		"hairs": { "title": "Pigmentação", "available": [] },
		"head": { "title": "Cabeça", "available": [] },
		"torso": { "title": "Peito", "available": [] },
		"leftarm": { "title": "Braço Esquerdo", "available": [] },
		"rightarm": { "title": "Braço Direito", "available": [] },
		"leftleg": { "title": "Perna Esquerda", "available": [] },
		"rightleg": { "title": "Perna Direita", "available": [] }
	},
	changeCategory: function(category){
		$(".category").removeClass("selected");
		TattooStore.currentCategory = category;
		$(".category[category-name='"+category+"']").addClass("selected");

		$("#category-name").html(TattooStore.categories[category]["title"]);

		$("#items").html("");
		$.each(TattooStore.categories[category]["available"],function(index,tattoo){
			let selected =  "";
			let label = index ;

			if(TattooStore.selectedTattoos[tattoo.name])
				selected = " selected";

			$("#items").append(`<div class="item${selected}" tattoo-code="${tattoo.name}" tattoo-category="${category}" tattoo-index="${index}">${label + 1}</div>`);
		});

		TattooStore.loadVariableListeners();
	},
	selectTattoo: function(category,index){
		let item = $(".item[tattoo-category='"+category+"'][tattoo-index='"+index+"']");
		if(item.hasClass("selected")){
			item.removeClass("selected");
			delete TattooStore.selectedTattoos[item.attr("tattoo-code")];
		} else {
			TattooStore.selectedTattoos[item.attr("tattoo-code")] = {};
			item.addClass("selected");
		}

		TattooStore.callServer("changeTattoo",{ type: category, id: index });
	},
	resetTattoos: function(){
		$(".item").removeClass("selected");

		TattooStore.selectedTattoos = {};
		TattooStore.callServer("clearTattoo",{});
	},
	loadStaticListeners: function(){
		$(".category").on("click",function(){
			TattooStore.changeCategory($(this).attr("category-name"));
		});

		$("#reset").on("click",function(){
			TattooStore.resetTattoos();
		});

		$("#cancel").on("click",function(){
			TattooStore.callServer("close",{});
			document.body.style.display = 'none'
		});

		document.onkeydown = function(data) {
			switch(data.keyCode) {
				case 27:
					$("#tattoo-container").removeClass("open");
					TattooStore.callServer("closeNotSave",{});
				break;

				case 68:
					TattooStore.callServer("rotate","left");
				break;

				case 65:
					TattooStore.callServer("rotate","right");
				break;

				case 88:
					TattooStore.callServer("handsup",{});
				break;
			}
		};
	},
	loadVariableListeners: function(){
		$(".item").on("click",function(){
			TattooStore.selectTattoo($(this).attr("tattoo-category"),$(this).attr("tattoo-index"));
		});
	},
	callServer: function(endpoint,data){
		$.post("http://vrp_tattoos/"+endpoint,JSON.stringify(data));
	},
	load: function(tattoos,selectedTattoos,hairs){
		if (hairs) { 
			$(".category[category-name=hairs]").css("display","flex");

			$(".category[category-name=head]").css("display","none");
			$(".category[category-name=torso]").css("display","none");
			$(".category[category-name=leftarm]").css("display","none");
			$(".category[category-name=rightarm]").css("display","none");
			$(".category[category-name=leftleg]").css("display","none");
			$(".category[category-name=rightleg]").css("display","none");
			TattooStore.categories = {
				"hairs": { "title": "Pigmentação", "available": [] },
			}
		} else {
			$(".category[category-name=hairs]").css("display","none");

			$(".category[category-name=head]").css("display","flex");
			$(".category[category-name=torso]").css("display","flex");
			$(".category[category-name=leftarm]").css("display","flex");
			$(".category[category-name=rightarm]").css("display","flex");
			$(".category[category-name=leftleg]").css("display","flex");
			$(".category[category-name=rightleg]").css("display","flex");

			TattooStore.categories = {
				"head": { "title": "Cabeça", "available": [] },
				"torso": { "title": "Peito", "available": [] },
				"leftarm": { "title": "Braço Esquerdo", "available": [] },
				"rightarm": { "title": "Braço Direito", "available": [] },
				"leftleg": { "title": "Perna Esquerda", "available": [] },
				"rightleg": { "title": "Perna Direita", "available": [] }
			}
		}
		

		$("#tattoo-container").addClass("open");
		TattooStore.selectedTattoos = selectedTattoos;

		$.each(tattoos,function(category,element){
			$.each(element.tattoo,function(index,tattoo){
				TattooStore.categories[category]["available"].push(tattoo);
			});
		});

		if (hairs == true) { 
			TattooStore.changeCategory("hairs");
		} else {
			TattooStore.changeCategory("head");
		}



		TattooStore.loadStaticListeners();
	}
};

window.addEventListener("message",function(event){
	if (event.data.hairs == true ) { 
		TattooStore.load(event.data.shop,event.data.tattoo,true);
	} else { 
		TattooStore.load(event.data.shop,event.data.tattoo);
	};
	document.body.style.display = 'block'
	oldTattoo = event.data.tattoo;
});



function save(){
	$("#tattoo-container").removeClass("open");
	TattooStore.callServer("close",{});
	$('.modal-tattoo').fadeOut();
}

function closeNotSave() { 
	$("#tattoo-container").removeClass("open");
	TattooStore.callServer("closeNotSave",{});
}



function openModal(){
	$('.modal-tattoo').css('display', 'flex');

}

function closeModal(){
	$('.modal-tattoo').hide();
}

