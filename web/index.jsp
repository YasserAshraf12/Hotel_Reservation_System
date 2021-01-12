<%@page import="Models.Users"%>
<%@page import="Services.UsersServices.UserServiceImpl"%>
<%@page import="Services.UsersServices.UsersService"%>
<%@page import="java.util.List"%>
<%@page import="Models.Comments"%>
<%@page import="Services.CommentsServices.CommentServices"%>
<%@page import="Services.CommentsServices.CommentServicesImpl"%>
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
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/index.css"> 
  <!--===============================================================================================-->
</head>

<body>
  <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
    <div class="container">
      <a class="navbar-brand" href="<%=request.getContextPath()%>">LifeTrip</a>
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
  

  <div class="sec1">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div id="content">
            <h1 style="font-family: 'Pacifico', cursive;" class="captionHeading">LifeTrip</h1>
            <h3>Your Magic Imaginary Trip becomes True Now </h3>
            <hr>
            <a class="btn btn-light btn-lg get-started" href="#sec-testimonials">Lets Take Tour <span class="fas fa-compress-alt" aria-hidden="true"></span></a>
          </div>
        </div>
      </div>
    </div>
  </div>

<section class="sec2">
  <div id="root">
    <div class="container pt-5">
      <div class="row align-items-stretch">
        <div class="c-dashboardInfo col-lg-4 col-md-6">
          <div class="wrap">
            <h4 class="heading heading5 hind-font medium-font-weight c-dashboardInfo__title"> Number of Users <svg
                class="MuiSvgIcon-root-19" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="presentation">
                <path fill="none" d="M0 0h24v24H0z"></path>
                <path
                  d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm1 15h-2v-6h2v6zm0-8h-2V7h2v2z">
                </path>
              </svg></h4><span class="hind-font caption-12 c-dashboardInfo__count" id="usersCount">10,500</span>
          </div>
        </div>
        <div class="c-dashboardInfo col-lg-4 col-md-6">
          <div class="wrap">
            <h4 class="heading heading5 hind-font medium-font-weight c-dashboardInfo__title"> Number of Hotels <svg
                class="MuiSvgIcon-root-19" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="presentation">
                <path fill="none" d="M0 0h24v24H0z"></path>
                <path
                  d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm1 15h-2v-6h2v6zm0-8h-2V7h2v2z">
                </path>
              </svg></h4><span class="hind-font caption-12 c-dashboardInfo__count" id="hotelsCount">500</span>
          </div>
        </div>
        <div class="c-dashboardInfo col-lg-4 col-md-6">
          <div class="wrap">
            <h4 class="heading heading5 hind-font medium-font-weight c-dashboardInfo__title"> Number of Bookings <svg
                class="MuiSvgIcon-root-19" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="presentation">
                <path fill="none" d="M0 0h24v24H0z"></path>
                <path
                  d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm1 15h-2v-6h2v6zm0-8h-2V7h2v2z">
                </path>
              </svg></h4><span class="hind-font caption-12 c-dashboardInfo__count" id="bookingsCount">5000</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

  <section id="sec-testimonials" class="sec-testimonials">
    <div class="container">
      <h1 class="h4 mb-5 text-center">Words from our members</h1>
      
      <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"></li>
          <li data-target="#carouselExampleIndicators" data-bs-slide-to="1"></li>
          <li data-target="#carouselExampleIndicators" data-bs-slide-to="2"></li>
        </ol>
        
        <div class="carousel-inner" role="listbox">
            <%
                CommentServices commentServices = new CommentServicesImpl();
                List<Comments> list = commentServices.getRandomComments();
                for(int i = 0; i < list.size(); i++){
                    Users user = list.get(i).getUsers();
                    if(i == 0)
                        out.print("<div class='carousel-item active'>");
                    else
                        out.print("<div class='carousel-item'>");
                    out.print("<div class='row justify-content-center'>");
                    out.print("<div class='col-md-6'>");
                    out.print("<blockquote class='blockquote'>");
                    out.print("<small>" + list.get(i).getCommentContent().toString() + "</small>");
                    out.print("<footer class='blockquote-footer mt-2'>" + (user.getUserFirstName() + " " + user.getUserLastName())+ "</footer>");
                    out.print("</blockquote>");
                    out.print("</div>");
                    out.print("</div>");
                    out.print("</div>");
                    out.flush();
                }

            %>
        </div>
        
        <a class="carousel-control-prev cr-in" href="#carouselExampleIndicators" role="button" data-bs-slide="prev">
          <span class="fas fa-angle-left fa-2x"></span>
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </a>
        
        <a class="carousel-control-next cr-in" href="#carouselExampleIndicators" role="button" data-bs-slide="next">
          <span class="fa fa-angle-right fa-2x"></span>
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </a>
      </div>
    </div>
  </section>


  <section id="sec-contact" class="sec-contact pt-5 pb-5 mt-5">
    <div class="row">
      <div class="col">
        <h2 class="text-center py-3">Have Question? Contact Us</h2>
        </div>
    </div>
    <div class="row">
      <div class="col-md-8 col-sm-10 offset-md-2 offset-sm-1">
        <form method="POST" class="needs-validation" id="myAjaxForm" novalidate>
          <div class="form-group">
            <label for="fname">Full name: *</label>
            <input type="text" class="form-control" id="fname" name="fname" placeholder="Your full name..." required>
            <div class="invalid-feedback">Please provide a valid name.</div>
          <div class="form-group">
            <label class="mt-3" for="email">E-mail: *</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="Your e-mail..." required>
            <div class="invalid-feedback">Please provide a valid e-mail.</div>
          <div class="form-group">
            <label class="mt-3" for="phone">Phone: *</label>
            <input type="tel" class="form-control" id="phone" name="phone" placeholder="Phone number..." required>
            <div class="invalid-feedback">Please provide a valid phone number.</div>
          <div class="form-group">
            <label class="mt-3" for="comment">Your comment</label>
            <textarea class="form-control" id="comment" name="comment" rows="3" placeholder="Your Message here"></textarea>
          </div>
          <div class="form-group mt-3" style="text-align: center;">
              <button type="submit" class="btn btn-primary btn-block w-30" id="sendMail">Send Mail</button>
          </div>
        </form>
      </div> 
    </div>
  </section>

  <div class="py-3 text-center footer">
    &copy; Copyright 
    <script>
      document.write(new Date().getFullYear());
    </script> FCI Student 
  </div>
    <!--/.Copyright-->

  
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
    <script>
        AOS.init({
                offset: 200, // offset (in px) from the original trigger point
                delay: 200, // values from 0 to 3000, with step 50ms
                duration: 1000, // values from 0 to 3000, with step 50ms
        });
    </script>
    <!--===============================================================================================-->
  <script type="text/javascript" src="<%=request.getContextPath()%>/js/index.js"></script>
</body>

</html>