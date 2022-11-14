<%--
  Created by IntelliJ IDEA.
  User: Youcode
  Date: 10/27/2022
  Time: 2:37 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="container p-6 ">

<c:choose>
    <c:when test="${dataType == 'admins'}">
        <div class="flex max-h-6/12 flex-col w-11/12 my-10 mx-auto">

            <div class="my-4 flex flex-row justify-between">
                <h1 class="bold text-xl font-bold">Admins : </h1>
                <button @click="managerPopup = true; actionType = 'add-manager'; managerEmail = ''" class="flex flex-row items-center py-2 px-4 text-white rounded-md" style="background-color: #005EB1">
                    <img class="w-4 h-4 mr-2" src="${pageContext.request.contextPath}/assets/images/ant-design_plus-circle-outlined.svg" alt="">
                    Ajouter un Admin
                </button>
            </div>
            <div class="my-1 overflow-x-auto sm:-mx-6 lg:-mx-8">
                <div class="py-2 align-middle inline-block min-w-full sm:px-6 lg:px-8">
                    <div class="shadow overflow-hidden border-b border-gray-200 sm:rounded-lg">
                        <table class="min-w-full h-9/12  divide-y divide-gray-200">
                            <thead class="bg-gray-50">
                            <tr>

                                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Email</th>
                                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Center</th>
                                <th scope="col" class="relative px-6 py-3">
                                    <span class="sr-only">Edit</span>
                                </th>
                            </tr>
                            </thead>
                            <tbody class="bg-white divide-y divide-gray-200">

                            <c:forEach items="${admins}" var="admin" >
                                <tr>
                                    <td class="px-6 py-2 whitespace-nowrap">
                                        <div class="flex items-center">
                                            <div class="flex-shrink-0 h-10 w-10">
                                                <img class="h-10 w-10 rounded-full" src="https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60" alt="">
                                            </div>
                                            <div class="ml-4">
                                                <div class="text-sm text-gray-500"><c:out value="${admin.getEmail()}" /> </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="px-6 py-2 whitespace-nowrap text-sm text-gray-500"><c:out value="${admin.getCenter().getCity()}" /></td>
                                    <td class="px-6 py-2 whitespace-nowrap text-right text-sm font-medium">
                                        <a @click="managerPopup = true; actionType = 'edit-manager';managerId = '<c:out value="${admin.getId()}" />' ; managerEmail = '<c:out value="${admin.getEmail()}" />' " href="#" class="text-indigo-600 hover:text-indigo-900">Edit</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            <!-- More people... -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <c:if test="${totalOfPages > 1}">
                <nav aria-label="Page navigation">
                    <ul class="inline-flex">
                        <li><button class="h-10 px-5 text-indigo-600 transition-colors duration-150 bg-white rounded-l-lg focus:shadow-outline hover:bg-indigo-100">Prev</button></li>
                        <c:forEach var="i" begin="1" end="${totalOfPages}" step="1">
                            <li><a href="${pageContext.request.contextPath}/dashboard/director/admins/<c:out value="${i}" />" class="flex items-center h-10 px-5 align-middle <c:if test="${currentPage != i}"><c:out value="text-indigo-600" /> </c:if> transition-colors duration-150 bg-white focus:shadow-outline hover:bg-indigo-100 <c:if test="${currentPage == i}"><c:out value="text-white bg-blue-800 hover:bg-blue-800" /> </c:if>" ><c:out value="${ i }" /></a></li>
                        </c:forEach>
                        <li><button class="h-10 px-5 text-indigo-600 transition-colors duration-150 bg-white rounded-r-lg focus:shadow-outline hover:bg-indigo-100">Next</button></li>
                    </ul>
                </nav>
            </c:if>
        </div>

    </c:when>
    <c:otherwise>
        <div class="flex flex-col w-11/12 my-10 mx-auto">

            <h1 class="my-6 bold text-xl font-bold"> <c:out value="${dataType}" /> promotions : </h1>

            <div class="my-1 overflow-x-auto sm:-mx-6 lg:-mx-8">
                <div class="py-2 align-middle inline-block min-w-full sm:px-6 lg:px-8">
                    <div class="shadow overflow-hidden border-b border-gray-200 sm:rounded-lg">
                        <table class="min-w-full divide-y bg-gray-50 divide-gray-200">
                            <thead class="bg-gray-50">
                            <tr>
                                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Product</th>
                                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Date</th>
                                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Percentage</th>
                                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">status</th>

                            </tr>
                            </thead>
                            <tbody class="bg-white divide-y divide-gray-200">

                            <c:forEach items="${promotions}" var="promotion">

                                <tr>
                                    <td class="px-6 py-2 whitespace-nowrap">
                                        <div class="flex items-center">
                                            <div class="ml-4">
                                                <div class="text-sm font-medium text-gray-900"><c:out value="${promotion.getDepartment().getName()}" /> </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="px-6 py-2 whitespace-nowrap">
                                        <div class="text-sm text-gray-900">From : <c:out value="${ promotion.getStartDate()}" /> </div>
                                        <div class="text-sm text-gray-900">To : <c:out value="${promotion.getEndDate()}" /> </div>
                                    </td>
                                    <td class="px-6 py-2 whitespace-nowrap text-sm text-gray-500"><c:out value="${promotion.getPercentage()}" /> %</td>
                                    <td class="px-6 py-2 whitespace-nowrap">
                                        <span class="span-status px-2 inline-flex text-xs leading-5 font-semibold rounded-full text-white"><c:out value="${promotion.getStatus()}" /></span>
                                    </td>
                                </tr>
                            </c:forEach>
                            <!-- More people... -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <c:if test="${totalOfPages > 1}">
                <nav aria-label="Page navigation">
                    <ul class="inline-flex">
                        <li><button class="h-10 px-5 text-indigo-600 transition-colors duration-150 bg-white rounded-l-lg focus:shadow-outline hover:bg-indigo-100">Prev</button></li>
                        <c:forEach var="i" begin="1" end="${totalOfPages}" step="1">
                            <li><a href="${pageContext.request.contextPath}/dashboard/director/<c:out value="${dataType}" />/<c:out value="${i}" />" class="flex items-center h-10 px-5 align-middle <c:if test="${currentPage != i}"><c:out value="text-indigo-600" /> </c:if> transition-colors duration-150 bg-white focus:shadow-outline hover:bg-indigo-100 <c:if test="${currentPage == i}"><c:out value="text-white bg-blue-800 hover:bg-blue-800" /> </c:if>" ><c:out value="${ i }" /></a></li>
                        </c:forEach>
                        <li><button class="h-10 px-5 text-indigo-600 transition-colors duration-150 bg-white rounded-r-lg focus:shadow-outline hover:bg-indigo-100">Next</button></li>
                    </ul>
                </nav>
            </c:if>
        </div>
    </c:otherwise>
</c:choose>


</div>

<template x-if="refusePromo">
    <div class="popup-overlay absolute top-0 left-0 w-screen h-screen bg-gray-900  opacity-50"></div>
</template>
<template x-if="refusePromo">
    <jsp:include page="../components/modals/confirmRefusePromotion.jsp"/>
</template>


<script src="${pageContext.request.contextPath}/assets/js/statusColor.js"></script>



