function logout() {
  fetch('../PHP/logout.php')
      .then(response => {
          if (response.ok) {
              window.location.href = '../PAGES/01Login&Cadastro.html';
          } else { 
              console.error('Logout falhou.');
          }
      })
      .catch(error => {
          console.error('Erro ao tentar fazer logout:', error);
      });
}