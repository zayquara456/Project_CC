<head>
    <style type="text/css">
        body {
            font-family: Helvetica;
            background-color: #202A3E
        }

        section {text-align: center;
            margin-top: 20%;
        }

        section .circle, section .thin {
            background-color: #2CA9D7;
            display: inline-block
        }

        section .circle {
            width: 13px;
            height: 13px;
            border-radius: 50%
        }

        section .thin {
            height: 30px;
            width: 10px;
            border-top-right-radius: 6px;
            border-bottom-left-radius: 6px
        }

        section p {
            color: #FFF;
            display: inline;
            font-size: 31px;
            margin-left: 11px;
            font-weight: 700
        }

        input[type="text"], input[type="password"] {
            display: block;
            border: 0;
            padding: 5px;
            background-color: #353E51;
            width:339px;
            height:36px;
            margin: 20px auto;
            font-size: 17px;
            border-radius: 3px;
            text-indent: 5px;
            color: #7B828B
        }

        a {
            text-decoration: none;
            color: #7B828B;
            font-size: 14px
        }
        input[type="submit"] {
            color: #FFF;
            background-color: #2DC185;
            border: 0;
            padding: 7px 8px;
            font-size: 17px;
            text-transform: capitalize;
            border-radius: 3px;
            margin-left: 109px
        }

        ::-webkit-input-placeholder {
            color: #7B828B;
        }

        :-moz-placeholder { /* Firefox 18- */
            color: #7B828B;
        }

        ::-moz-placeholder {  /* Firefox 19+ */
            color: #7B828B;
        }

        :-ms-input-placeholder {
            color: #7B828B;
        }
    </style>
</head>
<body>

<section>
    <div class="circle"></div>
    <div class="thin"></div>
    <p>Login</p>

    <form method="post" action="">
        <input type="text" name="username" value="<?php if(isset($_SESSION['username']) ? $_SESSION['username'] : "") ?>" id="username" placeholder="Username">
        <input type="password" name="password" value="" id="password" placeholder="Password">
        <a href="register.html">Create an Account</a>
        <input type="submit" name="login" value="log in">
    </form>

</section>

</body>