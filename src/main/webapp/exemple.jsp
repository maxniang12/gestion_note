<%--
  Created by IntelliJ IDEA.
  User: max
  Date: 2024-08-09
  Time: 03:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact et A Propos</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .contact-container {
            display: flex;
            max-width: 900px;
            width: 100%;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
        }
        .contact-form {
            background: linear-gradient(135deg, #f1ae3f 0%, #bf6c00 100%);
            color: #fff;
            padding: 40px;
            flex: 1;
            display: flex;
            flex-direction: column;
        }
        .contact-form h2 {
            margin-bottom: 20px;
            font-weight: 400;
        }
        .contact-form input, .contact-form textarea {
            background: rgba(255, 255, 255, 0.1);
            border: none;
            padding: 10px;
            margin-bottom: 20px;
            color: #fff;
            border-radius: 5px;
            font-size: 16px;
        }
        .contact-form input::placeholder, .contact-form textarea::placeholder {
            color: rgba(255, 255, 255, 0.7);
        }
        .contact-form button {
            background-color: #170f01;
            border: none;
            padding: 15px;
            color: #fff;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .contact-form button:hover {
            background-color: #170f01;
        }
        .contact-info {
            background-color: #fff;
            padding: 40px;
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .contact-info h3 {
            margin-bottom: 20px;
            font-weight: 400;
        }
        .contact-info p {
            margin-bottom: 10px;
            font-size: 16px;
            color: #666;
        }
        .contact-info a {
            color: #170f01;
            text-decoration: none;
            transition: color 0.3s;
        }
        .contact-info a:hover {
            color: #170f01;
        }
        .contact-info .info {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }
        .contact-info .info img {
            margin-right: 15px;
        }
    </style>
</head>
<body>
<div class="contact-container">
    <div class="contact-form">
        <h2>envoi-nous un message</h2>
        <input type="text" placeholder="Name">
        <input type="email" placeholder="Email">
        <input type="text" placeholder="Sujet">
        <textarea placeholder="Message" rows="5"></textarea>
        <button type="submit">Send Message</button>
    </div>
    <div class="contact-info">
        <h3>Contactez nous </h3>
        <div class="info">
            <img src="https://img.icons8.com/ios-filled/24/000000/marker.png" alt="Address">
            <p> Kenia@ Universite Assane SECK Ziguinchor </p>
        </div>
        <div class="info">
            <img src="https://img.icons8.com/ios-filled/24/000000/phone.png" alt="Phone">
            <p>+221 77-343-28-78 /+221 78-456-71-20 </p>
        </div>
        <div class="info">
            <img src="https://img.icons8.com/ios-filled/24/000000/email.png" alt="Email">
            <p><a href="mailto:info@yoursite.com">info@maxthiam.com</a></p>
        </div>
        <div class="info">
            <img src="https://img.icons8.com/ios-filled/24/000000/domain.png" alt="Website">
            <p><a href="#">Gestion@.com</a></p>
        </div>
    </div>
</div>
</body>
</html>

