<?php
$mail = $_POST['mail'];
$adresse = $_POST['adresse'];
$nom = $_POST['nom'];
$prenom = $_POST['prenom'];
$tel = $_POST['num_tel'];
$MdpClient = $_POST['Mot_de_passe'];

if (empty($mail) || empty($adresse) || empty($nom) || empty($prenom) || empty($tel) || empty($MdpClient)) {
    die("Tous les champs sont obligatoires.");
}

$conn = new mysqli('localhost', 'root', '', 'enchere_art');
if (!$conn) {
    die("Connexion échouée : " . mysqli_connect_error());
}else{
    echo "connexion à la base de donné réussie";
}

$conn->query("INSERT INTO client VALUES ('$mail','$adresse','$nom', '$prenom', '$tel','$MdpClient')");
$result = $conn->query("SELECT * FROM client");
if (mysqli_num_rows($result)>0){
    header("Location:../accueil.html");
}else{
    echo "erreur";
}
mysqli_close($conn);
?>
