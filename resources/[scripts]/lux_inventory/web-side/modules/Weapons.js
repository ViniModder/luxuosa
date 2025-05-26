class Weapons {
    weapons;
    selected;
    constructor(weapons) {
        this.weapons = weapons
        this.renderWeapons()
    }
    async manageWeapons(type = "selected"){
        if(!globalThis.InternetStatus){
            Notify("Sem conexão com a internet!","error")
            return
        }
        if(type == "selected"){
            const response = await Client("MANAGE_WEAPONS", {weapons: [this.selected]})
            if(!response || response?.error){
                Notify(response?.error || "Erro","error");
                return
            }
            if(response.success){
                delete this.weapons[this.selected]
                this.renderWeapons()
                window.classInstances["left"] = new Inventory(await Client("GET_INVENTORY"))
            }
        }else if(type == "all"){
            const response = await Client("MANAGE_WEAPONS", {weapons: Object.keys(this.weapons)})
            if(!response || response?.error){
                Notify(response?.error || "Erro","error");
                return
            }
            if(response.success){
                this.weapons = {}
                this.renderWeapons()
                window.classInstances["left"] = new Inventory(await Client("GET_INVENTORY"))
            }
        }
    }
    renderWeapons(){
        $(".left-content").html('')
        Object.keys(this.weapons).forEach(weapon => {
            if(!weapon.includes("PARACHUTE")){
                let weaponData = this.weapons[weapon]
                let weaponConfig = {}
                let weaponName = weapon.replace("WEAPON_","WEAPON_").toLowerCase()
                if(globalThis.Config[weapon]){
                    weaponConfig.name = globalThis.Config[weapon].name
                }
                let weaponElement = $(`
                <div class="slot-content slot-weapon" data-weapon="${weapon}">
                    <div class="weapon-name">${weaponConfig.name}</div>
                    <div class="ammo-area">
                        <p class="ammo-quantity">X${weaponData.ammo}</p>
                    </div>
                    <img src="http://189.127.165.210/inventario/${weaponName}.png" onerror="this.src='../assets/images/no_image.png'"/>
                </div>
                `)
                $(".left-content").append(weaponElement)
            }
        })

     
    }


}
$(document).on("click", ".slot-weapon" , function() {
    $(".selected-weapon").removeClass("selected-weapon")
    $(this).addClass("selected-weapon")
    window.classInstances["weapons"].selected = $(this).data("weapon")
})
$(".button-left-red").on("click", async () => window.classInstances["weapons"].manageWeapons("selected"))
$(".button-left-black").on("click", async () => window.classInstances["weapons"].manageWeapons("all"))