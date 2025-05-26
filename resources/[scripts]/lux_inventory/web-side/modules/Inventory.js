class Inventory {
    items;
    maxWeight = 0;
    currentWeight = 0;
    side;

    constructor(data, side = "left") {
        const { inventory, weight, max_weight } = data;
        this.items = this.parseItems(inventory)
        this.maxWeight = max_weight;
        this.currentWeight = weight;
        this.side = side;
        this.renderInfos(side);
        this.renderSlots(side);
    }
    findSlotByItem(name, ignoreSlot) {
        let _slot

        (Object.keys(this.items)).forEach((slot) => {
            if (this.items[slot].item == name && (!ignoreSlot || !ignoreSlot.includes(slot))) {
                _slot = slot
            }
        })

        return _slot
    }
    refreshWeight() {
        if (this.side == "right" && window.classInstances[this.side]?.mode) {
            $(".weight-right").html(`-`);
            $(`.inside-${this.side}`).css("width", `${(0 * 100) / 100}%`);
            return
        }

        this.currentWeight = Object.values(this.items).reduce((total, num) => {
            if (num.weight) {
                return (num.weight * num.amount) + total
            } else {
                return total
            }
        }, 0);

        $(`.weight-${this.side}`).html(`${(this.currentWeight).toFixed(2)}<b>/${this.maxWeight}</b>`);
        $(`.inside-${this.side}`).css("width", `${(this.currentWeight * 100) / this.maxWeight}%`);
    }
    parseItems(items) {
        Object.keys(items).forEach(slot => {
            let itemName = items[slot].item
            items[slot].name = globalThis.Config[itemName]?.name
            if (!items[slot].name) {
                delete items[slot]
            } else {
                items[slot].key = itemName
                items[slot].slot = slot
                items[slot].weight = globalThis.Config[itemName]?.weight
            }
        });
        return items
    }

    renderSlots(target = "left") {
        $(".slots-" + target).html('');
        console.log(target)
        $(".slots-keybar-" + target).html('');
        for (let i = 0; i < 50; i++) {
            let slot = i + 1

            if (!this.items[slot.toString()] || (this.items[slot.toString()] && globalThis.Config[this.items[slot.toString()].item])) {

                if (this.items[slot.toString()]) {
                    const item = this.items[slot.toString()];
                    if (slot <= 5 && target == 'left') $(".slots-keybar-" + target).append(this.getItemHtml(item, target, slot));
                    else $(".slots-" + target).append(this.getItemHtml(item, target, slot));
                } else {
                    $(`${slot <= 5 && target == 'left' ? ".slots-keybar-" + target : ".slots-" + target}`).append(`<div class="slot ${slot <= 5 && target == 'left' ? 'slot-keybar' : ''} ${target == 'right' ? 'slot-right' : ''} empty slot-${target}${slot}" data-side="${target}" data-id="${slot}">
                        ${slot <= 5 && target == 'left' ? `
                            <p class="key">${slot}</p>
                            <b>SLOT VAZIO</b>
                        ` : ''}
                    </div>`);

                }
            }
        }
        this.refreshWeight()
        this.updateDrag(target);
    }

    removeItem(slot, amount) {
        this.items[slot].amount -= amount;
        if (this.items[slot].item == "mochila") {
            if (this.maxWeight <= 25) {
                this.maxWeight = 50
            } else if (this.maxWeight == 50) {
                this.maxWeight = 75
            } else if (this.maxWeight == 75) {
                this.maxWeight = 90
            }
        }
        if (this.items[slot].amount <= 0) {
            delete this.items[slot];
        }
        this.renderSlots(this.side);
    }

    getItemHtml(item, target, slot, method = "allDiv") {
        if (method == "onlyItems") {
            return `
                ${slot <= 5 && target == 'left' ? `<p class="key">${slot}</p>` : ''}
                <div class="amount-circle">${((!item.price) ? item.amount + "x" : "R$" + item.price)}</div>
                <img src="http://189.127.165.210/inventario/${item.item}.png" onerror="this.src='../assets/images/no_image.png'"/>
                <p>${item.name}</p>
            `
        }
        return `
            <div class="slot slot-keybar slot-${target} slot-item slot-${target}${slot}" data-side="${target}" data-id="${slot}">
                ${slot <= 5 && target == 'left' ? `<p class="key">${slot}</p>` : ''}
                <div class="amount-circle">${((!item.price) ? item.amount + "x" : "R$" + item.price)}</div>
                <img src="http://189.127.165.210/inventario/${item.item}.png" onerror="this.src='../assets/images/no_image.png'"/>
                <p>${item.name}</p>      
            </div>
        `
    }

    renderInfos(side) {
        if (this.side == "right" && window.classInstances[this.side]?.mode) {
            $(".weight-right").html(`-`);
            $(`.inside-${this.side}`).css("width", `${(0 * 100) / 100}%`);
            return
        }
        this.refreshWeight();
        if (side == "left") {
            $(".input-frame").val("");
            $(".weight-left").html(`${this.currentWeight}<b>/${this.maxWeight}</b>`);
            $(".inside-left").css("width", `${(this.currentWeight * 100) / this.maxWeight}%`);
        } else {
            $(".left-main").css("display", "none");
            $(".add-main").css("display", "flex");
            $(".weight-right").html(`${this.currentWeight}<b>/${this.maxWeight}</b>`);
            $(".inside-right").css("width", `${(this.currentWeight * 100) / this.maxWeight}%`);
        }
    }

    getItems() {
        return this.items
    }

    selectItem(side, itemId) {
        if (!this.items[itemId]) return
        const item = { ...this.items[itemId], id: itemId, side };
        $(".slot").removeClass('slot-active');

        globalThis.SelectedItem = item;
        $('.name-frame').html(globalThis.SelectedItem.name);
        $('.weight-frame').html(`${(globalThis.SelectedItem.weight || 0).toFixed(1)} kg`);
        $('.circle-quantity').html((globalThis.SelectedItem.amount) ? globalThis.SelectedItem.amount + "x" : "R$" + globalThis.SelectedItem.price);
        $('.image-grame').attr('src', `http://189.127.165.210/inventario/${globalThis.SelectedItem.item}.png`);
        $(`.slot-${side}${item.id}`).addClass('slot-active');
    }

    async changeItemPos(old, next, keyPressed) {
        if (old.side == next.side) {
            old.item = this.items[(old.id).toString()]
            next.item = this.items[(next.id).toString()]
            let inputValue = parseInt($('.input-frame').val()) > 0 ? parseInt($('.input-frame').val()) : old.item.amount
            if (keyPressed == 'ctrl' && old.item.amount % 2 == 0) {
                inputValue = old.item.amount / 2
            } else if (keyPressed == 'shift') {
                inputValue = 1
            }
            if (inputValue > old.item.amount) { inputValue = old.item.amount }
            // if (old.side == "right" && window.classInstances[old.side]?.mode) return false
            if (old.side == "right" && next.side == "right") {
                return false; // Impede a movimentação de right para right   -- malvadao novo
            }
            const response = old.side == "right" || await Client("SWAP_SLOT", { from_slot: old.id, from_amount: inputValue, to_slot: next.id });
            if (!response) {
                console.log("retornou false")
                return false
            }
            if (!next.item) {
                if (old.item.amount <= inputValue) {
                    let html = $(`.slot-${old.side}${old.id}`).html()
                    $(`.slot-${old.side}${old.id}`).removeClass('slot-item').addClass('empty').html(``);
                    $(`.slot-${next.side}${next.id}`).html(html).removeClass("empty").addClass("slot-item").addClass("slot-" + next.side);
                    this.items[(next.id).toString()] = this.items[(old.id).toString()]
                    delete this.items[(old.id).toString()]
                } else {
                    this.items[(old.id).toString()].amount -= inputValue
                    this.items[(next.id).toString()] = {}
                    Object.assign(this.items[(next.id).toString()], this.items[(old.id).toString()], { amount: inputValue })
                    $(`.slot-${next.side}${next.id}`).html(this.getItemHtml(this.items[(next.id).toString()], next.side, next.id, "onlyItems")).removeClass("empty").addClass("slot-item").addClass("slot-" + next.side);
                    $(`.slot-${old.side}${old.id}`).html(this.getItemHtml(this.items[(old.id).toString()], old.side, old.id, "onlyItems")).removeClass("empty").addClass("slot-item").addClass("slot-" + next.side);
                }
            } else if (old.item.item == next.item.item) {
                if (old.item.amount <= inputValue) {
                    this.items[(next.id).toString()].amount += inputValue
                    let html = this.getItemHtml(this.items[(next.id).toString()], next.side, next.id, "onlyItems")
                    $(`.slot-${old.side}${old.id}`).removeClass('slot-item').addClass('empty').html(``);
                    $(`.slot-${next.side}${next.id}`).html(html).removeClass("empty").addClass("slot-item").addClass("slot-" + next.side);
                    delete this.items[(old.id).toString()]
                } else {
                    this.items[(old.id).toString()].amount -= inputValue
                    this.items[(next.id).toString()].amount += inputValue
                    Object.assign(this.items[(next.id).toString()], this.items[(old.id).toString()], { amount: inputValue })
                    $(`.slot-${next.side}${next.id}`).html(this.getItemHtml(this.items[(next.id).toString()], next.side, next.id, "onlyItems")).removeClass("empty").addClass("slot-item").addClass("slot-" + next.side);
                    $(`.slot-${old.side}${old.id}`).html(this.getItemHtml(this.items[(old.id).toString()], old.side, old.id, "onlyItems")).removeClass("empty").addClass("slot-item").addClass("slot-" + next.side);

                }
            } else if (old.item.item !== next.item.item) {
                let oldHtml = $(`.slot-${old.side}${old.id}`).html()
                let nextHtml = $(`.slot-${next.side}${next.id}`).html()
                $(`.slot-${next.side}${next.id}`).html(oldHtml)
                $(`.slot-${old.side}${old.id}`).html(nextHtml)
                let oldObj = JSON.parse(JSON.stringify(this.items[(old.id).toString()]))
                let nextObj = JSON.parse(JSON.stringify(this.items[(next.id).toString()]))
                nextObj.slot = next.id
                oldObj.slot = old.id
                this.items[(next.id).toString()] = oldObj
                this.items[(old.id).toString()] = nextObj
            }
            this.updateDrag(old.side)
        }
        if (old.side == "left" && next.side == "right") {
            old.item = this.items[(old.id).toString()]
            let inputValue = parseInt($('.input-frame').val()) > 0 ? parseInt($('.input-frame').val()) : old.item.amount
            if (keyPressed == 'ctrl' && old.item.amount % 2 == 0) {
                inputValue = old.item.amount / 2
            } else if (keyPressed == 'shift') {
                inputValue = 1
            }
            if (inputValue > old.item.amount) {
                inputValue = old.item.amount
            }
            await window.classInstances["right"].putItem(old.id, inputValue, next.id)
        }

        if (old.side == "right" && next.side == "left") {
            if (window.classInstances["right"].mode) {
                // Loja
                let inputValue = parseInt($('.input-frame').val()) > 0 ? parseInt($('.input-frame').val()) : 1
                if (keyPressed == 'ctrl' && old.item.amount % 2 == 0) {
                    inputValue = old.item.amount / 2
                } else if (keyPressed == 'shift') {
                    inputValue = 1
                }
                await window.classInstances["right"].takeItem(old.id, inputValue, next.id)
            } else {
                old.item = window.classInstances["right"].items[(old.id).toString()]
                let inputValue = parseInt($('.input-frame').val()) > 0 ? parseInt($('.input-frame').val()) : old.item.amount
                if (keyPressed == 'ctrl' && old.item.amount % 2 == 0) {
                    inputValue = old.item.amount / 2
                } else if (keyPressed == 'shift') {
                    inputValue = 1
                }
                await window.classInstances["right"].takeItem(old.id, inputValue, next.id)
            }
        }

        this.renderSlots(this.side);

    }
    updateDrag(target) {

        $(`.slot-${target}`).draggable({
            disabled: false,
            containment: '.container',
            cursorAt: { top: Math.floor($(`.slot-${target}`).height() / 2), left: Math.floor($(`.slot-${target}`).width() / 2) },
            start: (event, ui) => {
                this.selectItem(event.currentTarget.dataset.side, event.currentTarget.dataset.id)
            },
            opacity: 0.7,
            cursor: 'grabbing',
            helper: 'clone',
            revert: 'invalid',
        });


        $(`.slot`).droppable({
            accept: ".slot-item",
            greedy: false,

            drop: async (event, ui) => {
                const droppable = $(event.target);
                const container = $('.slots-left');
                const containerRight = $('.slots-right');

                if (droppable.hasClass('slot-keybar')) {
                    await performDropAction(event, ui);
                    return;
                }

                if (!isElementVisibleInContainer(droppable, container) && !isElementVisibleInContainer(droppable, containerRight)) {
                    return;
                }


                await performDropAction(event, ui);
            },
        });

        $(".left-content").droppable({
            accept: ".slot-left",
            drop: async (event, ui) => {
                const self = window.classInstances[ui.draggable.data('side')]
                if (!self || ui.draggable.data('side') !== "left") return
                if (!globalThis.SelectedItem || globalThis.SelectedItem.side !== "left") return Notify("Selecione um item do seu inventário primeiro!", "error");

                let { item, id } = globalThis.SelectedItem;
                let inputValue = 1
                if (!window.classInstances["left"].items[id]) {
                    id = window.classInstances["left"].findSlotByItem(item)
                    if (!id) return Notify("Selecione um item do seu inventário primeiro!", "error");
                };
                if (globalThis.Config[item]?.type !== "equip") {
                    Notify("Este item não pode ser equipado!", "error");
                    return;
                }

                const response = await Client("USE_ITEM", { slot: id, item: item, amount: inputValue })
                if (typeof response !== "boolean" && response?.error) {
                    Notify(response.error, "error");
                    return
                }
                if (!response) {
                    return;
                }
                if(response){
                    window.classInstances["left"].removeItem(id, response?.used_amount || inputValue)
                    if(action == "USE_ITEM" && (globalThis.Config[item]?.type == "equipar" || globalThis.Config[item]?.type == "recarregar" || globalThis.Config[item]?.type == "recharge" || globalThis.Config[item]?.type == "equip")){
                        window.classInstances["weapons"] = new Weapons(await Client("GET_WEAPONS"))
                    }
                }
            }
        });

        $(`.action-button`).droppable({
            accept: ".slot-left",
            drop: async (event, ui) => {
                const self = window.classInstances[ui.draggable.data('side')]
                if (!self || ui.draggable.data('side') !== "left") return
                self.selectItem("left", ui.draggable.data('id'));

                if (!globalThis.SelectedItem || globalThis.SelectedItem.side !== "left") return Notify("Selecione um item do seu inventário primeiro!", "error");
                let { item, id } = globalThis.SelectedItem;
                if (!window.classInstances["left"].items[id]) {
                    id = window.classInstances["left"].findSlotByItem(item)
                    if (!id) return Notify("Selecione um item do seu inventário primeiro!", "error");
                };
                let inputValue = parseInt($('.input-frame').val()) > 0 ? parseInt($('.input-frame').val()) : globalThis.SelectedItem.amount
                inputValue = inputValue > globalThis.SelectedItem.amount ? globalThis.SelectedItem.amount : inputValue

                const action = event.target.dataset.route;

                const response = await Client(action, { slot: id, item: item, amount: inputValue })
                if (typeof response !== "boolean" && response?.error) {
                    Notify(response.error, "error");
                    return
                }
                if (!response) {
                    return;
                }
                if(response){
                    window.classInstances["left"].removeItem(id, response?.used_amount || inputValue)
                    if(action == "USE_ITEM" && (globalThis.Config[item]?.type == "equipar" || globalThis.Config[item]?.type == "recarregar" || globalThis.Config[item]?.type == "recharge" || globalThis.Config[item]?.type == "equip")){
                        window.classInstances["weapons"] = new Weapons(await Client("GET_WEAPONS"))
                    }
                }

            },
        });

        $(`.empty`).draggable({
            disabled: true
        });
    }

}


