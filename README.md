<p align="center">
  <img src="https://r2.fivemanage.com/wpsWGUx1KTPLmXgc0cCnU/1.png" alt="Base Luxuosa Logo" width="300"/>
</p>

<h1 align="center">💎 Base Luxuosa - Remasterizada</h1>

<p align="center">
  Framework vRPex otimizado • Estimativa até 700 players (dependendo da sua VPS) • Base profissional, estável e remasterizada para servidores RP<br/>
  <a href="https://discord.gg/fivecommunity"><strong>🌐 Discord da Five Community</strong></a> • 
  <a href="https://discord.gg/foxzincommunity"><strong>⚙️ Discord da Foxzin Community</strong></a>
</p>

---

## 👥 Desenvolvedores e Créditos

- 👑 **Base original desenvolvida pela:** **Fusion Group**  
- 🛠️ **Desenvolvedores responsáveis por refazer e aprimorar a Base Havana:**  
  - 👤 **Hawk**  
  - 👤 **Malvadão**  
  - 👤 **SJR**  
- 🔥 **Base remasterizada, otimizada e aprimorada por:** [Five Community](https://discord.gg/fivecommunity)  
- ⚙️ **Foxzin Community contribuiu com melhorias e atualizações adicionais:** [Foxzin Community](https://discord.gg/foxzincommunity)

> 🚨 **Se redistribuir, mantenha os créditos de todos os envolvidos!**  
> É fundamental reconhecer o trabalho da comunidade e fortalecer os desenvolvedores.

---

## ⚙️ Framework — Baseado em vRPex (Framework Modificado)

A base utiliza o **vRPex**, uma versão **altamente otimizada e atualizada** do framework **vRP**, com melhorias profundas para desempenho, estabilidade e escalabilidade.

### 🚀 Desempenho

- ✅ Suporte estimado para até **700 jogadores simultâneos** (dependendo da configuração da sua VPS/Dedicado)
- ✅ Estrutura modular, robusta e extremamente otimizada
- ✅ Processamento assíncrono com baixo uso de CPU e memória
- ✅ Banco de dados otimizado com MariaDB

### 🔒 Estabilidade

- Arquitetura 100% modular
- Totalmente assíncrona para garantir máxima performance
- Integração nativa com **MariaDB**
- Compatível com scripts públicos e privados
- Estabilidade garantida para servidores de médio e grande porte

---

## 🧰 Guia de Instalação

> ⚠️ **Recomendamos utilizar banco de dados MariaDB para garantir maior desempenho.**

### 📦 Passos para Instalação

1️⃣ **Instale o MariaDB**  
- Durante a instalação, **não defina senha** (recomendado para facilitar a configuração inicial).

2️⃣ **Instale o Apache**  
- Acesse `http://localhost` para verificar se está funcionando corretamente.

3️⃣ **Instale o HeidiSQL**  
- Acesse com usuário `root` (sem senha) e conecte-se ao banco de dados.

4️⃣ **Gere sua chave CFX**  
- Crie em: [https://keymaster.fivem.net/register](https://keymaster.fivem.net/register)  
- Adicione no seu `server.cfg`:
```cfg
sv_licenseKey "SUA_CHAVE_CFX"
