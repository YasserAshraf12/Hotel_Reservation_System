<%@page import="Models.Booking"%>
<%@page import="Services.BookingServices.BookingService"%>
<%@page import="Services.BookingServices.BookingServicesImpl"%>
<%@page import="Models.RoomAvailability"%>
<%@page import="Services.roomAvailabilityServices.RoomAvailabilityServicesImpl"%>
<%@page import="Services.roomAvailabilityServices.RoomAvailabilityServices"%>
<%@page import="Models.Rooms"%>
<%@page import="Services.SpecifichotelFeaturesServices.SpecificHotelFeaturesServiceImpl"%>
<%@page import="Services.SpecifichotelFeaturesServices.SpecificHotelFeatureService"%>
<%@page import="Models.Hotels"%>
<%@page import="Services.HotelServices.HotelServiceImpl"%>
<%@page import="Services.HotelServices.HotelService"%>
<%@page import="Services.HotelServices.HotelService"%>
<%@page import="java.util.List"%>
<%@page import="Models.Users"%>
<%@page import="Services.UsersServices.UserServiceImpl"%>
<%@page import="Services.UsersServices.UsersService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Life Trip</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous" />
        <link href="https://cdn.datatables.net/1.10.23/css/dataTables.bootstrap5.min.css" />
        <link href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css" />
        <link href="https://cdn.datatables.net/buttons/1.6.5/css/buttons.dataTables.min.css" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
        <!--===============================================================================================-->	
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/hotelTable.css" />
    </head>
    <body>
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
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">My Profile</a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="#"><i class="far fa-envelope"></i> My Inbox</a></li>
                                    <li><a class="dropdown-item" href="../editProfile.jsp"><i class="far fa-address-card"></i> Edit Profile</a></li>
                                    <li><a class="dropdown-item" href="#"><i class="fas fa-question-circle"></i> Help</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="../../LogoutController"><i class="fas fa-sign-out-alt"></i> Log out</a></li>

                                </ul>
                            </li>
                            <li class="nav-item blockHide">
                                <a class="nav-link">
                                    <i class="fas fa-comments"></i>
                                    <span class="commentsCounter">23</span>
                                </a>
                            </li>
                            <li class="nav-item blockHide">
                                <a class="nav-link">
                                    <i class="fas fa-bell"></i>
                                    <span class="bellCounter">23</span>
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
                            <img class="userImg" src="<%=request.getContextPath()%>/images/photo.jpg" />
                        </div>
                        <div class="col-12 col-lg-12 col-md-12 col-sm-12 col-xl-8 pt-2" align="center">
                            <h3>Yasser Ashraf</h3>
                            <p>Lorem ipsum dolor sit </p>
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
        <div class="bodyContainer slideLeft mt-5">
            <div class="container">
                <div class="p-5">
                    <div class="btn-group">
                        <button type="button" class="btn btn-success dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">Show/Hide Column</button>
                        <ul class="dropdown-menu">

                            <li><a class="toggle-vis dropdown-item" data-column="0"> Room Number</a></li>
                            <li><a class="toggle-vis dropdown-item" data-column="1"> Hotel Name</a></li>
                            <li><a class="toggle-vis dropdown-item" data-column="2">Room Floor</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="toggle-vis dropdown-item" data-column="3">Booking Status</a></li>
                            <li><a class="toggle-vis dropdown-item" data-column="4">from Date</a></li>
                            <li><a class="toggle-vis dropdown-item" data-column="4">to Date</a></li>

                        </ul>
                    </div>
                </div>

                <table id="example" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>Room Number</th>
                            <!--<th>Room ID</th>-->
                            <th>Hotel Name</th>
                            <th>Room Floor</th>
                            <th>Booking Status</th>
                            <th>from Date</th>
                            <th>to Date</th>
                            <th>Cancel Room</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%

                            HttpSession sessionS = request.getSession(false);
                            if (sessionS.getAttribute("UserID") == null) {
                                response.sendRedirect("userLogin.jsp");
                            }
                            BookingService bookingServices = new BookingServicesImpl();
                            String userID = request.getSession().getAttribute("UserID").toString();
                            List<Booking> reservations = bookingServices.getReservation(Integer.parseInt(userID));

                            for (int i = 0; i < reservations.size(); i++) {
                                out.println("<tr>");

//                                out.println("<td class='hotelId'>" + rooms.get(i).getRoomTypes() + "</td>");
//                                out.println("<td>" + AvailRooms.get(i).getRooms().getRoomId() + "</td>");
                                out.println("<td>" + reservations.get(i).getRooms().getRoomNumber() + "</td>");
//                                        getRoomAvailabilityStatus()+ "</td>");
                                out.println("<td>" + reservations.get(i).getRooms().getHotels().getHotelName() + "</td>");
                                out.println("<td>" + reservations.get(i).getRooms().getRoomFloor() + "</td>");
                                out.println("<td>" + reservations.get(i).getBookingStatus().getBookingStatusDescription() + "</td>");
                                String bookingStatus = reservations.get(i).getBookingStatus().getBookingStatusCode();
                                out.println("<td>" + reservations.get(i).getDateFrom() + "</td>");
                                out.println("<td>" + reservations.get(i).getDateTo() + "</td>");
                                if (bookingStatus.equals("P")) {
                                    out.println("<td><input type= 'submit' name='cancel_room'  id='cancelRoom' value='Cancel Reservation' class='btn btn-primary' disabled></td>");
//                                     out.println("<td> <a href='#?id=" + AvailRooms.get(i).getRooms().getRoomId() + "' " + "id='viewHotel' class='btn btn-info'>Book Room</a></td>");
                                } else {
                                    out.println("<td><input type= 'submit' name='cancel_room'  id='cancelRoom' value='Cancel Reservation' class='btn btn-primary' ></td>");
                                }

//                                out.println("<td>" + hotels.get(i).getHotelAddress() + "</td>");
//                                out.println("<td> <a href='makeReservation.jsp?id=" + AvailRooms.get(i).getRooms().getRoomId() + "' " + "id='viewHotel' class='btn btn-info'>Book Room</a></td>");
                                out.println("</tr>");
                            }
                        %>

                    </tbody>
                </table>
            </div>
        </div>
        <!--------Script Tags --------->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/1.6.5/js/dataTables.buttons.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/1.6.5/js/buttons.colVis.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/1.6.5/js/buttons.print.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
        <script src="https://cdn.datatables.net/buttons/1.6.5/js/buttons.html5.min.js"></script>






        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
        <script>AOS.init({offset: 200, delay: 200, duration: 1000});</script>
        <!--===============================================================================================--->
        <!--<script src="<%=request.getContextPath()%>/js/userTable.js"></script>-->
        <script src="<%=request.getContextPath()%>/js/roomTable.js"></script>/

    </body>
</html>
