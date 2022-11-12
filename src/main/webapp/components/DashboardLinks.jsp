<%--
  Created by IntelliJ IDEA.
  User: Youcode
  Date: 11/9/2022
  Time: 2:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:forEach items="${links}" var="link">
    <a href="${pageContext.request.contextPath}/dashboard/admin/<c:out value="${link}" />" class="link w-11/12 h-12 flex justify-start align-center rounded-l-2xl pr-4 <c:if test="${dataType == link}"><c:out value="lg:pr-8 bg-blue-50"/></c:if>">
        <img class="w-4 h-4 my-auto mx-1" src="${pageContext.request.contextPath}/assets/images/ri_admin-fill.svg" alt="Promotions">
        <p class="font-bold flex text-sm h-6/12 my-auto"><c:out value="${link}" /> </p>
    </a>
</c:forEach>



