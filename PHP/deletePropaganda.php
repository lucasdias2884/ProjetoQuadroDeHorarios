<?php
include 'db.php';

if ($_SERVER['REQUEST_METHOD'] == 'DELETE') {
    parse_str(file_get_contents("php://input"), $_DELETE);
    $id = $_DELETE['id'];

    $stmt = $conn->prepare("DELETE FROM propagandas WHERE id = ?");
    $stmt->bind_param("i", $id);
    if ($stmt->execute()) {
        echo json_encode(["message" => "Propaganda excluída com sucesso!"]);
    } else {
        echo json_encode(["error" => "Erro ao excluir propaganda."]);
    }
}
?>