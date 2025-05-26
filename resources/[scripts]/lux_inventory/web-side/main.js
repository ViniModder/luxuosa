window.classInstances = {};
globalThis.SelectedItem = {}

const Routes = {
    "OPEN_INVENTORY": async function(payload){
        const userInventory = await Client("GET_INVENTORY")
        $(".left-main").css("display", "flex");
        window.classInstances["weapons"] = new Weapons(await Client("GET_WEAPONS"))
        window.classInstances["left"] = new Inventory(userInventory)
        $("#inventory").show()
    },
    "OPEN_CHEST": async function(payload){
        $(".left-main").css("display", "none");
        let userInventory = await Client("GET_INVENTORY")
        window.classInstances["left"] = new Inventory(userInventory)
        window.classInstances["right"] = new Chest(payload)
        $("#inventory").show()
    },    
    "CLOSE_INVENTORY": async function(payload){
        const ignoreRight = payload.ignoreRight || false
        Client("CLOSE_INVENTORY",{
            right: ignoreRight || window.classInstances.hasOwnProperty("right")
        })
        window.classInstances = {}
        $(".left-main").css("display", "none");
        $(".add-main").css("display","none");

        $("#inventory").hide()
    },
    "OPEN_INSPECT": async function(payload){
        $(".left-main").css("display", "none");
        window.classInstances["left"] = new Inventory(payload.source)
        window.classInstances["right"] = new Inspect(payload.target)
        $("#inventory").show()
    },
    "OPEN_SHOP": async function(payload){
        $(".left-main").css("display", "none");
        let userInventory = await Client("GET_INVENTORY")
        window.classInstances["left"] = new Inventory(userInventory)
        window.classInstances["right"] = new Shop(payload)
        $("#inventory").show()
    },
    "FORCE_UPDATE_INVENTORY": async function(payload){
        if(window.classInstances["left"] && $("#inventory").is(":visible")){
            let userInventory = await Client("GET_INVENTORY")
            window.classInstances["left"] = new Inventory(userInventory)
        }
    }
}

$(() => {
    window.addEventListener('message', async ({ data }) => {
        const {route, payload = {}} = data;
        if(!globalThis.Config){
            globalThis.Config = await Client("REQUEST_ITEMS_CONFIG")
        }
        if(Routes[route]){
            try{
                await Routes[route](payload)
            }catch(err){
                console.log("Um erro foi detectado!")
                console.log(err)
            }
        }
    })

    document.addEventListener('keydown', ({key}) => {
        if (key === 'Escape') {
            Client("CLOSE_INVENTORY",{
                right: window.classInstances.hasOwnProperty("right")
            })
            window.classInstances = {}
            $(".left-main").css("display", "none");
            $(".add-main").css("display","none");

            $("#inventory").hide()
        }
    })

});

function Close(){
    Client("CLOSE_INVENTORY",{
        right: window.classInstances.hasOwnProperty("right")
    })
    window.classInstances = {}
    $(".left-main").css("display", "none");
    $(".add-main").css("display","none");

    $("#inventory").hide()
}

$(".action-button").click(async function(){
    if(!globalThis.InternetStatus){
        Notify("Sem conexão com a internet!","error")
        return
    }

    if(!globalThis.SelectedItem || globalThis.SelectedItem.side !== "left") return Notify("Selecione um item do seu inventário primeiro!", "error");
    let {item, id} = globalThis.SelectedItem;
    if(!window.classInstances["left"].items[id]) {
        id = window.classInstances["left"].findSlotByItem(item)
        if(!id) return Notify("Selecione um item do seu inventário primeiro!", "error");
    };
    let inputValue = parseInt($('.input-frame').val()) > 0 ? parseInt($('.input-frame').val()) : globalThis.SelectedItem.amount
    inputValue = inputValue > globalThis.SelectedItem.amount ? globalThis.SelectedItem.amount : inputValue

    const action = $(this).data("route");

    const response = await Client(action, {slot: id, item: item, amount: inputValue})
    if(typeof response !== "boolean" && response?.error){
        Notify(response.error,"error");
        return
    }
    if(!response){
        return;
    }
    if(response){
        window.classInstances["left"].removeItem(id, response?.used_amount || inputValue)
        if(action == "USE_ITEM" && (globalThis.Config[item]?.type == "equip" || globalThis.Config[item]?.type == "recharge")){
            window.classInstances["weapons"] = new Weapons(await Client("GET_WEAPONS"))
        }
    }
})

$(document).on("click", ".slot-left" , function() {
    window.classInstances["left"].selectItem("left",$(this).data("id"))
})

$(document).on("click", ".slot-right" , function() {
    window.classInstances["right"].selectItem("right",$(this).data("id"))
})

async function Client(route, body = {}){
    if(!globalThis.InternetStatus){
        Notify("Sem conexão com a internet!","error")
        return
    }
    const res = await fetch(`http://${window.GetParentResourceName()}/${route}`,{
        method: 'POST',
        headers: {
            'Content-type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify(body)
    })

    const response = await res.json()
    if(route == "USE_ITEM" && !window.classInstances["left"]) return false
    return response
}