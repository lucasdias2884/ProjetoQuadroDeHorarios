<?php
include 'db.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nome = $_POST['nome'];
    $imagem = $_FILES['imagem'];

    if ($imagem['error'] == 0) {
        $extensao = pathinfo($imagem['name'], PATHINFO_EXTENSION);
        $novoNome = uniqid() . '.' . $extensao;

        if (!is_dir("../IMG/propagandas")) {
            mkdir("../IMG/propagandas", 0777, true);
        }

        if (move_uploaded_file($imagem['tmp_name'], "../IMG/propagandas/" . $novoNome)) {
            $stmt = $conn->prepare("INSERT INTO propagandas (nome, imagem) VALUES (:nome, :imagem)");
            $stmt->bindParam(':nome', $nome);
            $stmt->bindParam(':imagem', $novoNome);

            if ($stmt->execute()) {
                $id = $conn->lastInsertId();
                echo json_encode(['id' => $id, 'nome' => $nome, 'imagem' => $novoNome]);
            } else {
                echo json_encode(['error' => 'Erro ao cadastrar propaganda.']);
            }
        } else {
            echo json_encode(['error' => 'Erro ao mover a imagem.']);
        }
    } else {
        echo json_encode(['error' => 'Erro ao enviar a imagem.']);
    }
}
?>