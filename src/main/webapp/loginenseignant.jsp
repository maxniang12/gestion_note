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
    <title>connecction enseignant</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:100,100italic,200,200italic,300,300italic,regular,italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

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
            top: 0;
        }

        .item{
            padding: 15px;
            margin-left: 380px;
            top: 50px;
        }

        .item .container{
            max-width: 600px;
           height: 50%;
            background: #fff;
            padding: 50px;
            margin: 50px;
            top: 70px !important;
            border-radius: 5px;
            box-shadow: 0 0 10px rgb(216, 156, 55);
        }
        .item .container h2 {
            text-align: center;
            color: rgba(35, 22, 1, 0.99);
        }
        .item .container .form-group {
            margin-bottom: 15px;
        }
        .item .container .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .item .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .item .container .form-group input[type="text"],
        .item .container .form-group input[type="password"]{
            background: rgba(227, 227, 227, 0.9);
            outline: none;
        }
        .item .container .form-group input[type="submit"] {
            background-color: rgba(35, 22, 1, 0.99);
            color: #fff;
            border: none;
            cursor: pointer;
        }
        .item .container .form-group input[type="submit"]:hover {
            background-color: #f1ae3f;
        }
    </style>
</head>
<body>

   <div class="item">
       <div class="container">
           <h2>Login</h2>
           <form action="AuthentificationServlet" method="post">
               <div class="form-group">
                   <label For="username">Username:</label>
                   <input type="text" id="username" name="username" required/>
               </div>

               <div class="form-group">
                   <label For="motPasse">Password:</label>
                   <input type="password" id="motPasse" name="motPasse" required/>
               </div>
               <div class="form-group">
                   <input type="submit" value="Inscrire"/>
               </div>
           </form>
       </div>
   </div>



<%--
  <div class="form-box">
       <form action="AuthentificationServlet" method="post">
          <div class="input-box">
              <label for="username">Username *:</label>
              <input type="text" id="username" name="username" required>
          </div>
          <div class="input-box">
              <label for="motPasse">Mot passe *:</label>
              <input type="password" id="motPasse" name="motPasse" required><br>
          </div>
           <button type="submit">Enregistrer</button>
       </form>
   </div>
--%>

</body>
</html>
