const app = {
  ranksOfRole: [],
  open: function ({ user, members, requests, ranks }) {
    app.ranksOfRole = ranks;

    document.body.style.display = 'flex';

    app.dashboard.members.length = 0
    app.registers.requests.length = 0

    app.dashboard.members.push(...Object.values(members))
    app.registers.requests.push(...Object.values(requests))

    app.dashboard.constructElements()

    app.dashboard.reloadMembers()
    app.registers.reloadRequests()
    document.querySelector('section.sidebar .profile .infos .name').innerHTML = `
      <h3>${user.name}</h3>
      <p>${user.role}</p>
    `;
    
    // document.querySelector('section.sidebar .profile .infos .uptime span').innerText = `${String(atualTime.getHours()).padStart(2, '0')}:${String(atualTime.getMinutes()).padStart(2, '0')}:${String(atualTime.getSeconds()).padStart(2, '0')}`
    document.querySelector('section.sidebar .profile .infos .uptime span').innerText = `${user.atualtime.hour-user.uptime.hour}:${user.atualtime.min-user.uptime.min}`
    if (!user.isAdmin) {
      document.querySelector('.members #actions').style.display = 'none';
    } else {
      const indexOfRole = user.isAdmin ? this.ranksOfRole.length + 1 : this.ranksOfRole.findIndex(r => r.toLowerCase() == user.role.toLowerCase())
      document.querySelector('.container > .invite > div > select#inputGroups').innerHTML =
        this.ranksOfRole
          .filter((_, i) => {
            if (user.isAdmin) return true
            return i < indexOfRole
          })
          .map((rank) => `
            <option value = '${rank}'>
              ${rank}
            </option>
          `)
          .join(' ');
    }
  },

  close: function () {
    document.body.style.display = 'none';
    window.location.reload();
  },

  post: function (url, body) {
    return fetch('https://lux-mdt/' + url, {
      method: 'POST',
      body: JSON.stringify(body)
    })
  },

  dashboard: {
    members: [],

    constructElements: function () {
      const onlineContainer = document.querySelector(`#dashboard .members .tbody[data-status="1"]`)
      const offlineContainer = document.querySelector(`#dashboard .members .tbody[data-status="0"]`)

      onlineContainer.innerHTML = '';
      offlineContainer.innerHTML = '';

      const membersOffline = this.members.filter(member => member.status == 0)
      const membersOnline = this.members.filter(member => member.status == 1)

      offlineContainer.innerHTML = `
        ${membersOffline.map(member => `
          <div class = 'member'>
            <span>${member.name}</span>
            <span>${member.id}</span>
            <span>${member.role}</span>
            <span>${member.last_login}</span>
          </div>
        `).join("\n")}
      `;

      onlineContainer.innerHTML = `
        ${membersOnline.map(member => `
          <div class = 'member'>
            <span>${member.name}</span>
            <span>${member.id}</span>
            <span>${member.role}</span>
            <span>${member.last_login}</span>
          </div>
        `).join("\n")}
      `;

      document.querySelector('#dashboard .header .actives').innerHTML =
        `${membersOnline.length}/<b>${this.members.length}</b>`
    },

    selectMenu: function (element, menuId) {
      if (element.classList.contains(menuId)) return;

      document.querySelector('.sidebar ul li.selected')?.classList.remove('selected')
      element.classList.add('selected')

      document.querySelector('section.content > div.selected')?.classList.remove('selected')
      document.querySelector('section.content > #' + menuId)?.classList.add('selected')
    },
    filterMembers: function (element, status) {
      app.dashboard.reloadMembers(status)
      document.querySelector('#dashboard .members .filter button.selected')?.classList.remove('selected')
      element.classList.add('selected')
    },
    filterSearch: function (element) {
      const value = element.value;
      document.querySelectorAll(`#dashboard .members .tbody`).forEach((el) => el.style.display = 'none')
      const container = document.querySelector('#dashboard .members .tbody[data-status="search"]')
      container.style.display = 'flex'
      container.innerHTML = ''
      const filteredMembers = app.dashboard.members.filter(member =>
        String(member.id).includes(value)
        || member.name.toLowerCase().includes(value)
        || member.role.toLowerCase().includes(value)
      )
      for (const member of filteredMembers) {
        container.innerHTML += `
          <div class = 'member'>
            <span>${member.name}</span>
            <span>${member.id}</span>
            <span>${member.role}</span>
            <span>${member.last_login}</span>
          </div>
        `;
      }
    },
    reloadMembers: function (status = 1) {
      document.querySelectorAll(`#dashboard .members .tbody`).forEach((el) => el.style.display = 'none')

      const container = document.querySelector(`#dashboard .members .tbody[data-status="${status}"]`)
      container.style.display = 'flex'
    },
    pressCode: function (code) {
      app.post('pressCode', {
        code: code.toUpperCase(),
      })
    },
    demote: function () {
      app.post('demote')
      app.close()
      app.post('close')
    }
  },

  consult: {
    selectCategory: function (element, type) {
      if (element.classList.contains('selected')) return;

      document.querySelector('#consult .content .categories div.selected').classList.remove('selected')
      element.classList.add('selected')

      document.querySelector('#consult .content input.selected').classList.remove('selected')
      document.querySelector('#consult .content input#' + type).classList.add('selected')
    },

    search: function (type) {
      const searchInput = document.querySelector('#consult .content input#' + type)
      app.post('consult', {
        type,
        value: searchInput.value,
      })
        .then(res => res.json())
        .then(res => {
          if (type === 'prisons') {
            const finalMessage = Object.entries(res).map(([key, value]) => {
              const time = new Date(Number(key) * 1000)
              return `
                <div class = 'item'>
                  <span>${value.dia}/${value.mes}/${value.ano}</span>
                  <span>${value.motivo}</span>
                </div>
              `;
            })
            document.querySelector('#consult .content .result .result-text').innerHTML = `
              ${res.length !== 0 ? `
                <div class = 'list'>
                  ${finalMessage.join('')}
                </div>
              `: 'Nenhuma prisão!'}
            `;
          } else if (type === 'identity'){
            document.querySelector('#consult .content .result .result-text').innerHTML = `
              ${res.length !== 0 ? `
                <div class = 'list'>
                  <div class = 'item'>
                    <span>${res.name} #${res.user_id}</span>
                    <span>MULTAS: ${res.multas}</span>
                  </div>
                </div>
              `: 'Nenhuma informação encontrada!'}
            `
          } else if (type === 'vehicles'){
            const finalMessage = Object.entries(res).map(([key, value]) => {
              return `
                <div class = 'item'>
                  <span>VEICULO: ${value.vehicle}</span>
                  <span>DETIDO: ${value.arrest}</span>
                  <span>DONO: ${value.name}</span>
                </div>
              `;
            })
            document.querySelector('#consult .content .result .result-text').innerHTML = `
              ${res.length !== 0 ? `
                <div class = 'list'>
                  ${finalMessage.join('')}
                </div>
              `: 'Nenhuma veiculo encontrado!'}
            `;
          }
        })
    }
  },

  registers: {
    requests: [],

    reloadRequests: function () {
      const container = document.querySelector('#registers .content .container-request')
      container.innerHTML = ''
      for (const request of app.registers.requests) {

        const createdAtString = `${request.created_at.day}/${request.created_at.month}/${request.created_at.year} as ${request.created_at.hour}:${request.created_at.min}`

        container.innerHTML += `
          <div class = 'request'>
            <img src="${request.photo}" alt="">
            <div>
              <div class = 'main'>
                <h5>${request.title}</h5>
                <h4>${request.description}</h4>
                <p>Enviada em ${createdAtString}</p>
              </div>
              <div class = 'functions'>
                <div>
                  <button onclick = 'app.registers.accept(${request.id})'>Aceitar</button>
                  <button onclick = 'app.registers.refuse(${request.id})'>Recusar</button>
                </div>
              </div>
            </div>
          </div>
        `;
      }
    },

    accept: function (id) {
      app.post('requestAccept', {
        id
      })
    },

    refuse: function (id) {
      app.post('requestRefuse', {
        id
      })
    }
  },

  report: {
    finish: function () {
      const [id, amount] = document.querySelectorAll('#report .content .data input')
      const reason = document.querySelector('textarea').value

      app.post('report', {
        id: id.value,
        amount: amount.value,
        reason: reason,
      })
    }
  },

  arrest: {
    applyPunish: function () {
      const identifier = document.querySelectorAll('#arrest input')[0].value
      const time = document.querySelectorAll('#arrest input')[1].value
      const fine = document.querySelectorAll('#arrest input')[2].value
      const reason = document.querySelector('#arrest textarea').value

      app.post('applyPunish', {
        identifier,
        time,
        fine,
        reason
      })
    }
  },

  invite: {
    open: () => {
      document.querySelector('.invite').style.display = 'flex';
      document.querySelector('.invite .hire').style.display = 'flex';
      document.querySelector('.invite .exonerate').style.display = 'none';
    },

    nameRegistered: ({ target }) => {
      const value = target.value
      app.post('nameRegistered', { value })
    },

    cancel: () => {
      document.querySelector('.invite input').value = ""
      app.invite.close();
    },

    confirm: () => {
      const id = document.querySelector('.invite input').value
      const group = document.querySelector('.invite #inputGroups').value
      if (!id) return
      app.post('confirmInvite', {
        id,
        group
      })
      app.invite.close();
    },

    close: () => {
      document.querySelector('.invite').style.display = 'none';
    },

    updateName: ({ name }) => {
      document.querySelector('.invite > div[style="display: flex;"] > span').textContent = name
    }
  },
  exonerate: {
    open: () => {
      document.querySelector('.invite').style.display = 'flex';
      document.querySelector('.invite .hire').style.display = 'none';
      document.querySelector('.invite .exonerate').style.display = 'flex';
    },

    nameRegistered: ({ target }) => {
      const value = target.value
      app.post('nameRegistered', { value })
    },

    cancel: () => {
      document.querySelector('.invite input').value = ""
      app.invite.close();
    },

    confirm: () => {
      const id = document.querySelector('.invite > div[style="display: flex;"] > input').value
      if (!id) return
      const role = app.dashboard.members.find(member => member.id == id).role
      app.post('confirmExonerate', {
        id,
        role
      })
      app.invite.close();
    },
  }
}

window.app = app;
window.addEventListener('message', ({ data }) => {
  if (data.action === 'open') app.open(data)
  if (data.action === 'close') app.close()
  if (data.action === 'updateInviteName') app.invite.updateName(data)
})

document.addEventListener('keydown', function ({ keyCode }) {
  switch (keyCode) {
    case 27:
      app.close()
      app.post('close')
      break;
  }
});

/* const messageInput = document.querySelector('#registers .content .chat .input > input[type=text]')
messageInput.addEventListener("keypress", function (event) {
  if (event.key === "Enter") {
    event.preventDefault();
    document.querySelector('#registers .content .chat .input > img').click();
  }
}); */