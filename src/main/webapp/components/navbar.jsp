<%--
  Created by IntelliJ IDEA.
  User: Taha Lechgar
  Date: 11/4/2022
  Time: 10:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<div x-show="open" class="body__overlay"></div>

<nav class="navbar shadow">
    <div class="navbar__container">
        <div class="navbar__logo">
            <img src="${pageContext.request.contextPath}/assets/images/logo_marjane.svg" alt="logo">
        </div>

        <c:choose>
            <c:when test="${sessionScope.user == null}">
                <div @click.away="open=false" class="navbar__menu" x-show="open">
                    <div class="navbar__links">
                        <ul>
                            <li class="link"><a href="">HOME</a></li>
                            <li class="link"><a href="">SHOP</a></li>
                            <li class="link"><a href="">ABOUT</a></li>
                        </ul>
                    </div>

                    <a  class="navbar__login" href="${pageContext.request.contextPath}/login/admin">
                        SE CONNECTER
                    </a>
                </div>


                <button class="sm:hidden menu-toggler" @click="open = !open">
                    <img src="${pageContext.request.contextPath}/assets/images/menu.svg" alt="menu">
                </button>
            </c:when>
            <c:when test="${sessionScope.user != null}">
                <div class="cursor-pointer left-menu w-full h-12 flex justify-center items-center">
                    <div class="container w-fit 2xl:min-w-2/12 lg:min-w-4/12 h-9/12  bg-gray-200 ml-auto flex flex-row justify-end items-center py-1 rounded-md px-4">
                        <div class="flex flex-col text-sm justify-end items-start">
                            <p class="text-black  font-bold">Taha Lechgar</p>
                            <p>
                                <c:choose>
                                    <c:when test="${sessionScope.userType == 'manager'}">
                                        Department Manager
                                    </c:when>
                                    <c:when test="${sessionScope.userType == 'admin'}">
                                        Center Admin
                                    </c:when>
                                    <c:when test="${sessionScope.userType == 'director'}">
                                        General Admin
                                    </c:when>
                                </c:choose>
                            </p>
                        </div>
                        <div class="w-10 h-10 overflow-hidden rounded-full flex justify-center items-center border border-4 border-gray-500">
                            <img  class="object-fill w-11/12 h-11/12 " src="${pageContext.request.contextPath}/assets/images/profile-image.png" alt="profile-picture">
                        </div>
                    </div>
                </div>
            </c:when>
        </c:choose>

    </div>
</nav>
