let desistir = false;
var table = [];
window.addEventListener('message', function(event) {
    const data = event.data;
    const container = document.getElementById("morte-container");
    const overlay = document.getElementById("overlay");
    const segundosSpan = document.getElementById("segundos");
    const btnDesistir = document.getElementById("btn-desistir");
    const batimentoCardiaco = document.getElementById("batimento-cardiaco");
    const btnEmergencia = document.getElementById("btn-emergencia");

    if (data.ocultar) {
        container.style.display = "none"; 
        overlay.style.display = "none";   
        return;
    } else {
        if (data.texto) {
            atualizarMensagemDinamica(data.texto);
        }
        if (data.mostrar) {
            container.style.display = "block"; 
            overlay.style.display = "block";   
            segundosSpan.innerText = data.segundos;

            if (Array.isArray(data.locais)) {
                table = data.locais;
            } else {
                console.error("Dados de locais inválidos: ", data.locais);
            }

            batimentoCardiaco.style.display = "block"; 
            btnEmergencia.style.display = "block"; 
            btnDesistir.style.display = "none"; 

            btnDesistir.disabled = true;
            btnDesistir.classList.add("blur");
        }

        if (data.atualizarSegundos) {
            segundosSpan.innerText = data.segundos;
        }
        if (data.mostrarDesistir) {
            btnDesistir.style.display = "block";
            segundosSpan.innerText = data.segundos;

            if (Array.isArray(data.locais)) {
                table = data.locais;
            } else {
                console.error("Dados de locais inválidos: ", data.locais);
            }
        }
        if (parseInt(data.segundos) === 0) {
            btnDesistir.disabled = false;
            desistir = true;
            batimentoCardiaco.style.display = "none";
            btnDesistir.classList.remove("blur");
            btnEmergencia.style.display = "none";
        } else {
            desistir = false;
            btnDesistir.classList.add("blur");
        }
    }


});


document.getElementById("btn-desistir").onclick = function() {
    if (desistir) {
        mostrarModal(table);
    }
};

document.getElementById("btn-emergencia").onclick = function() {
    fetch(`https://${GetParentResourceName()}/emergencia`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({})
    });
};

function mostrarModal(opcoes) {
    const modal = document.getElementById("modal-opcoes");
    const opcoesContainer = document.getElementById("opcoes-container");

    opcoesContainer.innerHTML = ""; 

    opcoes.forEach(opcao => {
        const botaoOpcao = document.createElement("button");
        botaoOpcao.innerText = opcao;
        botaoOpcao.onclick = () => selecionarOpcao(opcao);
        opcoesContainer.appendChild(botaoOpcao);
    });

    modal.classList.remove("hidden");
}

function selecionarOpcao(opcao) {
    fetch(`https://${GetParentResourceName()}/spawn`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ opcao })
    });

    fecharModal();
}

document.getElementById("btn-fechar-modal").onclick = fecharModal;

function fecharModal() {
    document.getElementById("modal-opcoes").classList.add("hidden");
}


function atualizarMensagemDinamica(texto) {
    const mensagemDinamica = document.getElementById("mensagem-dinamica");
    mensagemDinamica.innerText = texto;
}
