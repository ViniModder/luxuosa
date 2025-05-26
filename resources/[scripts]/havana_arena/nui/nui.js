$(document).ready(function () {
    window.addEventListener('message', function (event) {
      var data = event.data
      if (data.showArena) {
        const arena = data.arenas
       
        $('#pvpstart').click(function () {
          // Oculta a seção de conteúdo principal
          $('.select-content').hide();
          // Exibe a seção de itens
          $('.itens').fadeIn();
          $('.itens').css('display', 'flex');
      });

      $('#closeitens').click(function () {
        $('.itens').hide();
        $('.select-content').fadeIn();
        $('.select-content').css('display', 'flex');
     
    });

      // Exibe a seção principal
      $('.select').fadeIn();
      $('.select').css('display', 'flex');
        return
      }


      if (data.closeArena) {
        $('body').css('background-color', 'transparent')
        $('.select').fadeOut()
        return
      }
      if (data.closeContadorArena) {
        $('.contador').fadeOut()
        return
      }
      if (data.contadorArena) {
        $('.contador').fadeIn()
        const _0x5273d7 = parseInt(data.tempo, 10)
        let _0x943324 = Math.floor(_0x5273d7 / 3600),
          _0x4d875c = Math.floor((_0x5273d7 - _0x943324 * 3600) / 60),
          _0x55ba57 = _0x5273d7 - _0x943324 * 3600 - _0x4d875c * 60
        _0x943324 < 10 && (_0x943324 = '0' + _0x943324)
        _0x4d875c < 10 && (_0x4d875c = '0' + _0x4d875c)
        _0x55ba57 < 10 && (_0x55ba57 = '0' + _0x55ba57)
        $('#time').html(
          'Tempo Restante: ' + _0x943324 + ':' + _0x4d875c + ':' + _0x55ba57
        )
        return
      }
      if (data.chatKill) {
        $('.chatkill').fadeIn()
        var _0x2a1a15 =
          '\n                <div class="killNotify">\n              <div class="assasino">' +
          data.killer +
          '</div>\n                    <img class="arma" src="images/KILL.png">' +
          '\n      <div class="vitima">' +
          data.vitima +
          '</div>\n                </div>\n            '
        $(_0x2a1a15)
          .appendTo('#chatkill')
          .hide()
          .fadeIn(1000)
          .delay(data.delay)
          .fadeOut(1000)
        return
      }
      if (data.scoreboard) {
        $('.scoreboard').fadeIn()
        $('.scoreboard').html(
          '\n                <div class="scoreboard_title">\n                    <span>' +
            data.dados[0] +
            '</span>\n                    <span>Total de Apostas: R$ ' +
            data.dados[1] +
            '</span>\n                </div>\n\n                <div class="scoreboard_list">\n            \n                </div>\n            '
        )
        let _0x559319 = data.user_list
        for (let _0x4e4768 in _0x559319) {
          $('.scoreboard_list').append(
            '\n                    <div class="ListMembers">' +
              _0x559319[_0x4e4768].identidade +
              ' <br> <small>Kills: ' +
              _0x559319[_0x4e4768].kills +
              '</small></div>\n                '
          )
        }
        return
      }
      if (data.closeScoreboard) {
        $('.scoreboard').fadeOut()
        $('.scoreboard').html('')
        return
      }
    })
    $('#closeselect').click(function (_0x598824) {
      $('.select').is(':visible') &&
        $.post('http://havana_arena/closeNui', JSON.stringify({}))
    })
    document.onkeyup = function (_0x580897) {
      _0x580897.which == 27 &&
        $('.select').is(':visible') &&
          $.post('http://havana_arena/closeNui', JSON.stringify({}))
    }
  })

  $('#aimlab').click(function () {
    $('.select').is(':visible') &&
    $.post('http://havana_arena/closeNui', JSON.stringify({}))
    $.post('http://havana_arena/Startaimlab', JSON.stringify({}))

  })


  $('#rolas').click(function () {
    $('.select').is(':visible') &&
    $.post('http://havana_arena/closeNui', JSON.stringify({}))
    $.post('http://havana_arena/Startrolas', JSON.stringify({}))

  })

  function entrarArena(_0x6e7ce9) {
    $.post('http://havana_arena/closeNui', JSON.stringify({}))
    $.post(
      'http://havana_arena/entrarArena',
      JSON.stringify({ arena: _0x6e7ce9 })
    )
  }
  