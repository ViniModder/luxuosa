local suggestions = {
	{
		command = "/blitz",
		desc = "Menu de blitz da polícia.",
		perm = "policia.permissao"
	},
	{
		command = "/fps",
		desc = "Interage com o fps do jogo.",
		params = {
			{ name = "função", help = "on | hard | off" },
		}
	},{
		command = "/vvoz",
		desc = "Liga / Desliga o viva voz do rádio.",
		params = {
			{ name = "função", help = "on | off" },
		}
	},{
		command = "/volumetv",
		desc = "/volume 0-10 Interage com o volume da tv mais próxima."
	},{
		command = "/volume",
		desc = "/volume 10-100 Interage com o volume do rádio."
	},{
		command = "/desligar",
		desc = "Desliga a tv mais próxima."
	},{
		command = "/gcolete",
		desc = "guarda o colete."
	},{
		command = "/dcolete",
		desc = "deleta o colete."
	},{
		command = "/neon",
		desc = "sistema de neon."
	},{
		command = "/tv",
		desc = "Liga a televisão mais próxima, /tv LINK."
	},{
		command = "/vehs",
		desc = "Visualiza todos os seus veículos."
	},{
		command = "/ombro",
		desc = "Pega o jogador mais próximo no ombro."
	 },
	 {
		command = "/colo",
		desc = "Pega o jogador mais próximo no colo."
	 },
	 {
		command = "/cavalinho",
		desc = "Pega o jogador mais próximo no cavalinho."
	 },{
	 	command = "/trunkin",
	 	desc = "Entra no porta malas mais próximo."
	 },
	 {
		command = "/checktrunk",
		desc = "Checa se tem alguém na mala do veículo."
	},{
		command = "/taxista",
		desc = "Inicia o expediente de taxista.",
	},{
		command = "/lixeiro",
		desc = "Inicia o expediente de lixeiro.",
	},{
		command = "/cr",
		desc = "Trava a velocidade máxima do veículo.",
		params = { 
			{ name = "velocidade" },
		}
	},{
		command = "/toogle1",
		desc = "Entra em serviço."
	},{
		command = "/toogle2",
		desc = "Entra no modo ação (policia)."
	},{
		command = "/entrar",
		desc = "Entra em sua residência."
	},
	{
		command = "/socorro",
		desc = "Realiza uma ação na falta de funcionários.",
		params = {
			{ name = "função", help = "ems ou mec" },
		}
	},{
		command = "/chave",
		desc = "Emprestar chaves do veículo.",
		params = {
			{ name = "função", help = "list | add | remove "},
		}
	},{
		command = "/casas",
		desc = "Visualiza todas as suas residências.",
		params = {
			{ name = "função", help = "adicionar   |  remover  |  bau  | garagem  |  tax  | checar  |  vender  |  transferir" },
			{ name = "nome da casa", help = "Digite /casas para visualizar o nome da residência." }
		}
	},{
		command = "/outfit",
		desc = "Visualiza todas as suas residências.",
		params = {
			{ name = "função", help = "salvar   |  remover  | aplicar" },
		}
	},
	{
		command = "/outfit",
		desc = "Visualiza todas as suas residências.",
		params = {
			{ name = "função", help = "salvar   |  remover  | aplicar" },
		}
	},{
		command = "/bichos",
		desc = "Visualiza os bichos para aposta.",
		params = {
			{ name = "função", help = "jogar   |  participantes  |  acumulado" },
			{ name = "bicho", help = "Aposte no bicho de sua escolha." },
			{ name = "aposta", help = "Insira aqui o valor da aposta." }
		}
	},{
		command = "/jaqueta",
		desc = "Caso tenha o item roupas, troca a jaqueta.",
		params = {
			{ name = "numero" },
		}
	},
	{
		command = "/calca",
		desc = "Caso tenha o item roupas, troca a calça.",
		params = {
			{ name = "numero" },
		}
	},{
		command = "/sapatos",
		desc = "Caso tenha o item roupas, troca os sapatos.",
		params = {
			{ name = "numero" },
		}
	},{
		command = "/blusa",
		desc = "Caso tenha o item roupas, troca a blusa de baixo.",
		params = {
			{ name = "numero" },
		}
	},{
		command = "/maos",
		desc = "Caso tenha o item roupas, troca as mãios.",
		params = {
			{ name = "numero" },
		}
	},{
		command = "/acessorios",
		desc = "Caso tenha o item roupas, troca os acessórios.",
		params = {
			{ name = "numero" },
		}
	},{
		command = "/colete",
		desc = "Caso tenha o item roupas, troca o colete.",
		params = {
			{ name = "numero" },
		}
	},{
		command = "/chapeu",
		desc = "Caso tenha o item roupas, troca o chápeu.",
		params = {
			{ name = "numero" },
		}
	},{
		command = "/oculos",
		desc = "Caso tenha o item roupas, troca os óculos.",
		params = {
			{ name = "numero" },
		}
	},{
		command = "/maose",
		desc = "Caso tenha o item roupas, troca os acessórios da mão esquerda.",
		params = {
			{ name = "numero" },
		}
	},{
		command = "/maosd",
		desc = "Caso tenha o item roupas, troca os acessórios da mão direita.",
		params = {
			{ name = "numero" },
		}
	},{
		command = "/casas2",
		desc = "Visualiza todas as casas disponiveis no mapa."
	},{
		command = "/rentaltime",
		desc = "Verificar o tempo de aluguel restante dos veículo."
	},{
		command = "/vipinicial",
		desc = "Resgatar o seu vip inicial."
	},{
		command = "/clearinv",
		desc = "Limpa totalmente o inventário (seu)."
	},{
		command = "/attachs",
		desc = "Adiciona equipamentos na arma."
	},{
		command = "/attachs2",
		desc = "Menu de equipamentos na arma."
	},{
		command = "/tratamento",
		desc = "Inicia o tratamento no paciente.",
		perm = "paramedico.permissao"
	},{
		command = "/hud",
		desc = "Mostra/Esconde a interface na tela."
	},{
		command = "/movie",
		desc = "Mostra/Esconde a interface de video na tela."
	},{
		command = "/savedb",
		desc = "Garante o save da sua db, evitando rollback."
	},{
		command = "/procurado",
		desc = "Verifica o seu estado de procurado."
	},{
		command = "/coins",
		desc = "Acessa o menu de coins, também pode ser acessado pelo F9."
	},{
		command = "/sendcoins",
		desc = "Envia coins para um jogador, usar ID depois QUANTIA"
	},
	{
		command = "/desbugar",
		desc = "Seta a aparência salva do rosto do personagem e também as tattoos."
	},{
		command = "/gesso",
		desc = "aplica o gesso no doidão.",
		perm = "paramedico.permissao"
	},{
		command = "/job",
		desc = "Verifica a situação dos empregos legais."
	},{
		command = "/me",
		desc = "Fala mentalmente."
	},{
		command = "/chat",
		desc = "Desativa/ativa o chat."
	},{
		command = "/vtuning",
		desc = "Visualiza as informações do veículo."
	},{
		command = "/garmas",
		desc = "Guardar o armamento equipado na mochila."
	},{
		command = "/wskin",
		desc = "Mudar a textura da arma, Apenas VIP."
	},{
		command = "/wcolors",
		desc = "Mudar a pintura do armamento em suas mãos, Apenas VIP."
	},{
		command = "/coins",
		desc = "Abre o mercado de coins da cidade."
	},{
		command = "/hood",
		desc = "Abrir/Fechar o capô do veículo."
	},{
		command = "/portas",
		desc = "Abrir/Fechar as portas do veículo."
	},{
		command = "/wins",
		desc = "Abrir/Fechar os vidros do veículo.",
		params = {
			{ name = "modo", help = "true ou false" }
		}
	},{
		command = "/pr",
		desc = "Chat de conversa da policia.",
		perm = "policia.permissao"
	},{
		command = "/placa",
		desc = "Visualiza a placa de um veículo.",
		perm = "policia.permissao"
	},{
		command = "/detido",
		desc = "Apreende o veículo mais próximo.",
		perm = "policia.permissao"
	},{
		command = "/rv",
		desc = "Retirar a pessoa mais próxima do veículo.",
		perm = "policia.permissao"
	},{
		command = "/rv",
		desc = "Retirar a pessoa mais próxima do veículo.",
		perm = "paramedico.permissao"
	},{
		command = "/cv",
		desc = "Colocar a pessoa mais próxima no veículo.",
		params = {
			{ name = "local", help = "Banco que a pessoa vai sentar" }
		}
	},{
		command = "/id",
		desc = "Visualiza a identidade da pessoa mais próxima.",
		perm = "Police"
	},{
		command = "/me",
		desc = "Ativar uma animação não existente."
	},{
		command = "/mascara",
		desc = "Colocar/Retirar uma máscara."
	},{
		command = "/radio",
		desc = "Abre o radinho."
	},{
		command = "/chapeu",
		desc = "Colocar/Retirar um chapéu."
	},{
		command = "/oculos",
		desc = "Colocar/Retirar um óculos."
	},{
		command = "/checktrunk",
		desc = "Verifica o porta-malas do veículo mais próximo."
	},{
		command = "/procurado",
		desc = "Visualiza seu tempo de procurado."
	},{
		command = "/som",
		desc = "Abre o painel de som do veículo (vip)."
	},{
		command = "/p",
		desc = "Muda de banco no veículo.",
		params = {
			{ name = "número", help = "De 1 a 6" }
		}
	},{
		command = "/re",
		desc = "Reanimar a pessoa mais próxima.",
		perm = "policia.permissao"
	},{
		command = "/re",
		desc = "Reanimar a pessoa mais próxima.",
		perm = "paramedico.permissao"
	},{
		command = "/prontuario",
		desc = "Faz um laudo do paciente.",
		perm = "paramedico.permissao"
	},{
		command = "/chat",
		desc = "Ativa/Desativa o chat."
	},{
		command = "/emenu",
		desc = "Abre o menu de animações."
	},{
		command = "/tow",
		desc = "Coloca/Retira um veículo no reboque."
	},{
		command = "/impound",
		desc = "Registra um veículo no reboque.",
		perm = "policia.permissao"
	},{
		command = "/prender",
		desc = "Prender uma pessoa.",
		perm = "policia.permissao"
	},{
		command = "/rprender",
		desc = "Diminuir tempo de prisão de uma pessoa.",
		perm = "policia.permissao"
	},{
		command = "/multar",
		desc = "Multar uma pessoa.",
		perm = "policia.permissao"
	},{
		command = "/hr",
		desc = "Chat de conversa dos paramédicos.",
		perm = "paramedico.permissao"
	},{
		command = "/andar",
		desc = "Muda o estilo de andar.",
		params = {
			{ name = "número", help = "De 1 a 59" }
		}
	},{
		command = "/e",
		desc = "Inicia uma animação a sua escolha.",
		params = {
			{ name = "nome", help = "Nome da animação" }
		}
	},{
		command = "/em",
		desc = "Inicia uma animação a sua escolha do emenu.",
		params = {
			{ name = "nome", help = "Nome da animação" }
		}
	},{
		command = "/e2",
		desc = "Inicia uma animação a sua escolha.",
		params = {
			{ name = "nome", help = "Nome da animação" }
		},
		perm = "paramedico.permissao"
	},{
		command = "/revistar",
		desc = "Revista a pessoa mais próxima."
	},{
		command = "/workingtime",
		desc = "Exibe o tempo de serviço na corporação.",
		perm = "polpar.permissao"
	},{
		command = "/invadir",
		desc = "Invadir uma residência.",
		perm = "policia.permissao"
	}
}

AddEventHandler("vRP:playerSpawn",function(user_id,source)
	local __suggestions__ = {}
	for _,v in pairs(suggestions) do
		if v.perm and vRP.hasPermission(user_id,v.perm) or v.perm == nil then
			table.insert(__suggestions__,{
				name = v.command,
				help = v.desc or nil,
				params = v.params or nil
			})
		end
	end
	TriggerClientEvent('chat:addSuggestion',source,__suggestions__)
end)

AddEventHandler("chat:addedGroup",function(user_id)
	local source = vRP.getUserSource(user_id)
	if source then
		local __suggestions__ = {}
		TriggerClientEvent("chat:clearSuggestions",source)
		for _,v in pairs(suggestions) do
			if v.perm and vRP.hasPermission(user_id,v.perm) or v.perm == nil then
				table.insert(__suggestions__, {
					name = v.command,
					help = v.desc or nil,
					params = v.params or nil
				})
			end
		end
		TriggerClientEvent('chat:addSuggestion',source,__suggestions__)
	end
end)