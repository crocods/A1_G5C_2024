
<?php
$mail = $_POST['mail'];
$MdpClient = $_POST['Mot_de_passe'];

if (empty($mail) || empty($MdpClient)) {
        die("Tous les champs sont obligatoires.");
    }

 	$conn = new mysqli('localhost', 'root', '', 'enchere_art');
    if (!$conn) {
        die("Connexion échouée : " . mysqli_connect_error());
    } else {
		echo "connexion réussie";
	}

    $result = $conn->query ("SELECT * FROM client WHERE mailClient = '$mail' AND MdpClient='$MdpClient'");
    if (mysqli_num_rows($result)>0){
        echo ;
    } else {
        echo "votre e-mail ou votre mots de Passe est incorrect";
    }
?>
