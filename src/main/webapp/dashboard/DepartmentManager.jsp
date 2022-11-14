<%@ page import="com.marjanepromotion.models.Promotion" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: Youcode
  Date: 10/27/2022
  Time: 4:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    <div class="container p-6 ">

        <div class="flex flex-col w-11/12 my-10 mx-auto">

            <h1 class="my-6 bold text-xl font-bold"> <c:out value="${dataType}" /> promotions : </h1>

            <div class="-my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
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
                                <c:if test="${promotion.getStatus() == 'pending'}">
                                <td class="px-6 py-2 whitespace-nowrap text-right text-sm font-medium">
                                    <form action="${pageContext.request.contextPath}/dashboard/manager/accepted" method="post">
                                        <input type="hidden" name="accept" value="<c:out value="${promotion.getId()}" />">
                                        <button style="outline: none;" class="inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-green-600 hover:bg-green-700 outline-none">accept</button>
                                    </form>
                                </td>
                                <td class="px-6 py-2 whitespace-nowrap text-right text-sm font-medium">
                                    <a @click="refusePromo = true;promotionId = '<c:out value="${promotion.getId()}" />'" href="#" class="inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-red-600 hover:bg-red-700 focus:outline-none ">refuse</a>
                                </td>
                                </c:if>
                            </tr>
                            </c:forEach>
                            <!-- More people... -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

<template x-if="refusePromo">
    <div class="popup-overlay absolute top-0 left-0 w-screen h-screen bg-gray-900  opacity-50"></div>
</template>
<template x-if="refusePromo">
    <jsp:include page="../components/modals/confirmRefusePromotion.jsp"/>
</template>


<script src="${pageContext.request.contextPath}/assets/js/statusColor.js"></script>
