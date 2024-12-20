<?php
$mail = $_POST['mail'];
$subject = "ARTauction : Mot de passe oublié ?"; // Sujet du mail ou l'objet
$message = "vous avez oublié votre mot de passe."; // message envoyer

$headers = "From:crocods.2004@gmail.com"; // email du l'emetteur

if (mail($mail, $subject,$message,$headers)) {
    echo "Email envoyé";
} else {
    echo "Erreur survenue";
}
?>