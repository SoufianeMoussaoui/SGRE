<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SGRE</title>
    <link rel="stylesheet" href="css/stl.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <style>
         body {
            background-image: url("css/Etudiant.svg");
            background-size: cover; /* This ensures the image covers the entire background */
            background-position: center center; /* This keeps the image centered */
            background-attachment: fixed; 
            margin:0;
            height: 100vh;
            font-family: Arial, sans-serif;
        }
        a{
            text-decoration: none;
            color:black;
        }
        a:hover{ color : black;}
    </style>
    <!-- Header -->
    <header>
        <h1>Système de gestion des résultats des étudiants</h1>
        <nav>
            <ul>
                <li><a href="index.php" style="color: white;">Home</a></li>
            </ul>
        </nav>
    </header>

    <!-- Main Content -->
    <man class="sp">
    <div class="container py-5">
        <div class="row align-items-center">
            <!-- Card 1 -->
            <div class="col-md-6">
                <a href="admin-login.php">
                <div class="card text-center p-4">
                    <div class="image-container mb-3">
                        <img src="css/Admin.webp">
                    </div>
                    <p>Admin</p>
                </div>
            </a>
            </div>
            <!-- Card 2 -->

            <div class="col-md-6"> 
                <a href="find-result.php">
                <div class="card text-center p-4"> 
               
                    <div class="image-container mb-3">            
                        <img src="css/Etd.avif"> 
                    </div>
                    <p>Étudiant</p>
                </div> 
            </a>
            </div>
           
        </div>
    </div>
    </man>
    <!-- Footer -->
    <footer class="bg-dark text-light pt-4 pb-3">
    <div class="container">
        <div class="row">
            <!-- Section À propos -->
            <div class="col-md-4">
                <h5>À propos</h5>
                <p>
                    Ce site est conçu pour fournir des informations et des outils 
                    aux administrateurs et aux étudiants, dans le but d'améliorer 
                    l'expérience éducative.
                </p>
            </div>

            <!-- Section Réseaux sociaux -->
            <div class="col-md-4">
                <h5>Suivez-nous</h5>
                <div>
                    <a href="#" class="text-light me-3"><i class="bi bi-facebook"></i></a>
                    <a href="#" class="text-light me-3"><i class="bi bi-twitter"></i></a>
                    <a href="#" class="text-light me-3"><i class="bi bi-linkedin"></i></a>
                    <a href="#" class="text-light"><i class="bi bi-instagram"></i></a>
                </div>
            </div>
        </div>

        <hr class="border-light">
        <div class="text-center">
            <p class="mb-0">© 2024 Resultat Tous droits réservés.</p>
        </div>
    </div>

</body>
</html>
