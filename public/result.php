<?php
session_start();
error_reporting(0);
include('includes/config.php');
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Resultat</title>
        <link rel="stylesheet" href="css/bootstrap.min.css" media="screen" >
        <link rel="stylesheet" href="css/font-awesome.min.css" media="screen" >
        <link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen" >
        <link rel="stylesheet" href="css/lobipanel/lobipanel.min.css" media="screen" >
        <link rel="stylesheet" href="css/prism/prism.css" media="screen" >
        <link rel="stylesheet" href="css/main.css" media="screen" >
        <script src="js/modernizr/modernizr.min.js"></script>
    </head>
    <body>

        <div class="main-wrapper">
            <div class="content-wrapper">

                <div class="content-container">

         
                    <!-- /.left-sidebar -->

                    <div class="main-page">
                        <div class="container-fluid">
                            <div class="row page-title-div">
                                <div class="col-md-12">
                                    <h2 class="title" align="center">Système de Gestion des Résultats</h2>
                                </div>
                            </div>
                            <!-- /.row -->
                          
                            <!-- /.row -->
                        </div>
                        <!-- /.container-fluid -->

                        <section class="section" id="exampl">
                            <div class="container-fluid">

                                <div class="row">
                              
                             

                                    <div class="col-md-8 col-md-offset-2">
                                        <div class="panel">
                                            <div class="panel-heading">
                                                <div class="panel-title">
                                                    <h3 align="center">Bulletin de Notes</h3>
                                                    <hr />
<?php
// code Student Data
$Id=$_POST['id'];
$password=$_POST['pass'];
$_SESSION['id']=$Id;
$_SESSION['password']=$password;
$qery ="SELECT Nom,
            Id,
            Annee_Academique
        FROM etudiants
        WHERE Id = :Id and Password = :password";
$stmt = $dbh->prepare($qery);
$stmt->bindParam(':Id',$Id,PDO::PARAM_STR);
$stmt->bindParam(':password',$password,PDO::PARAM_STR);

$stmt->execute();
$resultss=$stmt->fetchAll(PDO::FETCH_OBJ);
$cnt=1;
if($stmt->rowCount() > 0)
{
foreach($resultss as $row)
{   ?>
<p><b>Nom :</b> <?php echo htmlentities($row->Nom);?></p>
<p><b>Id :</b> <?php echo htmlentities($row->Id);?>
<p><b>Annee Scolaire :</b> <?php echo htmlentities($row->Annee_Academique);?>
<?php }

    ?>
                                            </div>
                                            <div class="panel-body p-20">







                                                <table class="table table-hover table-bordered" border="1" width="100%">
                                                <thead>
                                                        <tr style="text-align: center">
                                                            <th style="text-align: center">#</th>
                                                            <th style="text-align: center"> Matiere</th>    
                                                            <th style="text-align: center">Note</th>
                                                            <th style="text-align: center">Mentions</th>

                                                        </tr>
                                               </thead>
  


                                                	
                                                	<tbody>
<?php                                              
// Code for result

 $query ="SELECT Mt.Description AS Nom_Matiere,
                       Nt.Note,
                       Nt.Mentions AS Mention
                FROM notes Nt
                JOIN matieres Mt ON Mt.Id = Nt.Id_Matiere
                WHERE Nt.Id_Etudiant = :Id";
$query= $dbh -> prepare($query);
$query->bindParam(':Id',$Id,PDO::PARAM_STR);
$query-> execute();  
$results = $query -> fetchAll(PDO::FETCH_OBJ);
$cnt=1;
if($countrow=$query->rowCount()>0)
{ 
foreach($results as $result){

    ?>

                                                		<tr>
<th scope="row" style="text-align: center"><?php echo htmlentities($cnt);?></th>
<td style="text-align: center"><?php echo htmlentities($result->Nom_Matiere);?></td>
<td style="text-align: center"><?php echo htmlentities($totalmarks=$result->Note);?></td>
<td style="text-align: center"><?php echo htmlentities($result->Mention);?></td>

                                                		</tr>
<?php 
$totlcount+=$totalmarks;
$cnt++;
}
$Note_ =  number_format($totlcount / $cnt, 2);
?>
<tr>
<th scope="row" colspan="3" style="text-align: center">Note Totale</th>
<td style="text-align: center"><b><?php echo htmlentities($Note_); ?></b></td>
                     </tr>                                   

<th>
                              
<td colspan="3" align="center"><i class="fa fa-print fa-2x" aria-hidden="true" style="cursor:pointer" OnClick="CallPrint(this.value)" ></i>     Télécharger</td>
                                                             </th>

 <?php } else { ?>     
<div class="alert alert-warning left-icon-alert" role="alert">
                                            <strong>Notice!</strong> La Resultat est Indisponible
 <?php } ?>
                                        </div>



                                                	</tbody>
                                                </table>

                                            </div>
                                        </div>
                                        <!-- /.panel -->
                                    </div>
                                    <!-- /.col-md-6 -->

                                    <div class="form-group">
                                                           
                                                            <div class="col-sm-6">
                                                               <a href="index.php">Home</a>
                                                            </div>
                                                        </div>

                                </div>
                                <!-- /.row -->
  
                            </div>
                            <!-- /.container-fluid -->
                        </section>
                        <!-- /.section -->

                    </div>
                    <!-- /.main-page -->

                  
                </div>
                <!-- /.content-container -->
            </div>
            <!-- /.content-wrapper -->

        </div>
        <!-- /.main-wrapper -->

        <!-- ========== COMMON JS FILES ========== -->
        <script src="js/jquery/jquery-2.2.4.min.js"></script>
        <script src="js/bootstrap/bootstrap.min.js"></script>
        <script src="js/pace/pace.min.js"></script>
        <script src="js/lobipanel/lobipanel.min.js"></script>
        <script src="js/iscroll/iscroll.js"></script>

        <!-- ========== PAGE JS FILES ========== -->
        <script src="js/prism/prism.js"></script>

        <!-- ========== THEME JS ========== -->
        <script src="js/main.js"></script>
        <script>
            $(function($) {

            });


            function CallPrint(strid) {
var prtContent = document.getElementById("exampl");
var WinPrint = window.open('', '', 'left=0,top=0,width=800,height=900,toolbar=0,scrollbars=0,status=0');
WinPrint.document.write(prtContent.innerHTML);
WinPrint.document.close();
WinPrint.focus();
WinPrint.print();
}
</script>

        </script>

        <!-- ========== ADD custom.js FILE BELOW WITH YOUR CHANGES ========== -->

    </body>
</html>

<?php } ?>