$('.slots-left').scroll(function () {
    var alturaDoGatilho = 300; // por exemplo, 300px de rolagem
    if ($(window).scrollTop() >= alturaDoGatilho) {
        $(window).off('scroll');
    }
});


function isElementVisibleInContainer(element, container) {
    var elementRect = element[0].getBoundingClientRect();
    var containerRect = container[0].getBoundingClientRect();
    

    console.log(elementRect.top >= containerRect.top &&
        elementRect.left >= containerRect.left &&
        elementRect.bottom <= containerRect.bottom &&
        elementRect.right <= containerRect.right)
    return (
        elementRect.top >= containerRect.top &&
        elementRect.left >= containerRect.left &&
        elementRect.bottom <= containerRect.bottom &&
        elementRect.right <= containerRect.right
    );
}

async function performDropAction(event, ui) {
    const self = window.classInstances[ui.draggable.data('side')];
    if (!self) return;
    const id = ui.draggable.data('id');
    await self.changeItemPos({ side: ui.draggable.data('side'), id }, { side: event.target.dataset.side, id: event.target.dataset.id }, (event.ctrlKey ? 'ctrl' : event.ctrlKey || event.shiftKey ? 'shift' : event.shiftKey));
    if (ui.draggable.data('side') !== event.target.dataset.side) {
        window.classInstances[event.target.dataset.side].selectItem(event.target.dataset.side, event.target.dataset.id);
    } else {
        self.selectItem(event.target.dataset.side, event.target.dataset.id);
    }
}