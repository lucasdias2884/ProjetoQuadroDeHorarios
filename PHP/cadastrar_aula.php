<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "faculdade";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Conexão falhou: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $data = $_POST['data'];
    $turno = $_POST['turno'];
    $curso = $_POST['curso'];
    $disciplina = $_POST['disciplina'];
    $safra = $_POST['safra'];
    $modalidade = $_POST['modalidade'];
    $professor = $_POST['professor'];
    $sala = $_POST['sala'];

    $sql = "INSERT INTO aulas (data, turno, curso, disciplina, safra, modalidade, professor, sala) 
            VALUES ('$data', '$turno', '$curso', '$disciplina', '$safra', '$modalidade', '$professor', '$sala')";

    if ($conn->query($sql) === TRUE) {
        echo "Cadastro realizado com sucesso!";
    } else {
        echo "Erro: " . $sql . "<br>" . $conn->error;
    }
}

$conn->close();
?>