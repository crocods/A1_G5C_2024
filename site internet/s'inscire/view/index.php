<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>Silex</title>
	<link rel="stylesheet" href="si.css">
</head>

<body>

	<nav>
		<img src="../src/logo.png">
		<ul>
			<a href="../accueil.html"><li> Accueil </li></a>
			<a href="../mes suivis d'enchère/msde.html"><li> Mes suivis d'enchère </li></a>
			<a href="../vendre/vendre.html"><li> Vendre </li></a>
			<a href="#"><li class="o"> Mon compte </li></a>
		</ul>
	</nav>
	
	<div class="inscription">
		<div class="box">
			<form action="traitements.php" method="post">
				<h1> S'inscrire </h1>
				<div class="input-box">
					<input type="email" placeholder="Adresse e-mail" name = "mail" required>
					<img src="../src/user.png">
				</div>
				<div class="input-box">
					<input type="text" placeholder="Adresse" name = "adresse" required>
					<img src="../src/user.png">
				</div>
				<div class="input-box">
					<input type="text" placeholder="nom" name = "nom" required>
					<img src="../src/user.png">
				</div>
				<div class="input-box">
					<input type="text" placeholder="prenom" name = "prenom" required>
					<img src="../src/user.png">
				</div>
				<div class="input-box">
					<input type="text" placeholder="num_tel" name = "num_tel"  required>
					<img src="../src/user.png">
				</div>
				<div class="input-box">
					<input type="password" class="mdp" placeholder="Mot de passe" name = "Mot_de_passe" required>
					<img src="../src/lock.png">
				</div>
				<div><button type="submit" class="btn"> S'inscrire </button></div>
				<div class="lien"><a href="../se connecter/index.php"> Se connecter </a></div>
			</form>
		</div>
	</div>

	<div class="footer">
		<p> Hoc inmaturo interitu ipse quoque sui pertaesus excessit e vita aetatis nono anno atque vicensimo cum quadriennio imperasset. natus apud Tuscos in Massa Veternensi, patre Constantio Constantini fratre imperatoris, matreque Galla sorore Rufini et Cerealis, quos trabeae consulares nobilitarunt et praefecturae. </p>
		<p> Hoc inmaturo interitu ipse quoque sui pertaesus excessit e vita aetatis nono anno atque vicensimo cum quadriennio imperasset. natus apud Tuscos in Massa Veternensi, patre Constantio Constantini fratre imperatoris, matreque Galla sorore Rufini et Cerealis, quos trabeae consulares nobilitarunt et praefecturae. </p>
		<p> Hoc inmaturo interitu ipse quoque sui pertaesus excessit e vita aetatis nono anno atque vicensimo cum quadriennio imperasset. natus apud Tuscos in Massa Veternensi, patre Constantio Constantini fratre imperatoris, matreque Galla sorore Rufini et Cerealis, quos trabeae consulares nobilitarunt et praefecturae. </p>
	</div>

</body>

</html>
