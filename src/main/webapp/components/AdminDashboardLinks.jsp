<%--
  Created by IntelliJ IDEA.
  User: Youcode
  Date: 11/9/2022
  Time: 2:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<a href="${pageContext.request.contextPath}/dashboard/admin/promotions" class="link w-10/12 h-16 flex justify-start align-center rounded-l-2xl pr-4 <c:if test="${dataType == 'promotions'}"><c:out value="lg:pr-8 bg-gray-100"/></c:if>">
    <img class="w-8 h-8 my-auto mx-1" src="${pageContext.request.contextPath}/assets/images/ri_admin-fill.svg" alt="Promotions">
    <p class="font-bold flex text-md h-6/12 my-auto">Promotions</p>
</a>
<a href="${pageContext.request.contextPath}/dashboard/admin/managers" class="link w-10/12 h-16 flex justify-start align-center rounded-l-2xl  pr-4 <c:if test="${dataType == 'departmentManagers'}"><c:out value="lg:pr-8 bg-gray-100"/></c:if>">
    <img class="w-8 h-8 my-auto mx-1" src="${pageContext.request.contextPath}/assets/images/ri_admin-fill.svg" alt="Promotions">
    <p class="font-bold flex text-md h-6/12 my-auto">Department Managers</p>
</a>
