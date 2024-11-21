<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Inscription pour Enseignant</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:100,100italic,200,200italic,300,300italic,regular,italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer"/>

    <script src="https://code.jquery.com/jquery-3.4.1.min.js"> </script>
  <style>
    *{
    margin: 0;
    list-style: none;
    padding: 0;
    text-decoration: none;
    box-sizing: border-box;
    font-family: 'Montserrat',sans-serif;
    }
    body{
    background: rgba(255, 255, 255, 0.9);
    }
    .wrapper{
    margin: 10px;
    height: 60px;

    }
    .wrapper .top_navbar{
    width: calc(100% - 20px);
    height: 60px;
    display: flex;
    position: fixed;
    top: 0;


    }
    .wrapper .top_navbar .hamburger{
    width: 70px;
    height: 100%;
    background: #f1ae3f;
    padding: 15px 17px;
    border-top-left-radius: 20px;
    cursor: pointer;

    }
    .wrapper .top_navbar .hamburger div{
    width: 35px;
    height: 4px;
    background: #170f01;
    margin: 5px 0;
    border-radius: 5px;


    }
    .wrapper .top_navbar .top_menu{
    width: calc(100% - 70px);
    background: rgba(16, 11, 1, 0.99);
    height: 100%;
    border-bottom-right-radius: 20px ;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 20px;
    box-shadow: 0 2px rgb(227, 147, 17);

    }
    .wrapper .top_navbar .top_menu .logo{
    color: #f1ae3f;
    font-size: 30px;
    font-weight: 700;
    letter-spacing: 3px;
    text-align: center;
    align-items: center;

    }
    .wrapper .top_navbar .top_menu ul{
    display: flex;

    }
    .wrapper .top_navbar .top_menu ul li a{
    display: block;
    margin: 0 10px;
    width: 35px;
    height: 35px;
    line-height: 35px;
    border: 1px solid #f1ae3f;
    text-align: center;
    border-radius: 50%;
    color: #f1ae3f;

    }
    .wrapper .top_navbar .top_menu ul li a:hover{
    background: #f1ae3f;
    color: #fff;

    }
    .wrapper .sidebar{
        position: fixed;
        top: 60px;
        left: 10px;
        background: #f1ae3f;
        width: 230px;
        height:calc(100% - 80px);
        border-bottom-left-radius: 20px;
        transition: all 0.3s ease;

    }
    .wrapper .sidebar ul li a{
    display: block;
    padding: 20px;
    position: relative;
    margin-bottom: 1px;
    color: #170f01;
    white-space: nowrap;
    }

    .wrapper .sidebar ul li a:before{
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 3px;
    height: 100%;
    background: rgba(35, 22, 1, 0.99);
    display: none;

    }

    .wrapper .sidebar  ul li a span.icon{
    margin-right: 10px;
    display: inline-block;
    }
    .wrapper .sidebar ul li a span.title{
    display: inline-block;

    }
    .wrapper .sidebar ul li a:hover
    {

    background: #daa858;
    color: #170f01;
    }
    .wrapper .sidebar ul li a:hover:before
    {
    display: block;
    }

    .wrapper .main_content{
    width: calc(100% - 200px);
    margin-top: 70px;
    margin-left: 200px;
    padding: 15px;
    transition: all 0.3s ease;

    }
    .wrapper .main_content .item{
    margin-bottom: 10px;
    padding: 15px;
    line-height: 22px;
    }
    .wrapper.collapse .sidebar{
    width: 70px;

    }
    .wrapper.collapse .sidebar ul li a{
    text-align: center;
    }
    .wrapper.collapse .sidebar ul li a span.icon{
    margin: 0;
    }
    .wrapper.collapse .sidebar ul li a span.title{
    display: none;
    }
    .wrapper.collapse .main_content{
    width: calc(100% - 70px);
    margin-left: 70px;
    }

    /*

        section {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
        }
    */

    .wrapper .main_content .item .form-box {
        min-width: 700px;
        max-width: 800px;
        background: #fff;
        padding: 50px;
        margin: auto;
        border-radius: 5px;
        box-shadow: 0 0 10px rgb(216, 156, 55);

        }

    /*.wrapper .main_content .item .form-box:hover {*/
    /*        transform: translateY(-10px);*/
    /*        box-shadow: 0 8px 16px rgb(241, 174, 63);*/
    /*    }*/

    .wrapper .main_content .item .form-box h2 {
            font-size: 2.5rem;
            color: #333;
            text-align: center;
            margin-bottom: 25px;
        }
    .wrapper .main_content .item .form-box #formulaire{
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        gap: 30px;
    }
    .wrapper .main_content .item .form-box #form-body{
        display: flex;
        width: 100%;
        flex-wrap: wrap;
        justify-content: space-around;
        gap: 15px;
    }

    .wrapper .main_content .item .form-box .input-box {
        display: flex;
        flex-direction: column;
        gap: 5px;
        color: #333;
        width: 45%;

    }

    /*.wrapper .main_content .item .form-box  .input-box label {*/
    /*}*/
    .wrapper .main_content .item .form-box  .input-box input,
    .wrapper .main_content .item .form-box  .input-box select {
            padding: 10px;
            border: 1px solid transparent;
            border-radius: 5px;
            background: rgba(227, 227, 227, 0.9);
        }

    .wrapper .main_content .item .form-box   .input-box input:focus,
    .wrapper .main_content .item .form-box  .input-box select:focus {
            border-color: #f1ae3f;
            outline: none;
        }

    .wrapper .main_content .item .form-box .input-box select {
            appearance: none;
            background: url('data:image/svg+xml;charset=US-ASCII,%3Csvg xmlns=\'http://www.w3.org/2000/svg\' viewBox=\'0 0 4 5\'%3E%3Cpath fill=\'%23000000\' d=\'M2 0L0 2h4zm0 5L0 3h4z\'/%3E%3C/svg%3E') no-repeat right 10px center;
            background-size: 10px;
        }

    .wrapper .main_content .item .form-box button {
            width: 400px;
            padding: 10px 20px;
            border: transparent;
            border-radius: 25px;
            background-color: rgba(35, 22, 1, 0.99);
            color: #ffffff;
            font-size: 1.2rem;
            font-weight: 700;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
            margin: 5px auto;

        }

    .wrapper .main_content .item .form-box button:hover {
            background-color: #f1ae3f;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
<div class="wrapper collapse">
    <div class="top_navbar">
        <div class="hamburger">
            <div></div>
            <div></div>
            <div></div>
        </div>
        <div class="top_menu">
            <div class="logo">
                <marquee>GESTION NOTES</marquee>
            </div>
            <ul>
                <li><a href="monPageDacueill.jsp" title="home"><i class="fa-solid fa-house"></i></a></li>
                <li><a href="logingestionnaire.jsp" title="Gestionnaire"><i class="fa-regular fa-user"></i></a></li>
                <li><a href="login.jsp" title="Enseignant"><i class="fa-solid fa-user-plus"></i></a></li>
                <li><a href="exemple.jsp"><i class="fa-solid fa-address-book"></i></a></li>
            </ul>

        </div>
    </div>
    <div class="sidebar">
        <ul>
            <li><a href="index.jsp" title="home" class="active">
                <span class="icon">
                    <i class="fa-solid fa-house"></i>
                </span>
                <span class="title"> home</span>

            </a></li>
            <li><a href="inscriptionEnseignant.jsp"  title="Inscription d'enseignant" class="active">
                <span class="icon">
                   <i class="fa-solid fa-user-pen"></i>
                </span>
                <span class="title">Inscrire Enseignant</span>
            </a></li>
            <li><a href="InscrireEtudiant.jsp" title="inscription etudiant" class="active">
                <span class="icon">
                  <i class="fa-solid fa-user-pen fa-bounce"></i>
                </span>
                <span class="title">Inscrire Etudiant</span>
            </a></li>
            <li><a href="creerModule.jsp"  title="creation de Module" class="active">
                <span class="icon">
                   <i class="fa-solid fa-book fa-bounce"></i>
                </span>
                <span class="title">Creation Module</span>
            </a></li>
            <li><a href="ajouterFormation.jsp"  title=" LesFormations" class="active">
                <span class="icon" >
                    <i class="fa-solid fa-book-open-reader fa-beat"></i>
                </span>
                <span class="title">Les Formations</span>
            </a></li>
            <li><a href="listeModules.jsp"  title="Liste des modules" class="active">
                <span class="icon">
                   <i class="fa-solid fa-book-open"></i>
                </span>
                <span class="title">Les Modules</span>
            </a></li>
            <li><a href="listeEnseignant.jsp"  title="liste des  Enseignants " class="active">
                <span class="icon">
                  <i class="fa-solid fa-people-line"></i>
                </span>
                <span class="title">Les Enseignants</span>
            </a></li>
            <li><a href="listeEtudiants.jsp"  title="liste des  Etudiants " class="active">
                <span class="icon">
                  <i class="fa-solid fa-user-graduate"></i>
                </span>
                <span class="title">Les Etudiants</span>
            </a></li>
            <li><a href="listeEtudiantsAvecNotes.jsp"  title="liste des  Etudiants avec  leurs  notes " class="active">
                <span class="icon">
                  <i class="fa-solid fa-award"></i>
                </span>
                <span class="title">Les Etudiants<br>Avec Notes</span>
            </a></li>

        </ul>

    </div>
    <div class="main_content">
        <div class="item">

        </div>
        <div class="item">

           <%--
            <img src="${pageContext.request.contextPath}/image/bureau3.png" alt="">
           --%>

               <section>
                   <div class="form-box">
                       <h2>Formulaire d'inscription</h2>
                       <form action="EnseignantServlet" method="post" id="formulaire">
                            <div id="form-body">
                                <div class="input-box">
                                    <input type="text" id="matricule" name="matricule"  placeholder="Matricule" required>
                                </div>
                                <div class="input-box">
                                    <input type="text" id="prenoms" name="prenoms" placeholder="Prenom" required>
                                </div>
                                <div class="input-box">
                                    <input type="text" id="nom" name="nom"placeholder="Nom" required>
                                </div>
                                <div class="input-box">
                                    <input type="date" id="dateNaissance" name="dateNaissance"  required>
                                </div>
                                <div class="input-box">
                                    <label for="sexe">Sexe:</label>
                                    <select id="sexe" name="sexe" required>
                                        <option value="Masculin" selected>Masculin</option>
                                        <option value="Féminin">Féminin</option>
                                    </select>
                                </div>
                                <div class="input-box">
                                    <input type="text" id="grade" name="grade" placeholder="grade" required>
                                </div>
                                <div class="input-box">
                                    <input type="text" id="specialite" name="specialite" placeholder="specialite" required>
                                </div>
                                <div class="input-box">
                                    <input type="text" id="adresse" name="adresse" placeholder="Adresse" required>
                                </div>
                                <div class="input-box">
                                    <input type="email" id="adresseEmail" name="adresseEmail" placeholder="Ex. johndoe@example.com" required>
                                </div>
                                <div class="input-box">
                                    <input type="text" id="bureau" name="bureau" placeholder="Entrez votre bureau" required>
                                </div>
                                <div class="input-box">
                                    <input type="text" id="institutionRattachement" name="institutionRattachement" placeholder="Institut de rattachement" required >
                                </div>
                            </div>
                           <button type="submit">S'inscrire</button>
                       </form>

                   </div>
               </section>

        </div>

    </div>

</div>

<script>
    $(document).ready(function (){
        $(".hamburger").click(function (){
            $(".wrapper").toggleClass("collapse")

        });

    });
</script>
<%--
    <section>
    <div class="form-box">
        <h2>Formulaire d'inscription</h2>
        <form action="EnseignantServlet" method="post">
            <div class="input-box">
                <label for="matricule">Matricule:</label>
                <input type="text" id="matricule" name="matricule" required>
            </div>
            <div class="input-box">
                <label for="prenoms">Prénoms:</label>
                <input type="text" id="prenoms" name="prenoms" required>
            </div>
            <div class="input-box">
                <label for="nom">Nom:</label>
                <input type="text" id="nom" name="nom" required>
            </div>
            <div class="input-box">
                <label for="dateNaissance">Date de naissance:</label>
                <input type="date" id="dateNaissance" name="dateNaissance" required>
            </div>
            <div class="input-box">
                <label for="sexe">Sexe:</label>
                <select id="sexe" name="sexe" required>
                    <option value=""></option>
                    <option value="Masculin">Masculin</option>
                    <option value="Féminin">Féminin</option>
                </select>
            </div>
            <div class="input-box">
                <label for="grade">Grade:</label>
                <input type="text" id="grade" name="grade" required>
            </div>
            <div class="input-box">
                <label for="specialite">Spécialité:</label>
                <input type="text" id="specialite" name="specialite" required>
            </div>
            <div class="input-box">
                <label for="adresse">Adresse:</label>
                <input type="text" id="adresse" name="adresse" required>
            </div>
            <div class="input-box">
                <label for="adresseEmail">Adresse Email:</label>
                <input type="email" id="adresseEmail" name="adresseEmail" required>
            </div>
            <div class="input-box">
                <label for="bureau">Bureau:</label>
                <input type="text" id="bureau" name="bureau" required>
            </div>
            <div class="input-box">
                <label for="institutionRattachement">Institution de rattachement:</label>
                <input type="text" id="institutionRattachement" name="institutionRattachement" required >
            </div>
            <button type="submit">S'inscrire</button>
        </form>
    </div>
</section>
--%>
</body>
</html>
