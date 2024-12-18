<?php
session_start();

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "artauction";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Echec de la connexion :" . $conn->connect_error);
}

$categorieQuery = "SELECT DISTINCT categorie FROM oeuvre";
$categorieResult = $conn->query($categorieQuery);

$selectedcategorie = isset($_GET['categorie']) ? $_GET['categorie'] : '';

$user_id = isset($_SESSION['id']) ? $_SESSION['id'] : null;

// Fonction pour vérifier si une œuvre est suivie par l'utilisateur
function isFollowed($conn, $user_id, $oeuvre_id) {
    if (!$user_id) return false;

    $stmt = $conn->prepare("SELECT 1 FROM suivis WHERE user_id = ? AND oeuvre_id = ?");
    $stmt->bind_param("ii", $user_id, $oeuvre_id);
    $stmt->execute();
    $result = $stmt->get_result();

    return $result->num_rows > 0;
}


$sql = "SELECT * FROM oeuvre";
if ($selectedcategorie) {
    $sql .= " WHERE categorie = '" . $conn->real_escape_string($selectedcategorie) . "'";
}

$result = $conn->query($sql);

if (!$result) {
    die("Erreur SQL : " . $conn->error);
}

?>

<html>

    <head>
        <meta charset="UTF-8">
        <title> Art Auction </title>
        <link rel="stylesheet" href="index.css">
    </head>



    <body>

        <!-- BARRE DE NAVIGATION -->
        <nav>
            <a href="#"><img src="src/logo/logo.png"></a>
            <ul>
                <a href="#" class="o"> Accueil </a>
                <a href="suivis/suivis.php"> Mes suivis d'enchère </a>
                <a href="vendre/vendre.php"> Vendre </a>
                <?php if (isset($_SESSION['email'])): ?>
                    <a href="deconnexion/deconnexion.php">Se déconnecter</a>
                <?php else: ?>
                    <a href="connexion/connexion.php">Se connecter</a>
                <?php endif; ?>
            </ul>
        </nav>
        <!-- BARRE DE NAVIGATION -->



        <!--  BARRE DE RECHERCHE -->
        <div class="search">
            <div class="box">
                <input type="text" placeholder="Search...">
                <a href="">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
                    </svg>
                </a>
            </div>
        </div>
        <!--  BARRE DE RECHERCHE -->

                
        <!-- FLITRAGE -->
        <div class="filter-categories">
            <a href="index.php" class="filter-item <?php echo $selectedcategorie == '' ? 'active' : ''; ?>">Toutes les catégories</a>
            <?php if ($categorieResult->num_rows > 0): ?>
                <?php while ($categorieRow = $categorieResult->fetch_assoc()): ?>
                    <a href="index.php?categorie=<?php echo urlencode($categorieRow['categorie']); ?>" 
                    class="filter-item <?php if ($categorieRow['categorie'] == $selectedcategorie) echo 'active'; ?>">
                        <?php echo htmlspecialchars($categorieRow['categorie']); ?>
                    </a>
                <?php endwhile; ?>
            <?php endif; ?>
        </div>
        <!-- FLITRAGE -->



        <!-- GALERIES D'OEUVRES -->
        <div class="gallery"> 
            <?php if ($result->num_rows > 0): ?>
                <?php while ($row = $result->fetch_assoc()): ?>
                    <div class="art-item">
                        <div class="image-container">
                            <img src="<?php echo $row['image_url']; ?>" alt="<?php echo $row['titre']; ?>" />
                            <form method="POST" action="suivis/suivis.php" class="heart-form">
                            <input type="hidden" name="oeuvre_id" value="<?php echo $row['id']; ?>">
                            <button type="submit" class="heart-button <?php echo isFollowed($conn, $user_id, $row['id']) ? 'followed' : ''; ?>" title="Ajouter aux suivis">
                                <?php if (isFollowed($conn, $user_id, $row['id'])): ?>
                                    ❤️ <!-- Cœur rempli si l'œuvre est suivie -->
                                <?php else: ?>
                                    🤍 <!-- Cœur vide si l'œuvre n'est pas suivie -->
                                <?php endif; ?>
                            </button>
                            </form>
                        </div>
                        <h2><?php echo $row['titre']; ?></h2>
                        <p><strong>Artiste :</strong> <?php echo $row['artiste']; ?></p>
                        <p><?php echo $row['description']; ?></p>
                        <p><strong>Prix de départ :</strong> €<?php echo number_format($row['prix_depart'], 2); ?></p>
                    </div>
                <?php endwhile; ?>
            <?php else: ?>
                <h1>Aucune œuvre disponible pour le moment.</h1>
            <?php endif; ?>
        </div>
        <!-- GALERIES D'OEUVRES -->



    </body>

</html>

<?php $conn->close(); ?>

<!-- INSERT INTO oeuvre (titre, artiste, categorie, description, image_url, prix_depart) VALUES ('La Nuit étoilée', 'Vincent van Gogh', 'peinture', 'Un célèbre tableau représentant le ciel nocturne', 'src/logo/logo.png', 1000000), ('La Joconde', 'Leonard de Vinci', 'peinture','Portrait de Mona Lisa', 'src/logo/logo.png', 2000000);
 NE PAS OUBLIEZ DATEEEE