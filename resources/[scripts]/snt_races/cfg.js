// # Função para formatar o valor do prêmio
function moneyFormatter(value) {
    return "R$ "+Number(parseInt(value)).toLocaleString('pt-BR')+",00"
}

lang = {
    home_phrase: "Olá, bora correr contra o tempo? Temos alguns percursos para você:",
    back: "Voltar",
    start_race: "Correr",
    none_runner_in_this_category: "Ainda não existe nenhum corredor nesta categoria!",
    ended_with: "terminou com",
    completed: "completou",
    times: "vezes",
    failed: "falhou",
    remaining: "restantes",
    time_before_explode: "Tempo antes de explodir:",
    prize: "Prêmio:",
}