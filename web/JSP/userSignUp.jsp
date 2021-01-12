<%@page import="Models.Country"%>
<%@page import="java.util.List"%>
<%@page import="Services.CountryServices.CountryServiceImpl"%>
<%@page import="Services.CountryServices.CountryService"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Life Trip</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <<title>Life Trip</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--===============================================================================================-->	        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <!--===============================================================================================-->	
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"rel="stylesheet" />
        <!--===============================================================================================-->	
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
        <!--===============================================================================================-->	
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/userSignUp.css" />
        <!--===============================================================================================-->
    </head>
    <body>
        <% %>
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
            
            <section class="signup-Form w-100 h-100">
                <div class="container h-100 justify-content-center align-items-center">
                    <form class="form signForm w-50" style="margin: 0 auto;" method="POST" onsubmit="return submitUserForm();" action="../signUpController">
                        <div class="row pb-3 mb-3">
                            <div class="col-6 col-lg-6 col-md-6 col-sm-6 col-xl-6 w-50" style="overflow: visible;">
                                <h2 class="form-header" align="center">Sign up</h2>
                            </div>
                            <div class="col-6 col-lg-6 col-md-6 col-sm-6 col-xl-6 w-50 icon-plus">
                                <i class="fas fa-user-plus w-100" align="center"></i>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 col-lg-6 col-md-12 col-sm-12 col-xl-6">
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control fname" id="fname" name="fname" placeholder="First Name" pattern="[a-zA-Z]{2,45}" required>
                                    <label for="fname">First Name</label>
                                </div>
                            </div>
                            <div class="col-12 col-lg-6 col-md-12 col-sm-12 col-xl-6">
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control lname" id="lname" name="lname" placeholder="Last Name" pattern="[a-zA-Z]{2,45}" required>
                                    <label for="lname">Last Name</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 col-lg-12 col-md-12 col-sm-12 col-xl-12">
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control fullname" id="fullname" name="fullname" placeholder="Full Name" readonly>
                                    <label for="floatingInput">Full Name</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 col-lg-12 col-md-12 col-sm-12 col-xl-12">
                                <div class="form-floating mb-3">
                                    <input type="email" class="form-control" id="email" name="email" placeholder="Email Address" required>
                                    <label for="email">Email address</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 col-lg-12 col-md-12 col-sm-12 col-xl-12">
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="username" name="username" placeholder="Username"  pattern="[a-zA-Z0-9]{6,45}" required>
                                    <label for="username">Username</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 col-lg-12 col-md-12 col-sm-12 col-xl-12">
                                <div class="form-floating mb-3">
                                    <input type="number" class="form-control" id="age" name="age" placeholder="Age" patter="[0-9]" required>
                                    <label for="age">Age</label>
                                </div>
                            </div>
                        </div>
                        <div class="row" id="countries">
                            <div class="col-6 col-lg-6 col-md-6 col-sm-6 col-xl-6" id="selectCountry">
                                <select class="form-select form-select-lg mb-3" aria-label="form-select-lg example" name="country" id="countrySelect" required>
                                    <option value="None" selected>Select Country</option>
                                    <% 
                                        CountryService countriesService = new CountryServiceImpl();
                                        List<Country> countries = countriesService.selectCountries();
                                        for(int i = 0; i < countries.size(); i++){
                                            out.print("<option value='" + countries.get(i).getCountryCode() + "'>" + countries.get(i).getCountryName() + "</option>");
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="col-6 col-lg-6 col-md-6 col-sm-6 col-xl-6">
                                <select class="form-select form-select-lg mb-3" aria-label="Disabled select example" id="citySelect" name="city" disabled required>
                                    <option selected>Select City</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 col-lg-12 col-md-12 col-sm-12 col-xl-12 w-100 mb-3">
                                <div class="g-recaptcha brochure__form__captcha" align="center" data-sitekey="6Ld5PiMaAAAAAFkS62gQwNGy7SWFkgugtBXnmsyI" data-callback="verifyCaptacha"></div>
                                <div id="g-recaptcha-error"></div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 col-lg-12 col-md-12 col-sm-12 col-xl-12 w-100">
                                <button class="btn btn-primary btn-block w-100 p-3" type="submit" id="signSubmit">Create Account</button>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
        </div>
        <!--- Script Tags ------------------------------------------------------------------------------------->
        <script src="<%=request.getContextPath()%>/static/jquery.min.js"></script>
        <!--===============================================================================================---->
        <script src="https://www.google.com/recaptcha/api.js"></script>
        <!--===============================================================================================---->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
        <!--===============================================================================================--->
        <script src="<%=request.getContextPath()%>/js/signup.js" type="text/javascript"></script>
    </body>
</html>
