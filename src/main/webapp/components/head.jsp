<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>

    <title>Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/<c:out value="${param.style}"/>.css">
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
    <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.3.5/dist/alpine.min.js" defer ></script>

</head>
<body x-data="{open: false, popupOpen: false, managerPopup: false, actionType: 'add-manager', managerEmail: ''}">