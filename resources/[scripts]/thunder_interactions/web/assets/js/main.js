Vue.createApp({
    data: function () {
        return {
            opened: false,
            items: [],
            renderItems: [],
            renderClothes: [],
            renderInsideItems: []
        };
    },
    methods: {
        request: async function (name = '', body = {}) {
           const res = await fetch(`http://${window.GetParentResourceName()}/${name}`, {
                method: "POST",
                body: JSON.stringify(body)
            });
            return res.json();
        },
        image: function (name) {
            return `./assets/images/${name}.svg `;
        },
        actionClick: async function (index) {
            await this.request('actionClick', {
                index: index+=1
            }).then(res => {
                if (res.list.length > 0) {
                    if (res.type === 'clothes') return this.renderClothes = res.list;
                    return this.renderInsideItems = res.list;
                };
            });
        },
        actionClothe: async function (index, action) {
            await this.request('actionUse', {
                index: index+=1,
                type: 'clothes',
                action: action
            }).then(res => {
                if (res) return this.request('CLOSE_NUI');
            });
        },
        actionUse: async function (index) {
            await this.request('actionUse', {
                index: index+=1,
                type: 'use'
            }).then(res => {
                if (res) return this.request('CLOSE_NUI');
            });
        }
    },
    mounted: function() {
        window.addEventListener('message', ({ data }) => {
            switch (data.action) {
                case 'SHOW_NUI':
                    if (data.body.length <= 0) return;
                    this.opened = true;
                    this.items = data.body;
                    this.renderItems = data.body;
                    break;
                case 'CLOSE_NUI':
                    this.opened = false;
                    this.renderInsideItems = [];
                    this.renderClothes = [];
                    this.items = [];
                    break;
                default: 
                    break;
            }
        });

        window.addEventListener('keydown', (event) => {
            if ( event.keyCode === 27 ) {
                this.request('CLOSE_NUI');
            };
        });
    }
  }).mount('#app');