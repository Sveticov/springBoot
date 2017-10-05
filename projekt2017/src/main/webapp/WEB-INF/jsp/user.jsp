<%--
  Created by IntelliJ IDEA.
  User: SVETICOV
  Date: 11.09.2017
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>User</title>
</head>
<body>
<div class="container">
    <div class="row">
        <c:forEach items="${users}" var="user">
            <div class="col-lg-4">
                <h2>${user.user_id}</h2>
                <!--           this them name ###############################################-->
                <p>${user.name}</p>
                <!--  description #########################################################-->
                <p><a class="btn btn-secondary" href="/forum" role="button">View details &raquo;</a></p>
            </div>
        </c:forEach>
        <!-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55-->

        <!-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55-->
    </div>
</div>
</body>
</html>
