<?php
session_start();
error_reporting(0);
include('includes/config.php');
if(strlen($_SESSION['alogin'])==""){  
    header("Location: index.php");
     }else{
if(isset($_POST['submit']))
{
$Nom= $_POST['Nom'] ??  NULL;
$Prenom=$_POST['Prenom'] ?? NULL;
$id=$_POST['Id']; 
$specialite =$_POST['Specialite']; 

$sql="INSERT INTO  enseignants (Id, Nom, Prenom, Specialite) 
        VALUES(:id, :Nom, :Prenom, :specialite)";
$query = $dbh->prepare($sql);
$query->bindParam(':id',$id,PDO::PARAM_STR);
$query->bindParam(':Nom',$Nom,PDO::PARAM_STR);
$query->bindParam(':Prenom',$Prenom,PDO::PARAM_STR);
$query->bindParam(':specialite',$specialite,PDO::PARAM_STR);

$query->execute();

echo '<script>alert("Notice added succesfully")</script>';
echo "<script>window.location.href ='gestion-enseignant.php'</script>";
}
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
        <title>SRMS Admin | Add Notice</title>
        <link rel="stylesheet" href="css/bootstrap.css" media="screen" >
        <link rel="stylesheet" href="css/font-awesome.min.css" media="screen" >
        <link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen" >
        <link rel="stylesheet" href="css/lobipanel/lobipanel.min.css" media="screen" >
        <link rel="stylesheet" href="css/prism/prism.css" media="screen" > <!-- USED FOR DEMO HELP - YOU CAN REMOVE IT -->
        <link rel="stylesheet" href="css/main.css" media="screen" >
        <script src="js/modernizr/modernizr.min.js"></script>
         <style>
        .errorWrap {
    padding: 10px;
    margin: 0 0 20px 0;
    background: #fff;
    border-left: 4px solid #dd3d36;
    -webkit-box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
    box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
}
.succWrap{
    padding: 10px;
    margin: 0 0 20px 0;
    background: #fff;
    border-left: 4px solid #5cb85c;
    -webkit-box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
    box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
}
        </style>
    </head>
    <body class="top-navbar-fixed">
        <div class="main-wrapper">

            <!-- ========== TOP NAVBAR ========== -->
            <?php include('includes/topbar.php');?>   
       
            <div class="content-wrapper">
                <div class="content-container">


<?php include('includes/leftbar.php');?>                   


                    <div class="main-page">
                        <div class="container-fluid">
                            <div class="row page-title-div">
                                <div class="col-md-6">
                                    <h2 class="title">Add Enseignant</h2>
                                </div>
                                
                            </div>
                      
                            <div class="row breadcrumb-div">
                                <div class="col-md-6">
                                    <ul class="breadcrumb">
            							<li><a href="dashboard.php"><i class="fa fa-home"></i> Home</a></li>
            							<li><a href="#">Enseignants</a></li>
            							<li class="active">Add Enseignant</li>
            						</ul>
                                </div>
                               
                            </div>
                      
                        </div>
               

                        <section class="section">
                            <div class="container-fluid">

                             

                              

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="panel">
                                            <div class="panel-heading">
                                                <div class="panel-title">
                                                    <h5>Add Enseignant</h5>
                                                </div>
                                            </div>
  
                                            <div class="panel-body">

    <form method="post">
    <div class="form-group">
<label for="default" class="col-sm-2 control-label">Nom</label>
<div class="col-sm-10">
<input type="text" placeholder="Nom" name="Nom" class="form-control" id="nm" autocomplete="off">
</div>
</div>
<div class="form-group">
<label for="default" class="col-sm-2 control-label">Prenom</label>
<div class="col-sm-10">
<input type="text" placeholder="Prenom" name="Prenom" class="form-control" id="pr" autocomplete="off">
</div>
</div>
<div class="form-group">
<label for="default" class="col-sm-2 control-label"><span>Id</span></label>
<div class="col-sm-3">
<input type="text" placeholder="Prefix ES-ANNEE-CODE" name="Id" class="form-control" id="id" required="required" autocomplete="off">
</div>
</div>
<div class="form-group">
<br><label for="default" class="row-sm-2 control-label">Specialite</label>
<div class="row-sm-2">
<input type="text" placeholder="Specialite" name="Prenom" class="form-control" id="sp" autocomplete="off">
</div>
</div>

  <div class="form-group has-success">

                                                        <div class="col-sm-offset-2 col-sm-10">
                                                           <button type="submit" name="submit" class="btn btn-success btn-labeled">Submit<span class="btn-label btn-label-right"><i class="fa fa-check"></i></span></button>
                                                    </div>


                                                    
                                                </form>

                                              
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.col-md-8 col-md-offset-2 -->
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
        <script src="js/jquery-ui/jquery-ui.min.js"></script>
        <script src="js/bootstrap/bootstrap.min.js"></script>
        <script src="js/pace/pace.min.js"></script>
        <script src="js/lobipanel/lobipanel.min.js"></script>
        <script src="js/iscroll/iscroll.js"></script>

        <!-- ========== PAGE JS FILES ========== -->
        <script src="js/prism/prism.js"></script>

        <!-- ========== THEME JS ========== -->
        <script src="js/main.js"></script>



        <!-- ========== ADD custom.js FILE BELOW WITH YOUR CHANGES ========== -->
    </body>
</html>
<?php  } ?>
