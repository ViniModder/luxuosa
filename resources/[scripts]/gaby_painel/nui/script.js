var app = new Vue({
    el: '#app',
    data: {
        show: false,
        label: 'geral',
        playerson: [],
        itemlist: [],
        groups_server: [],
        groups_player: [],
        locais: [],
        qtd_box: false,
        id_box: false,
        totalplayers: 0,
        totalstaffs: 0,
        carlist: [],
        skinlist: []
    },
    methods: {
      image_car: function (name) {
        return `http://189.127.165.210/carros/${name}.png`;
      },
    }
  })

  function spawncar_setskin(act,data){

    app.show = false
    app.label = 'geral'
  
    if(act == 'spawncar'){
      $.post('http://gaby_painel/mg_spawncar_setskin',JSON.stringify({act,data}))
    }else if(act == 'setskin'){
      $.post('http://gaby_painel/mg_spawncar_setskin',JSON.stringify({act,data}))
    }
  }


function button_players(id,act){

  app.show = false
  app.label = 'geral'

  if(act == 'tpto'){
    $.post('http://gaby_painel/mgpc:tpto',JSON.stringify(id))
  }else if(act == 'tptome'){
    $.post('http://gaby_painel/mgpc:tptome',JSON.stringify(id))
  }else if(act == 'revive'){
    $.post('http://gaby_painel/mgpc:revive',JSON.stringify(id))
  }


}


  function confirm_label(value) {

    app.label = value

    if(value == 'playerson'){
      app.qtd_box = false
      app.groups_player = []
      app.groups_server = []
    }else if(value == 'itens'){
      app.itemlist.sort()
      app.groups_player = []
      app.groups_server = []
    }else if(value == 'setagem'){
      app.qtd_box = false
    }else if(value == 'locais'){
      app.qtd_box = false
      app.groups_player = []
      app.groups_server = []
    }else if(value == 'geral'){
      app.qtd_box = false
      app.groups_player = []
      app.groups_server = []
    }
    

  }

  function confirm_item(value) {

    item = value

    if (!app.qtd_box){
      app.qtd_box = true
    }

  }

  function confirm_qtd() {

    const result = document.querySelector("#input_qtd")
    const qtd = result.value

    if (app.qtd_box){
      app.qtd_box = false
    }

    $.post('http://gaby_painel/mgpc:c_giveitem', JSON.stringify({item,qtd}))



  }

  function close_boxqtd(){
    app.qtd_box = false
  }

  function open_idbox(value) {

    data_act = value

    if (!app.id_box){
      app.id_box = true
    }

  }  

  function confirm_idplayer() {

    const result = document.querySelector("#input_id")
    var idplayer = result.value

    if(data_act == 'tpcds'||'tpway'||'fix'||'tuning'||'hash'||'presetclothes'){
      app.show = false
      app.qtd_box = false
      app.label = 'geral'
      $.post('http://gaby_painel/close')
    }
    if (app.id_box){
      app.id_box = false
    }
    $.post('http://gaby_painel/mgpc:c_confirmgeral',JSON.stringify({idplayer,data_act}))
  }

  function confirm_geral_direct(data_act) {

    var idplayer = 1

    if(data_act == 'tpcds'||'tpway'||'fix'||'tuning'||'hash'||'presetclothes'){
      app.show = false
      app.qtd_box = false
      app.label = 'geral'
      $.post('http://gaby_painel/close')
    }

    if (app.id_box){
      app.id_box = false
    }

    $.post('http://gaby_painel/mgpc:c_confirmgeral',JSON.stringify({idplayer,data_act}))

  }

  function close_boxidplayer(){
    app.id_box = false
  }

  function button_getstaffs(){
    $.post('http://gaby_painel/get_staffson')
  }


  function att_groups(){

    var idplayerg = document.querySelector("#input_id_groupbox")
    var idplayer = idplayerg.value

    $.post('http://gaby_painel/att_groups_player',JSON.stringify(idplayer))

  }
  
  function add_rem_group(group,type){

    var idplayerg = document.querySelector("#input_id_groupbox")
    var idplayer = idplayerg.value

    if(type == 'addgroup'){
        $.post('http://gaby_painel/addusergroup',JSON.stringify({idplayer,group}))
        $.post('http://gaby_painel/att_groups_player',JSON.stringify(idplayer))
      }else if(type == 'remgroup'){
        $.post('http://gaby_painel/remusergroup',JSON.stringify({idplayer,group}))
        $.post('http://gaby_painel/att_groups_player',JSON.stringify(idplayer))
      }
  }

  function tp_loc(cds,tipo,nome){
    var cds = cds
    var tipo = tipo
    var nome = nome

    $.post('http://gaby_painel/tp_to_loc', JSON.stringify({cds,tipo,nome}))
      
    close()
  }

  function close() {
    app.show = false
    app.qtd_box = false
    app.label = 'geral'
    app.groups_player = []
    app.groups_server = []
    $.post("http://gaby_painel/close", JSON.stringify())
  }


  document.addEventListener("DOMContentLoaded", function(){

    window.addEventListener("message", function(event) {

    app.show = event.data.showNUI
    
    if(app.show) {
        app.table = event.data.table
        app.playerson = event.data.inf_ply
        app.totalplayers = event.data.total_p
        app.totalstaffs = event.data.total_s
        app.itemlist = event.data.itemlist
        app.groups_server = event.data.server_groups
        app.locais = event.data.locais
        app.carlist = event.data.carlist
        app.skinlist = event.data.skinlist
    }

    if(event.data.playergroups){
      app.groups_player = event.data.playergroups
    }

    
    document.onkeyup = function(data) {
      if (data.which == 27) {
        close()
      }
    }


    })
  })


