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

async function carregarAulas() {
  try {
      const response = await fetch('../PHP/getAulas.php');
      const aulas = await response.json();
      console.log('Aulas recebidas:', aulas);
      
      const dataAtual = new Date();
      const ano = dataAtual.getFullYear();
      const mes = String(dataAtual.getMonth() + 1).padStart(2, '0');
      const dia = String(dataAtual.getDate()).padStart(2, '0');
      const dataAtualFormatada = `${ano}-${mes}-${dia}`;

      console.log('Data atual formatada:', dataAtualFormatada);

      const aulasVeteranos = aulas.filter(aula => 
          aula.safra === 'veterano' && 
          aula.data === dataAtualFormatada
      );

      console.log('Aulas Veteranos:', aulasVeteranos);
      renderizarCards(aulasVeteranos);
  } catch (error) {
      console.error('Erro ao carregar aulas:', error);
  }
}

function formatarData(data) {
  const partes = data.split('-');
  return `${partes[2]}/${partes[1]}/${partes[0]}`;
}

function renderizarCards(aulas) {
  const topRow = document.getElementById('topRow');
  const bottomRow = document.getElementById('bottomRow');

  topRow.innerHTML = '';
  bottomRow.innerHTML = '';

  if (aulas.length === 0) {
      topRow.innerHTML = '<p>Nenhuma aula cadastrada para veteranos.</p>';
      bottomRow.innerHTML = '<p>Nenhuma aula cadastrada para veteranos.</p>';
      return;
  }

  aulas.forEach(aula => {
      const card = document.createElement('div');
      card.className = 'card ' + aula.curso.toLowerCase().replace(/\s+/g, '_');
      const corCurso = coresPorCurso[aula.curso.toLowerCase().replace(/\s+/g, '_')] || 'rgba(255, 255, 255, 0.9)';

      card.style.backgroundColor = corCurso;
      card.innerHTML = `
          <h2>${aula.curso}</h2>
          <p>Data: ${formatarData(aula.data)}</p>
          <p>CURSO: ${aula.curso}</p>
          <p>MODALIDADE: ${aula.modalidade}</p>
          <p>SAFRA: ${aula.safra}</p>
          <p>DISCIPLINA: ${aula.disciplina}</p>
          <p>PROFESSOR(a): ${aula.professor}</p>
          <p>SALA/ANDAR: ${aula.sala}</p>
      `;
      topRow.appendChild(card.cloneNode(true));
      bottomRow.appendChild(card.cloneNode(true));
  });
}

window.onload = carregarAulas;