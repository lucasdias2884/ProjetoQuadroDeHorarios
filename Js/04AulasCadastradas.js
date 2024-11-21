const coresPorCurso = {
    "administracao": "#003366",
    "analise_e_desenvolvimento_de_sistemas": "#006400",
    "arquitetura": "#808080",
    "biomedicina": "#00FF7F",
    "ciencias_contabeis": "#87CEEB",
    "direito": "#8B0000",
    "educacao_fisica_bacharelado": "#008000",
    "educacao_fisica_licenciatura": "#32CD32",
    "enfermagem": "#20B2AA",
    "engenharia_civil": "#2F4F4F",
    "estetica_cosmetica": "#FF69B4",
    "farmacia": "#228B22",
    "fisioterapia": "#98FB98",
    "gestao_recursos_humanos": "#4682B4",
    "medicina_veterinaria": "#006400",
    "nutricao": "#32CD32",
    "odontologia": "#ADD8E6",
    "psicologia": "#800080"
};

async function buscarAulas() {
    try {
        const response = await fetch('../PHP/getAulas.php');
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        const aulas = await response.json();
        console.log('Aulas recebidas:', aulas);
        return aulas;
    } catch (error) {
        console.error('Erro ao buscar aulas:', error);
    }
}

function formatarData(data) {
    const partes = data.split('-');
    return `${partes[2]}/${partes[1]}/${partes[0]}`;
}

async function renderizarCards() {
    const container = document.getElementById('cardsContainer');
    container.innerHTML = '';

    const aulasCadastradas = await buscarAulas();
    if (aulasCadastradas && aulasCadastradas.length > 0) {
        aulasCadastradas.forEach(aula => {
            const card = document.createElement('div');
            card.className = 'card';
            const corCurso = coresPorCurso[aula.curso.trim()];
            card.style.backgroundColor = corCurso || 'rgba(255, 255, 255, 0.9)';

            console.log(`Curso: ${aula.curso}, Cor: ${corCurso}`);

            card.innerHTML = `
                <h2>${aula.curso}</h2>
                <p>DATA: ${formatarData(aula.data)}</p> <!-- Formata a data -->
                <p>CURSO: ${aula.curso}</p>
                <p>MODALIDADE: ${aula.modalidade}</p>
                <p>SAFRA: ${aula.safra}</p>
                <p>DISCIPLINA: ${aula.disciplina}</p>
                <p>PROFESSOR(a): ${aula.professor}</p>
                <p>SALA/ANDAR: ${aula.sala}</p>
                <button onclick="excluirCard(${ aula.id})">Excluir</button>
            `;
            container.appendChild(card);
        });
    } else {
        container.innerHTML = '<p>Nenhuma aula cadastrada.</p>';
    }
}

async function excluirCard(id) {
    try {
        const response = await fetch(`../PHP/deleteAula.php?id=${id}`, { method: 'DELETE' });
        if (!response.ok) {
            throw new Error('Erro ao excluir aula');
        }
        const data = await response.json();
        alert(data.message);
        renderizarCards();
    } catch (error) {
        console.error('Erro ao excluir aula:', error);
    }
}

window.onload = renderizarCards;

function logout() {
    alert("Você foi desconectado.");
}