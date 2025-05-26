let globalIndex = '';
let globalName = '';

window.addEventListener('message', ({ data }) => {
    if (data.action == 'open') {
        $('#container').css('opacity', '1');

        $('.nameFac').html(data.info.name.toUpperCase());


        $('.listButtons').html('')

        Object.keys(data.info.buttons).map((item, index) => {
            $('.listButtons').append(`
                <button class="select_menu_wrapper" onclick="selectIntercom('${data.info.name}', '${item}', this)">
                    <p>${item}</p>
                </button>
            `);
        })
    }
})


document.onkeyup = function (data) {
    if (data.which == 27) {
        $.post(`http://${window.GetParentResourceName()}/close`, JSON.stringify({}));
        $('#container').css('opacity', '0')
    }
};

const selectIntercom = (name, index, attr) => {
    $('.selected_item').removeClass('selected_item');
    $(attr).addClass('selected_item');

    globalName = name;
    globalIndex = index;
}

const callIntercom = () => {
    console.log(globalIndex, globalName)
    $.post(`http://${window.GetParentResourceName()}/useButton`, JSON.stringify({
        name: globalName,
        button: globalIndex
    }))
}


