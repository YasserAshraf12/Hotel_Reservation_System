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
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/userTable.css" />
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
                                    <li><a class="dropdown-item" href="#"><i class="far fa-address-card"></i> Edit Profile</a></li>
                                    <li><a class="dropdown-item" href="#"><i class="fas fa-question-circle"></i> Help</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="#"><i class="fas fa-sign-out-alt"></i> Log out</a></li>

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
                <table id="example" class="table table-striped table-bordered display" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th>Order</th>
                                <th>Description</th>
                                <th>Deadline</th>
                                <th>Status</th>
                                <th>Amount</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>Alphabet puzzle</td>
                                <td>2016/01/15</td>
                                <td>Done</td>
                                <td data-order="1000">€1.000,00</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Layout for poster</td>
                                <td>2016/01/31</td>
                                <td>Planned</td>
                                <td data-order="1834">€1.834,00</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Image creation</td>
                                <td>2016/01/23</td>
                                <td>To Do</td>
                                <td data-order="1500">€1.500,00</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>Create font</td>
                                <td>2016/02/26</td>
                                <td>Done</td>
                                <td data-order="1200">€1.200,00</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>Sticker production</td>
                                <td>2016/02/18</td>
                                <td>Planned</td>
                                <td data-order="2100">€2.100,00</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td>Glossy poster</td>
                                <td>2016/03/17</td>
                                <td>To Do</td>
                                <td data-order="899">€899,00</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td>Beer label</td>
                                <td>2016/05/28</td>
                                <td>Confirmed</td>
                                <td data-order="2499">€2.499,00</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td>Shop sign</td>
                                <td>2016/04/19</td>
                                <td>Offer</td>
                                <td data-order="1099">€1.099,00</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td>X-Mas decoration</td>
                                <td>2016/10/31</td>
                                <td>Confirmed</td>
                                <td data-order="1750">€1.750,00</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td>Halloween invite</td>
                                <td>2016/09/12</td>
                                <td>Planned</td>
                                <td data-order="400">€400,00</td>
                            </tr>
                            <tr>
                                <td>11</td>
                                <td>Wedding announcement</td>
                                <td>2016/07/09</td>
                                <td>To Do</td>
                                <td data-order="299">€299,00</td>
                            </tr>
                            <tr>
                                <td>12</td>
                                <td>Member pasport</td>
                                <td>2016/06/22</td>
                                <td>Offer</td>
                                <td data-order="149">€149,00</td>
                            </tr>
                            <tr>
                                <td>13</td>
                                <td>Drink tickets</td>
                                <td>2016/11/01</td>
                                <td>Confirmed</td>
                                <td data-order="199">€199,00</td>
                            </tr>
                            <tr>
                                <td>14</td>
                                <td>Album cover</td>
                                <td>2017/03/15</td>
                                <td>To Do</td>
                                <td data-order="4999">€4.999,00</td>
                            </tr>
                            <tr>
                                <td>15</td>
                                <td>Shipment box</td>
                                <td>2017/02/08</td>
                                <td>Offer</td>
                                <td data-order="1399">€1.399,00</td>
                            </tr>

                            <tr>
                                <td>16</td>
                                <td>Wooden puzzle</td>
                                <td>2017/01/11</td>
                                <td>Done</td>
                                <td data-order="1000">€1.000,00</td>
                            </tr>
                            <tr>
                                <td>17</td>
                                <td>Fashion Layout</td>
                                <td>2016/01/30</td>
                                <td>Planned</td>
                                <td data-order="1834">€1.834,00</td>
                            </tr>
                            <tr>
                                <td>18</td>
                                <td>Toy creation</td>
                                <td>2016/01/10</td>
                                <td>To Do</td>
                                <td data-order="1550">€1.550,00</td>
                            </tr>
                            <tr>
                                <td>19</td>
                                <td>Create stamps</td>
                                <td>2016/02/26</td>
                                <td>Done</td>
                                <td data-order="1220">€1.220,00</td>
                            </tr>
                            <tr>
                                <td>20</td>
                                <td>Sticker design</td>
                                <td>2017/02/18</td>
                                <td>Planned</td>
                                <td data-order="2100">€2.100,00</td>
                            </tr>
                            <tr>
                                <td>21</td>
                                <td>Poster rock concert</td>
                                <td>2017/04/17</td>
                                <td>To Do</td>
                                <td data-order="899">€899,00</td>
                            </tr>
                            <tr>
                                <td>22</td>
                                <td>Wine label</td>
                                <td>2017/05/28</td>
                                <td>Confirmed</td>
                                <td data-order="2799">€2.799,00</td>
                            </tr>
                            <tr>
                                <td>23</td>
                                <td>Shopping bag</td>
                                <td>2017/04/19</td>
                                <td>Offer</td>
                                <td data-order="1299">€1.299,00</td>
                            </tr>
                            <tr>
                                <td>24</td>
                                <td>Decoration for Easter</td>
                                <td>2017/10/31</td>
                                <td>Confirmed</td>
                                <td data-order="1650">€1.650,00</td>
                            </tr>
                            <tr>
                                <td>25</td>
                                <td>Saint Nicolas colorbook</td>
                                <td>2017/09/12</td>
                                <td>Planned</td>
                                <td data-order="510">€510,00</td>
                            </tr>
                            <tr>
                                <td>26</td>
                                <td>Wedding invites</td>
                                <td>2017/07/09</td>
                                <td>To Do</td>
                                <td data-order="399">€399,00</td>
                            </tr>
                            <tr>
                                <td>27</td>
                                <td>Member pasport</td>
                                <td>2017/06/22</td>
                                <td>Offer</td>
                                <td data-order="249">€249,00</td>
                            </tr>
                            <tr>
                                <td>28</td>
                                <td>Drink tickets</td>
                                <td>2017/11/01</td>
                                <td>Confirmed</td>
                                <td data-order="199">€199,00</td>
                            </tr>
                            <tr>
                                <td>29</td>
                                <td>Blue-Ray cover</td>
                                <td>2018/03/15</td>
                                <td>To Do</td>
                                <td data-order="1999">€1.999,00</td>
                            </tr>
                            <tr>
                                <td>30</td>
                                <td>TV carton</td>
                                <td>2019/02/08</td>
                                <td>Offer</td>
                                <td data-order="1369">€1.369,00</td>
                            </tr>
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
        <script>AOS.init({ offset: 200, delay: 200, duration: 1000 });</script>
        <!--===============================================================================================--->
        <script src="<%=request.getContextPath()%>/js/userTable.js"></script>
        
    </body>
</html>
