<%--
  Created by IntelliJ IDEA.
  User: max
  Date: 2024-07-31
  Time: 19:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:100,100italic,200,200italic,300,300italic,regular,italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic">


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer"/>

    <script src="https://code.jquery.com/jquery-3.4.1.min.js"> </script>
    <title>connection de gestionnaire</title>

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
            line-height:35px !important;
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

        .wrapper .main_content .item .container{
            max-width: 700px;
            max-height: 900px;
            background: #fff;
            padding: 50px;
            margin: auto;
            border-radius: 5px;
            box-shadow: 0 0 10px rgb(216, 156, 55);
        }
        .wrapper .main_content .item .container h2 {
            text-align: center;
            color: rgba(35, 22, 1, 0.99);
        }
        .wrapper .main_content .item .container .form-group {
            margin-bottom: 15px;
        }
        .wrapper .main_content .item .container .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .wrapper .main_content .item .container .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background: rgba(227, 227, 227, 0.9);
            outline: none;
        }
        .wrapper .main_content .item .container .form-group input[type="submit"] {
            background-color: rgba(35, 22, 1, 0.99);
            color: #fff;
            border: none;
            cursor: pointer;
        }
        .wrapper .main_content .item .container .form-group input[type="submit"]:hover {
            background-color: #f1ae3f;
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
            <li><a href="monPageDacueill.jsp" title="home" class="active">
                <span class="icon">
                    <i class="fa-solid fa-house"></i>
                </span>
                <span class="title">Home</span>

            </a></li>
            <li><a href="logingestionnaire.jsp" title="Gestionnaire" class="active">
                <span class="icon">
                    <i class="fa-regular fa-user"></i>
                </span>
                <span class="title">Gestionnaire</span>
            </a></li>
            <li><a href="login.jsp" title="Enseignant" class="active">
                <span class="icon">
                    <i class="fa-solid fa-user-plus"></i>
                </span>
                <span class="title">Enseignant</span>
            </a></li>
            <li><a href="" class="active">
                <span class="icon">
                    <i class="fa-solid fa-address-book"></i>
                </span>
                <span class="title">contact</span>
            </a></li>
            <li><a href="#" class="active">
                <span class="icon" >
                    <i class="fa-solid fa-id-badge"></i>
                </span>
                <span class="title"> A Propos</span>
            </a></li>

        </ul>

    </div>
    <div class="main_content">
        <div class="item">


        </div>
        <div class="item">

            <div class="container">
                <h2>Login</h2>
                <form action="index.jsp" method="post">
                    <div class="form-group">
                        <label for="username">Username:</label>
                        <input type="text" id="username" name="username" required>
                    </div>
                    <div class="form-group">
                        <label for="motPasse">Password:</label>
                        <input type="password" id="motPasse" name="motPasse" required>
                    </div>
                    <div class="form-group">
                        <input type="submit" value="connecter">
                    </div>



                </form>

            </div>


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
<div class="container">
    <form action="index.jsp" method="post">
       <div class="form-group">
           <label for="username">Username:</label>
           <input type="text" id="username" name="username" required>
       </div>
       <div class="form-group">
           <label for="motPasse">Password:</label>
           <input type="password" id="motPasse" name="motPasse" required>
       </div>
       <div class="form-group">
           <input type="submit" value="Connecter">
       </div>
    </form>
</div>
--%>

</body>
</html>
