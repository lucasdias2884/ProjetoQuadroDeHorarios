<?php
define('DB_SERVER', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '');
define('DB_NAME', 'faculdade');

try {
    $conn = new PDO("mysql:host=" . DB_SERVER . ";dbname=" . DB_NAME . ";charset=utf8", DB_USERNAME, DB_PASSWORD);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $matricula = trim($_POST['matricula']);
        $senha = trim($_POST['senha']);

        if (empty($matricula) || empty($senha)) {
            echo json_encode(["success" => false, "message" => "Por favor, preencha todos os campos."]);
            exit;
        }

        $sql = "SELECT * FROM usuarios WHERE matricula = :matricula";
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':matricula', $matricula);
        $stmt->execute();

        $usuario = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($usuario && password_verify($senha, $usuario['senha'])) {
            echo json_encode(["success" => true, "message" => "Login realizado com sucesso!"]);
        } else {
            echo json_encode(["success" => false, "message" => "Matrícula ou senha incorretos."]);
        }
    }
} catch (PDOException $e) {
    error_log("Conexão falhou: " . $e->getMessage());
    echo json_encode(["success" => false, "message" => "Conexão falhou: Erro ao conectar ao banco de dados."]);
}
?>