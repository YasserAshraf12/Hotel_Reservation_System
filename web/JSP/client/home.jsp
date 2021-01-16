<%@page contentType="text/html" pageEncoding="UTF-8" session="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Life Trip</title>
    </head>
    <body>
        <h1>Hello World! Client</h1>
        
        <%
            HttpSession sessionS = request.getSession(false);
            Integer userID = (Integer) sessionS.getAttribute("UserID");
            out.print(userID);
            

            response.sendRedirect(request.getContextPath() + "/JSP/client/hotelTable.jsp");
        %>
    </body>
</html>
