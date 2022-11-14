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






<jsp:include page="../components/head.jsp" >
    <jsp:param name="style" value="dashboard"/>
</jsp:include>




<jsp:include page="../components/navbar.jsp" />

<section class="dashboard w-full h-screen overflow-hidden flex bg-blue-50" >
    <div class="side-bare w-2/12 h-auto mt-24 mb-4 ml-4 rounded-2xl bg-white flex flex-col justify-center items-end gap-10 ">
        <jsp:include page="../components/DashboardLinks.jsp"/>


    </div>
    <div class="main w-9/12 h-full ">
        <c:choose>
            <c:when test="${dashboardType == 'admin'}">
                <jsp:include page="AdminDashboard.jsp"/>
            </c:when>
            <c:when test="${dashboardType == 'manager'}">
                <jsp:include page="DepartmentManager.jsp"/>
            </c:when>
            <c:when test="${dashboardType == 'director'}">
                <jsp:include page="DirectorDashboard.jsp"/>
            </c:when>
        </c:choose>
    </div>
</section>

<jsp:include page="../components/foot.jsp" />
