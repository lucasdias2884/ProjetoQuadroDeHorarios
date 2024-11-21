<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');

include 'db.php';

try {
    $conn = new PDO("mysql:host=" . DB_SERVER . ";dbname=" . DB_NAME . ";charset=utf8", DB_USERNAME, DB_PASSWORD);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $sql = "SELECT * FROM aulas";
    $stmt = $conn->prepare($sql);
    $stmt->execute();

    $aulas = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($aulas);

} catch (PDOException $e) {
    echo json_encode(["message" => "Erro ao buscar aulas: " . $e->getMessage()]);
}

$conn = null;
?>

<?php
header('Content-Type: application/json');
