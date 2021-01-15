<%@page import="Models.Hotels"%>
<%@page import="Models.Comments"%>
<%@page import="java.util.List"%>
<%@page import="Services.CommentsServices.CommentServicesImpl"%>
<%@page import="Services.CommentsServices.CommentServices"%>
<%@page import="Services.HotelServices.HotelServiceImpl"%>
<%@page import="Services.HotelServices.HotelService"%>
<%@page import="Services.BookingServices.BookingServicesImpl"%>
<%@page import="Services.BookingServices.BookingService"%>
<%@page import="Models.UserType"%>
<%@page import="Models.City"%>
<%@page import="Services.CityServices.CityServiceImpl"%>
<%@page import="Services.CityServices.CityService"%>
<%@page import="Services.CountryServices.CountryServiceImpl"%>
<%@page import="Services.CountryServices.CountryService"%>
<%@page import="Models.Country"%>
<%@page import="Services.UsersServices.UsersService"%>
<%@page import="Models.Users"%>
<%@page import="Services.UsersServices.UserServiceImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Life Trip</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
        <!--===============================================================================================-->	
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/dashboard.css" />
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
                if(type.getTypeId() != 1)
                {
                    response.sendRedirect(request.getContextPath() + "/JSP/InvalidPrivacy.jsp");
                }
            }
            else{
                response.sendRedirect(request.getContextPath() + "/JSP/userLogin.jsp");
            }
            BookingService bookingService = new BookingServicesImpl();
            HotelService hotelService = new HotelServiceImpl();
        %>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Life Trip</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
                    <div class="d-flex rightM">
                        <ul class="navbar-nav">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <%
                                        Cookie cookie = null;
                                        Cookie[] cookies = null;
                                        cookies = request.getCookies();
                                        if( cookies != null ) {
                                           for (int i = 0; i < cookies.length; i++) {
                                              cookie = cookies[i];
                                              if(cookie.getName( ).equals("Username"))
                                                out.print(cookie.getValue( ));
                                           }
                                        }
                                    %>
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="#"><i class="far fa-envelope"></i> My Inbox</a></li>
                                    <li><a class="dropdown-item" href="../editProfile.jsp"><i class="far fa-address-card"></i> Edit Profile</a></li>
                                    <li><a class="dropdown-item" href="#"><i class="fas fa-question-circle"></i> Help</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/LogoutController"><i class="fas fa-sign-out-alt"></i> Log out</a></li>
                                </ul>
                            </li>
                            <li class="nav-item blockHide">
                                <a class="nav-link">
                                    <i class="fas fa-comments"></i>
                                    <span class="commentsCounter">10</span>
                                </a>
                            </li>
                            <li class="nav-item blockHide">
                                <a class="nav-link">
                                    <i class="fas fa-bell"></i>
                                    <span class="bellCounter">10</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link">
                                    <button type="button" class="btn-setting fa-1x"><i class="fas fa-cog fa-spin setting-icon"></i></button>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>

        <div class="side-menu hide">
            <hr/>
            <div class="container-fluid tempContainer">
                <div class="menu-header">
                    <div class="row">
                        <div class="col-12 col-lg-12 col-md-12 col-sm-12 col-xl-4" align="center">
                            <% 
                                Integer userID = (Integer) sessionS.getAttribute("UserID");
                                UsersService usrS = new UserServiceImpl();
                                Users user = usrS.selectByID(userID);
                                out.print("<img class='userImg' src=" + request.getContextPath() + "/images/" + user.getUserProfilePhoto() + ">");
                            %>
                            
                            
                        </div>
                        <div class="col-12 col-lg-12 col-md-12 col-sm-12 col-xl-8 pt-2" align="center">
                            <h3><% 
                                    out.print(user.getUserFirstName() + " " + user.getUserLastName());
                                %></h3>
                            <p>
                                <%
                                    Country country = user.getCountry();
                                    CountryService countryService = new CountryServiceImpl();
                                    country = countryService.selectByCountryCode(country.getCountryCode());
                                    
                                    City city = user.getCity();
                                    CityService cityService = new CityServiceImpl();
                                    city = cityService.selectByCityCode(city.getCityCode());
                                    
                                    out.print(country.getCountryName() + " - " + city.getCityName() + " - " + user.getUserAddress());
                                %>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <hr/>
            <div class="container-fluid">
                <div class="navbar-side-nav">
                    <ul class="navbar-nav">
                        <div class="container">
                            <hr />
                            <li class="nav-item">
                                <i class="far fa-envelope"></i>
                                <a href="" class="nav-link">Inbox</a>
                            </li>
                            <hr />
                            <li class="nav-item">
                                <i class="fas fa-book"></i>
                                <a href="" class="nav-link">Reservations</a>
                            </li>
                            <hr />
                            <li class="nav-item">
                                <i class="fas fa-comments"></i>
                                <a href="" class="nav-link">Comments</a>
                            </li>
                            <hr />
                            <li class="nav-item">
                                <i class="fas fa-user"></i>
                                <a href="" class="nav-link">Users</a>
                            </li>
                            <hr />
                            <li class="nav-item">
                                <i class="fas fa-tools"></i>
                                <a href="" class="nav-link">Settings</a>
                            </li>
                            <hr />
                            <li class="nav-item">
                                <i class="fas fa-hotel"></i>
                                <a href="" class="nav-link">Hotels</a>
                            </li>
                            <hr />
                            <li class="nav-item">
                                <i class="fas fa-person-booth"></i>
                                <a href="" class="nav-link">Rooms</a>
                            </li>
                            <hr />
                            <li class="nav-item">
                                <i class="fas fa-star-half-alt"></i>
                                <a href="" class="nav-link">Rating</a>
                            </li>
                            <hr />
                            <li class="nav-item">
                                <i class="fas fa-envelope-open-text"></i>
                                <a href="" class="nav-link">Send Mail</a>
                            </li>
                            <hr />
                            <li class="nav-item">
                                <i class="fas fa-laptop"></i>
                                <a href="" class="nav-link">About UI/UX</a>
                            </li>
                            <hr style="margin-bottom: 20px;"/>
                        </div>
                    </ul>
                </div>
            </div>
            <hr />
            <div class="container socialContainer">
                <ul class="social-navbar">
                    <div class="row">
                        <div class="col-12 col-lg-4 col-sm-12 col-md-12 col-xl-4 pt-2 colDiv">
                            <li class="nav-item">
                                <a class="nav-link">
                                    <i class="fab fa-facebook"></i>
                                </a>
                            </li>
                        </div>             
                        <div class="col-12 col-lg-4 col-sm-12 col-md-12 col-xl-4 pt-2 colDiv">
                            <li class="nav-item">
                                <a class="nav-link">
                                    <i class="fab fa-twitter"></i>
                                </a>
                            </li>
                        </div>             
                        <div class="col-12 col-lg-4 col-sm-12 col-md-12 col-xl-4 pt-2 colDiv">
                            <li class="nav-item">
                                <a class="nav-link">
                                    <i class="fab fa-instagram"></i>
                                </a>
                            </li>
                        </div>             
                        <div class="col-12 col-lg-4 col-sm-12 col-md-12 col-xl-4 pt-2 colDiv">
                            <li class="nav-item">
                                <a class="nav-link">
                                    <i class="fab fa-google-plus-g"></i>
                                </a>
                            </li>
                        </div>             
                        <div class="col-12 col-lg-4 col-sm-12 col-md-12 col-xl-4 pt-2 colDiv">
                            <li class="nav-item">
                                <a class="nav-link">
                                    <i class="fab fa-youtube"></i>
                                </a>
                            </li>
                        </div>                                                                    
                        <div class="col-12 col-lg-4 col-sm-12 col-md-12 col-xl-4 pt-2 colDiv">
                            <li class="nav-item">
                                <a class="nav-link">
                                    <i class="fab fa-pinterest"></i>
                                </a>
                            </li>
                        </div>                                                                    
                    </div>
                </ul>
            </div>
        </div>

        <section class="bodyContainer slideLeft mt-5">
            <div class="container-fluid">
                <section class="dashboard-cards">
                    <div class="container-fluid">
                        <div class="row mt-5">
                            <div class="col-12 col-sm-12 col-md-12 col-lg-3 col-xl-3 p-2 mb-3">
                                <div class="card card-hover bg-danger">
                                    <div class="card-body">
                                        <div class="d-flex">
                                            <div class="mr-4">
                                                <small>Number of Users</small>
                                                <h4 class="mb-0">
                                                    <% 
                                                        out.print(usrS.countUsers());
                                                    %>
                                                </h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- column -->
                            <div class="col-12 col-sm-12  col-md-12 col-lg-3 col-xl-3 p-2 mb-3">
                                <div class="card card-hover bg-warning">
                                    <div class="card-body">
                                        <div class="d-flex">
                                            <div class="mr-4">
                                                <small>Number Of Reservations</small>
                                                <h4 class="mb-0">
                                                    <%
                                                        out.print(bookingService.countBooking());
                                                    %>
                                                </h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- column -->
                            <div class="col-12 col-sm-12  col-md-12 col-lg-3 col-xl-3 p-2 mb-3">
                                <div class="card card-hover bg-success">
                                    <div class="card-body">
                                        <div class="d-flex">
                                            <div class="mr-4">
                                                <small>Number Of Pending Reservation</small>
                                                <h4 class="mb-0">120</h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-sm-12  col-md-12 col-lg-3 col-xl-3 p-2 mb-3">
                                <div class="card card-hover bg-info">
                                    <div class="card-body">
                                        <div class="d-flex">
                                            <div class="mr-4">
                                                <small>Number Of Hotels</small>
                                                <h4 class="mb-0">
                                                <%
                                                    out.print(hotelService.countHotels());
                                                %>
                                                </h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>                    
                </section>
            </div>
            <div class="container-fluid">
                <div class="testimonials">
                    <div class="testimonial-inner">
                        <h1>Lastest Comments</h1>
                        <div class="border"></div>
                    
                        <div class="row">
                            <%
                                CommentServices commentService = new CommentServicesImpl();
                                List<Comments> comments = commentService.getLastComments();
                                for(int i = 0; i < comments.size(); i++){
                                    Users commentPerson = comments.get(i).getUsers();
                                    out.print("<div class='col'><div class='testimonial'>");
                                    out.print("<img class='imgPerson' src='Avatar.png'>");
                                    out.print("<div class='name'>" + commentPerson.getUserFirstName() + " " + commentPerson.getUserLastName() + "</div><div class='stars'><i class='fas fa-star'></i><i class='fas fa-star'></i><i class='fas fa-star'></i><i class='fas fa-star'></i><i class='fas fa-star'></i></div>");
                                    out.print("<p>" + comments.get(i).getCommentContent() + "</p>");
                                    out.print("</div></div>");
                                }
                            %>
                        </div>
                        <div class="row">
                            <div class="col-12 justify-content-end p-2">
                                <a href="#" id="seeMore" style="color: #6ab04c; font-size: 18px; text-decoration: none;">See more <i class="fas fa-angle-double-right ml-1 pt-1" style="font-size: 15px;"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid cancellationSection">

            </div>
            <div class="container-fluid footerSection">
                <div class="footerContent pt-3">
                    &copy; copyrights FCI Students
                </div>
            </div>
        </section>
                        
        <!---- Script Tags ---->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
        <script>AOS.init({ offset: 200, delay: 200, duration: 1000 });</script>
        <!--===============================================================================================--->
        <script src="<%=request.getContextPath()%>/js/dashboard.js"></script>
        
    </body>
</html>
