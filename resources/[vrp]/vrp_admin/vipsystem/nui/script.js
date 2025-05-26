const CONTAINER_REF = '#container'
let selectedItem
let data

$(() => {


    $('.select_menu_wrapper').click(() => {
        if(data.length > 1){ 
            const isOpened = $('.select_menu_wrapper').data('opened')
        
            if(isOpened){
              $('.select_menu_popup').css('display', 'none')
              $('.select_menu_wrapper').data('opened', false)
              return
            }
        
            $('.select_menu_popup').css('display', 'flex')
            $('.select_menu_wrapper').data('opened', true)
        }
    })

    $('.confirm').click(async () => {
        const res = await fetchNui("onSelectRecruitment", selectedItem)
        if(!res) return;

        closeUi()
    })

    window.addEventListener('message', function (event) {
        const message = event.data

        if(message.action == 'openRecruitment') {
            $(CONTAINER_REF).animate({
                opacity: 1
            })
            
            data = undefined;
            $(".title").html(message.title || "Recrutamento")
            if(!message.data || message.data.length <= 0) return
            data = message.data;
            $(".select_menu_wrapper").empty();

            $(".select_menu_wrapper").append(`
                <p class='selected_item'></p>
                ${message.data.length > 1 ? `
                    <svg xmlns="http://www.w3.org/2000/svg" width="12" height="10" viewBox="0 0 12 10" fill="none">
                        <path d="M5.62917 9.75L0 9.84234e-07L11.2583 0L5.62917 9.75Z" fill="#D9D9D9" />
                    </svg>
                ` : ""}
                <div class='select_menu_popup'></div>
            `)

            $(".select_menu_popup").empty()
            $(".selected_item").html(message.data[0])
            selectedItem = message.data[0]
            

            message.data.forEach(item => {
                $('.select_menu_popup').append(`
                    <button class='select_menu_popup_item' data-index='${item}'>${item}</button>
                `)
            })

            $('.select_menu_popup_item').click((e) => {
                const itemId = $(e.target).data('index')
                $(".selected_item").html(itemId)
                selectedItem = itemId
            })

        }

        if(message.action == 'openVip'){
            openNavigator()
        }

        if(message.action == 'openInvite'){
            window.invokeNative('openUrl', message.disc)
        }
    })

    window.addEventListener('keydown', (event) => {
        if(['Escape'].includes(event.code)) {
            closeUi()
        }
    })
})

function openNavigator() {
    window.invokeNative('openUrl', "https://luxuosarj.hydrus.gg/")
}

function closeUi() {
    $(CONTAINER_REF).animate({
        opacity: 0
    })
    
    fetchNui('close')
}

function fetchNui(event, data) {
    return $.post(`http://${window.GetParentResourceName()}/${event}`, JSON.stringify(data || {}))
}