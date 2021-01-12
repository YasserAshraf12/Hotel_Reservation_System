<%@page import="Models.UserType"%>
<%@page import="Services.UsersServices.UserServiceImpl"%>
<%@page import="Services.UsersServices.UsersService"%>
<%@page import="Models.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Life Trip</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--===============================================================================================-->	        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
        <!--===============================================================================================-->	
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/userLogin.css" />
        <!--===============================================================================================-->
    </head>
    <body>
        <% 
            HttpSession sessionS = request.getSession(false);
            if(sessionS.getAttribute("UserID") != null){
                Users user = new Users();
                UsersService userServices = new UserServiceImpl();
                Integer id = (Integer) sessionS.getAttribute("UserID");
                user = userServices.selectByID(id);
                UserType type = user.getUserType();
                if(type.getTypeId() == 1)
                {
                    response.sendRedirect(request.getContextPath() + "/JSP/admin/dashboard.jsp");
                }else{
                    response.sendRedirect(request.getContextPath() + "/JSP/client/home.jsp");
                }
            }
        %>
        <div class="container-fluid mainController pl-0 pr-0 ml-0 mr-0">
            <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
                <div class="container">
                  <a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp">LifeTrip</a>
                  <button class="navbar-toggler" align="center" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                  </button>
                  <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                    <ul class="nav navbar-nav mr-auto justify-content-end">
                      <li align="center" class="p-1"><a href="<%=request.getContextPath()%>/JSP/userSignUp.jsp" class="btn btn-dark p-2"><i class="fas fa-user-plus"></i> Sign Up</a></li>
                      <li align="center" class="p-1"><a href="<%=request.getContextPath()%>/JSP/userLogin.jsp" class="btn btn-outline-dark p-2"><i class="fas fa-user"></i> Log In </a></li>
                    </ul>
                  </div>
                </div>
            </nav>
            <div class="main">

                <div class="wrapper">
                    <div class="card">
                        <div id="message" class="msg"></div>
                        <div class="title">
                            <h1 class="title title-large">Sign In</h1>
                            <p class="title title-subs">New user? <span><a href="userSignUp.jsp" class="linktext">Create an account</a></span></p>
                        </div>
                        
                        <form class="form" method="POST" role="form" id="myAjaxRequestForm">
                            <div class="form-group">
                                <input type="text" name="username" id="username" class="input-field" placeholder="Username" required>
                            </div>
                            <div class="form-group">
                                <input type="password" name="password" id="password" class="input-field" placeholder="Password" required>
                            </div>
                            
                            <div class="form-group mt-4">
                                <button type="submit" name="submit" class="btn btn-success btn-block" id="btn-process">Login</button>
                            </div>
                            <div class="form-group mt-4">
                                <a href="<%= request.getContextPath()%>" name="submit" class="btn btn-secondary btn-block">Back</a>
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
                                    <i class="icons icons-google fab fa-google"></i>
                                    <span>Sign in with Google</span>
                                </a>
                            </div>

                            <div class="method-item">
                                <a href="#" class="btn-action">
                                    <i class="icons icons-facebook fab fa-facebook"></i>
                                    <span>Sign in with Facebook</span>
                                </a>
                            </div>

                            <div class="method-item">
                                <a href="#" class="btn-action">
                                    <i class="icons icons-twitter fab fa-twitter"></i>
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
        <script src="<%=request.getContextPath()%>/static/jquery.min.js"></script>
        <!--===============================================================================================-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
        <!--===============================================================================================-->
        <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
        <script>
            AOS.init({
                offset: 200,
                delay: 200,
                duration: 1000
            });
        </script>
        <!--===============================================================================================--->
        <script>
            $(document).ready(function(){
                $("#myAjaxRequestForm").submit(function(e){
                    e.preventDefault();
                });
                
                $("#btn-process").on("click", ()=>{
                    var loginData = {
                        username: $("#username").val(),
                        password: $("#password").val()
                    };
                    $.ajax({
                       type: "POST",
                       url: "../login",
                       data: loginData,
                       dataType: "json",
                       success: function(data,textStatus,jqXHR){
                           if(data.item.status){
                                $("#message").html("");
                                $("#message").html(data.item.message);
                                $("#message").attr("role", "alert");
                                $("#message").addClass("alert alert-success");
                                setTimeout(function () {
                                    window.location = data.item.redirect;
                                }, 1500);
                           }else{
                               $("#message").html("");
                                $("#message").html(data.item.message);
                                $("#message").attr("role", "alert");
                                $("#message").addClass("alert alert-danger");
                           }
                       },
                       error: function(jqXHR, textStatus, errorThrown){
                           alert("Error Login");
                       }
                    });
                });
            });
        </script>
    </body>
</html>
