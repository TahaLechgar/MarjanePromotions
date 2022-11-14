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
    <jsp:param name="style" value="login"/>
</jsp:include>




<jsp:include page="../components/navbar.jsp" />

<section class="main">
    <div class="main__overlay"></div>
    <div class="main__overlay main__overlay--black"></div>

    <div class="main__login">
        <form action="${pageContext.request.contextPath}/login/<%= request.getAttribute("userType") %>" method="post" class="main__form">
            <legend class="uppercase"><%=request.getAttribute("userType")%> login</legend>
            <p class="description">Hey, Enter your details to get sign in to your account</p>
            <div class="main__inputs">
                <input type="email" name="email" placeholder="Enter Email">
                <input type="password" name="password" placeholder="password">
            </div>


            <button type="submit"> Sign in</button>

            <p class="signin">Or Sing in with</p>
            <div class="main__otherLogin">
                <a href="${pageContext.request.contextPath}/login/<c:out value="${otherType1}"/>"> <img src="${pageContext.request.contextPath}/assets/images/dashicons_admin-users.svg" alt=""> <c:out value="${otherType1}"/></a>
                <a href="${pageContext.request.contextPath}/login/<c:out value="${otherType2}"/>"> <img src="${pageContext.request.contextPath}/assets/images/ri_admin-fill.svg" alt=""> <c:out value="${otherType2}"/></a>
            </div>
        </form>
    </div>

</section>

<jsp:include page="../components/foot.jsp" />

