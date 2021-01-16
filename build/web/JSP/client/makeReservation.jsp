<%@page import="Models.Rooms"%>
<%@page import="Services.roomServices.RoomServiceImpl"%>
<%@page import="Services.roomServices.RoomService"%>
<%@page import="Services.HotelServices.HotelServiceImpl"%>
<%@page import="Models.Hotels"%>
<%@page import="Services.HotelServices.HotelService"%>
<%@page import="java.util.List"%>
<%@page import="Services.CityServices.CityServiceImpl"%>
<%@page import="Models.City"%>
<%@page import="Services.CityServices.CityService"%>
<%@page import="Services.CountryServices.CountryServiceImpl"%>
<%@page import="Services.CountryServices.CountryService"%>
<%@page import="Models.Country"%>
<%@page import="Models.Users"%>
<%@page import="Services.UsersServices.UserServiceImpl"%>
<%@page import="Services.UsersServices.UsersService"%>
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
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/editProfile.css" />
    </head>
    <body>

        <%
            HttpSession sessionS = request.getSession(false);
            if (sessionS.getAttribute("UserID") == null) {
                response.sendRedirect("userLogin.jsp");
            }
            Integer userID = (Integer) sessionS.getAttribute("UserID");
            String roomID = request.getParameter("id");
            RoomService roomService = new RoomServiceImpl();
            Rooms room = roomService.selectRoomByID(Integer.parseInt(roomID));
            UsersService usrS = new UserServiceImpl();
            Users user = usrS.selectByID(userID);

            HotelService hotel = new HotelServiceImpl();
//            Hotels user = usrS.selectByID(userID);
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
                                        if (cookies != null) {
                                            for (int i = 0; i < cookies.length; i++) {
                                                cookie = cookies[i];
                                                if (cookie.getName().equals("Username")) {
                                                    out.print(cookie.getValue());
                                                }
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
                                <i class="fas fa-rss"></i>
                                <a href="" class="nav-link">New Feeds</a>
                            </li>
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
            <div class="container"><br><br>
                <div class="row" id="main">
                    <div class="col-md-12">
                        <form role="form" id="myForm" method="POST">
                            <h2 style="color: white;">Book Your Room.<small>It's always easy</small></h2>
                            <hr class="colorgraph">
                            <div class="row  p-2"></div>

                            <div class="row pb-2">
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 col-xl-6 col-12 p-2">
                                    <div class="form-group">
                                        <input hidden type="text" name="room_ID" id="room_ID" class="form-control input-lg"  value="<%=room.getRoomId() %>" tabindex="1">
                                    </div>   
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 col-xl-6 col-12 p-2">
                                    <div class="form-group">
                                        <input hidden type="text" name="hotel_ID" id="hotel_ID" class="form-control input-lg"  value="<%=room.getHotels().getHotelId() %>" tabindex="1" >
                                    </div>   
                                </div>

                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 col-xl-6 col-12 p-2">
                                    <div class="form-group">
                                        <label for="room_Number" style="color: white">Room Number </label>
                                        <input type="text" name="room_Number" id="room_Number" class="form-control input-lg" placeholder="Room Number" value="<%=room.getRoomNumber()%>" tabindex="1" readonly  required>
                                    </div>   
                                </div>

                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 col-xl-6 col-12 p-2">
                                    <div class="form-group">
                                        <label for="hotel_name" style="color: white">Hotel Name</label>
                                        <input type="text" name="Hotel_name" id="hotel_name" class="form-control input-lg" placeholder="Hotel Name" value="<%=room.getHotels().getHotelName()%>" tabindex="2"  readonly required>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 col-xl-6 col-12 p-2" required>
                                    <div class="form-group">
                                        <label for="from_date"style="color: white" >From </label>
                                        <input type="date" id="from_date" name="from" class="form-control input-lg"> 
                                        <h5 id="dateRangecheck" > 
                                        </h5> 
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 col-xl-6 col-12 p-2" required>
                                    <div class="form-group">
                                        <label for="to_date" style="color: white">To</label>
                                        <input type="date" id="to_date" name="to" class="form-control input-lg">
                                        <h5 id="dateRangecheck" > 
                                        </h5> 
                                    </div>
                                </div>
                            </div>     
                            <hr class="colorgraph">
                            <div class="row">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 col-12 p-2 w-100" align="center">
                                    <button type="submit" class="btn btn-primary btn-block btn-lg w-50 p-3" id="saveButton">Save</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>       
        </section><!--
                  
                  
                  
        <!-- Button trigger modal -->


        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        ...
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>


        <!---- Script Tags ---->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
        <script>AOS.init({offset: 200, delay: 200, duration: 1000});</script>
        <!--===============================================================================================--->
        <script src="<%=request.getContextPath()%>/js/makeReservation.js"></script>
    </body>
</html>