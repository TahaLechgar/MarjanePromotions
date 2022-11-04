<%--
  Created by IntelliJ IDEA.
  User: Taha Lechgar
  Date: 11/4/2022
  Time: 10:22 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<div x-show="open" class="body__overlay"></div>

<nav class="navbar">
    <div class="navbar__container">
        <div class="navbar__logo">
            <img src="${pageContext.request.contextPath}/assets/images/logo_marjane.svg" alt="logo">
        </div>



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

    </div>
</nav>