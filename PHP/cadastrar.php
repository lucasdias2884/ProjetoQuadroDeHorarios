<?php
define('DB_SERVER', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '');
define('DB_NAME', 'faculdade');

try {
    $conn = new PDO("mysql:host=" . DB_SERVER . ";dbname=" . DB_NAME . ";charset=utf8", DB_USERNAME, DB_PASSWORD);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $nome = trim($_POST['nome']);
        $email = trim($_POST['email']);
        $matricula = trim($_POST['matricula']);
        $senha = trim($_POST['senha']);
        $confSenha = trim($_POST['confSenha']);

        if (empty($nome) || empty($email) || empty($matricula) || empty($senha) || empty($confSenha)) {
            echo json_encode(["success" => false, "message" => "Por favor, preencha todos os campos."]);
            exit;
        }

        if ($senha !== $confSenha) {
            echo json_encode(["success" => false, "message" => "As senhas não coincidem."]);
            exit;
        }

        // Verifica se o usuário já está cadastrado
        $sql = "SELECT * FROM usuarios WHERE matricula = :matricula";
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':matricula', $matricula);
        $stmt->execute();

        if ($stmt->rowCount() > 0) {
            echo json_encode(["success" => false, "message" => "Usuário já cadastrado."]);
            exit;
        }

        $senhaHash = password_hash($senha, PASSWORD_DEFAULT);

        $sql = "INSERT INTO usuarios (nome, email, matricula, senha) VALUES (:nome, :email, :matricula, :senha)";
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':nome', $nome);
        $stmt->bindParam(':email', $email);
        $stmt->bindParam(':matricula', $matricula);
        $stmt->bindParam(':senha', $senhaHash);

        if ($stmt->execute()) {
            echo json_encode(["success" => true, "message" => "Cadastro realizado com sucesso!"]);
        } else {
            echo json_encode(["success" => false, "message" => "Erro ao cadastrar. Tente novamente."]);
        }
    }
} catch (PDOException $e) {
    error_log("Conexão falhou: " . $e->getMessage());
    echo json_encode(["success" => false, "message" => "Conexão falhou: Erro ao conectar ao banco de dados."]);
}
?>