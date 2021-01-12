<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Life Trip</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--===============================================================================================-->	
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <!--===============================================================================================-->	
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
        <!--===============================================================================================-->	
        <link rel="stylesheet" href="../css/userLogin.css" />
        <!--===============================================================================================-->
    </head>
    <body>
        <div class="container-fluid mainController pl-0 pr-0 ml-0 mr-0">
            <nav class="navbar navbar-expand-lg navbar-light bg-dark">
                <div class="container">
                    <a class="navbar-brand" data-aos="fade-up" href="index.html">Life Trip</a>
                    <div class="d-flex">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0 social-nav" data-aos="fade-down">
                            <li class="list-item"><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                            <li class="list-item"><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                            <li class="list-item"><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                            <li class="list-item"><a href="#"><i class="fa fa-youtube-play" aria-hidden="true"></i></a></li>
                        </ul>
                    </div>
                </div>
            </nav>
            <div class="main">

                <div class="wrapper">
                    <div class="card">
                        <div class="title">
                            <h1 class="title title-large">Sign In</h1>
                            <p class="title title-subs">New user? <span><a href="userSignUp.jsp" class="linktext">Create an account</a></span></p>
                        </div>

                        <form class="form" method="POST" action="../../Hotel_Reservation_System/login">
                            <div class="form-group">
                                <input type="text" name="username" id="username" class="input-field" placeholder="Username" required>
                            </div>
                            <div class="form-group">
                                <input type="password" name="password" id="password" class="input-field" placeholder="Password" required>
                            </div>
                            
                            <div class="form-group mt-4">
                                <button type="submit" name="submit" class="btn btn-success btn-block">Login</button>
                            </div>
                            <div class="form-group mt-4">
                                <a href="../index.html" name="submit" class="btn btn-secondary btn-block">Back</a>
                            </div>
                            <div class="form-group">
                                <a href="#" class="linktext">Forgot Password</a>
                            </div>
                        </form>

                        <div class="line">
                            <span class="line-bar"></span>
                            <span class="line-text">Or</span>
                            <span class="line-bar"></span>
                        </div>

                        <div class="method">

                            <div class="method-item">
                                <a href="#" class="btn-action">
                                    <i class="icons icons-google fa fa-google"></i>
                                    <span>Sign in with Google</span>
                                </a>
                            </div>

                            <div class="method-item">
                                <a href="#" class="btn-action">
                                    <i class="icons icons-facebook fa fa-facebook"></i>
                                    <span>Sign in with Facebook</span>
                                </a>
                            </div>

                            <div class="method-item">
                                <a href="#" class="btn-action">
                                    <i class="icons icons-twitter fa fa-twitter"></i>
                                    <span>Sign in with Twitter</span>
                                </a>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--- Script Tags --->
        <!--===============================================================================================-->
        <script src="../static/jquery.min.js"></script>
        <!--===============================================================================================-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
        <!--===============================================================================================-->
        <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
        <script>
            AOS.init({
                offset: 200, // offset (in px) from the original trigger point
                delay: 200, // values from 0 to 3000, with step 50ms
                duration: 1000, // values from 0 to 3000, with step 50ms
            });
        </script>
        <!--===============================================================================================--->
    </body>
</html>
