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

<section class="dashboard w-full h-screen overflow-hidden flex bg-gray-100" >
    <div class="side-bare w-2/12 h-auto mt-24 mb-4 ml-4 rounded-2xl bg-white flex flex-col justify-center items-end gap-10 ">

        <a href="#" class="link w-10/12 h-16 flex justify-start align-center rounded-l-2xl pr-4 lg:pr-8 bg-gray-100">
            <img class="w-8 h-8 my-auto mx-1" src="${pageContext.request.contextPath}/assets/images/ri_admin-fill.svg" alt="Promotions">
            <p class="font-bold flex text-md h-6/12 my-auto">Promotions</p>
        </a>
        <a href="#" class="link w-10/12 h-16 flex justify-start align-center rounded-l-2xl  pr-4 ">
            <img class="w-8 h-8 my-auto mx-1" src="${pageContext.request.contextPath}/assets/images/ri_admin-fill.svg" alt="Promotions">
            <p class="font-bold flex text-md h-6/12 my-auto">Admins</p>
        </a>
        <a href="#" class="link w-10/12 h-16 flex justify-start align-center rounded-l-2xl  pr-4 ">
            <img class="w-8 h-8 my-auto mx-1" src="${pageContext.request.contextPath}/assets/images/ri_admin-fill.svg" alt="Promotions">
            <p class="font-bold flex text-md h-6/12 my-auto">Statistiques</p>
        </a>

    </div>
    <div class="main w-9/12 h-full ">
        <jsp:include page="AdminDashboard.jsp"/>
    </div>
</section>

<jsp:include page="../components/foot.jsp" />
