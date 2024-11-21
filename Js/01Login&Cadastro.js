const container = document.getElementById('container');
const registerBtn = document.getElementById('register');
const loginBtn = document.getElementById('login');

registerBtn.addEventListener('click', () => {
    container.classList.add("active");
});

loginBtn.addEventListener('click', () => {
    container.classList.remove("active");
});

// Cadastro
document.getElementById('formCadastro').addEventListener('submit', function(event) {
    event.preventDefault();

    const formData = new FormData(this);

    fetch('../PHP/cadastrar.php', {
        method: 'POST',
        body: formData
    })
    .then(response => response .json())
    .then(data => {
        const mensagem = document.getElementById('mensagem');
        mensagem.textContent = data.message;
        mensagem.style.color = data.success ? 'green' : 'red';
    })
    .catch(error => {
        console.error('Erro:', error);
    });
});

// Login
document.getElementById('formLogin').addEventListener('submit', function(event) {
    event.preventDefault();

    const formData = new FormData(this);

    fetch('../PHP/login.php', {
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        const mensagem = document.getElementById('mensagem-login');
        mensagem.textContent = data.message;
        mensagem.style.color = data.success ? 'green' : 'red';
        if (data.success) {
            
            setTimeout(() => {
                window.location.href = '../Pages/02Home.html';
            }, 1000);
        }
    })
    .catch(error => {
        console.error('Erro:', error);
    });
});