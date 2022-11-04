<%@ page import="com.marjanepromotion.models.DepartmentManager" %>
<%@ page import="java.util.List" %>
<%@ page import="com.marjanepromotion.models.Promotion" %>
<%@ page import="com.marjanepromotion.models.Center" %>
<%@ page import="com.marjanepromotion.models.Department" %>
<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: Youcode
  Date: 10/27/2022
  Time: 9:36 AM
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>






<jsp:include page="./components/head.jsp" >
    <jsp:param name="style" value="style"/>
</jsp:include>




<jsp:include page="./components/navbar.jsp" />

<section class="main">
    <div class="main__backgroundContainer">
        <h1 class="main__title">
            Le portail <span class="marjane">Marjane</span><br>
            pour ses brillants <span class="agents">agents</span>
        </h1>

        <div class="main__infos">
            <h2 class="">lorem ipsum galar golor</h2>
            <p>Reference site about Lorem Ipsum, giving information on its
                origins, as well as a random Lipsum generator.
            </p>
            <a class="button" href="/login.html">SE CONNECTER</a>
        </div>
    </div>

</section>

<jsp:include page="./components/foot.jsp" />
