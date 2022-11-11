<%@ page import="com.marjanepromotion.models.DepartmentManager" %>
<%@ page import="java.util.List" %>
<%@ page import="com.marjanepromotion.models.Promotion" %>
<%--
  Created by IntelliJ IDEA.
  User: Youcode
  Date: 10/27/2022
  Time: 9:36 AM
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="container p-6 h-full overflow-hidden">


    <c:choose>
        <c:when test="${dataType == 'promotions'}">
            <div class="flex flex-col max-h-6/12 w-11/12 my-10 mx-auto">

                <div class="my-4 flex flex-row justify-between">
                    <h1 class="bold text-xl font-bold">Promotions</h1>
                    <button @click="popupOpen = true" class="flex flex-row items-center py-2 px-4 text-white rounded-md" style="background-color: #005EB1">
                        <img class="w-4 h-4 mr-2" src="${pageContext.request.contextPath}/assets/images/ant-design_plus-circle-outlined.svg" alt="">
                        Ajouter Promotion
                    </button>
                </div>

                <div class="my-1 overflow-x-auto sm:-mx-6 lg:-mx-8">
                    <div class="py-2 align-middle inline-block min-w-full sm:px-6 lg:px-8">
                        <div class="shadow h-full border-b border-gray-200 sm:rounded-lg">
                            <table class="min-w-full  divide-y divide-gray-200">
                                <thead class="w-full mb-8 bg-gray-50 ">
                                <tr>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Product</th>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Date</th>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Percentage</th>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">status</th>
                                </tr>
                                </thead>
                                <tbody class="bg-white divide-y divide-gray-200">

                                <c:forEach items="${promotions}" var="promotion" >
                                    <tr>
                                        <td class="px-6 py-2 whitespace-nowrap">
                                            <div class="flex items-center">
                                                <div class="ml-4">
                                                    <div class="text-sm font-medium text-gray-900"> <c:out value="${promotion.getDepartment().getName()}" /> </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="px-6 py-2 whitespace-nowrap">
                                            <div class="text-sm text-gray-900">From : <c:out value="${promotion.getStartDate()}" /></div>
                                            <div class="text-sm text-gray-900">To : <c:out value="${promotion.getEndDate()}" /></div>
                                        </td>
                                        <td class="px-6 py-2 whitespace-nowrap text-sm text-gray-500"><c:out value="${promotion.getPercentage()}" />%</td>
                                        <td class="px-6 py-2 whitespace-nowrap">
                                            <span class="span-status px-2 inline-flex text-xs leading-5 font-semibold rounded-full text-white "><c:out value="${promotion.getStatus()}" /></span>
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
                                <li><a href="${pageContext.request.contextPath}/dashboard/admin/promotions/<c:out value="${i}" />" class="flex items-center h-10 px-5 align-middle <c:if test="${currentPage != i}"><c:out value="text-indigo-600" /> </c:if> transition-colors duration-150 bg-white focus:shadow-outline hover:bg-indigo-100 <c:if test="${currentPage == i}"><c:out value="text-white bg-blue-800 hover:bg-blue-800" /> </c:if>" ><c:out value="${ i }" /></a></li>
                            </c:forEach>
                            <li><button class="h-10 px-5 text-indigo-600 transition-colors duration-150 bg-white rounded-r-lg focus:shadow-outline hover:bg-indigo-100">Next</button></li>
                        </ul>
                    </nav>
                </c:if>
            </div>

            </div>
        </c:when>

        <c:when test="${dataType == 'departmentManagers'}">
            <div class="flex max-h-6/12 flex-col w-11/12 my-10 mx-auto">

                <div class="my-4 flex flex-row justify-between">
                    <h1 class="bold text-xl font-bold">Department managers</h1>
                    <button @click="popupOpen = true" class="flex flex-row items-center py-2 px-4 text-white rounded-md" style="background-color: #005EB1">
                        <img class="w-4 h-4 mr-2" src="${pageContext.request.contextPath}/assets/images/ant-design_plus-circle-outlined.svg" alt="">
                        Ajouter Manager
                    </button>
                </div>
                <div class="-my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
                    <div class="py-2 align-middle inline-block min-w-full sm:px-6 lg:px-8">
                        <div class="shadow overflow-hidden border-b border-gray-200 sm:rounded-lg">
                            <table class="min-w-full h-9/12  divide-y divide-gray-200">
                                <thead class="bg-gray-50">
                                <tr>

                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Email</th>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Center</th>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Department</th>
                                    <th scope="col" class="relative px-6 py-3">
                                        <span class="sr-only">Edit</span>
                                    </th>
                                </tr>
                                </thead>
                                <tbody class="bg-white divide-y divide-gray-200">

                                <c:forEach items="${departmentManagers}" var="departmentManager" >
                                    <tr>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <div class="flex items-center">
                                                <div class="flex-shrink-0 h-10 w-10">
                                                    <img class="h-10 w-10 rounded-full" src="https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60" alt="">
                                                </div>
                                                <div class="ml-4">
                                                    <div class="text-sm text-gray-500"><c:out value="${departmentManager.getEmail()}" /> </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"><c:out value="${departmentManager.getEmail()}" /></td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"><c:out value="${departmentManager.getEmail()}" /></td>
                                        <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                                            <a href="#" class="text-indigo-600 hover:text-indigo-900">Edit</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <!-- More people... -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

        </c:when>

    </c:choose>


<%--<c:if test="${error != null}">--%>
<%--    <h4 class="text-red-500 font-bold w-full text-center">--%>
<%--        <c:out value="${error}"/>--%>
<%--    </h4>--%>
<%--</c:if>--%>

<template x-if="popupOpen">
    <div class="popup-overlay absolute top-0 left-0 w-screen h-screen bg-gray-900  opacity-50"></div>
</template>
<template x-if="popupOpen">
    <div @click.away="popupOpen = false" class="absolute left-1/4 top-0 left-0 h-6/12 top-1/4 w-6/12 mt-10 sm:mt-0">
        <div class=" mx-auto w-full flex justify-center">
            <div class="mt-5 w-full md:mt-0 md:col-span-2">
                <form action="${pageContext.request.contextPath}/dashboard/admin" method="POST">
                    <div class="shadow overflow-hidden sm:rounded-md">
                        <div class="px-4 py-5 bg-white sm:p-6">
                            <div class="grid grid-cols-6 gap-6">
                                <input type="hidden" name="add-promotion">
                                <div class="col-span-6 sm:col-span-3">
                                    <label for="start-date" class="block text-sm font-medium text-gray-700">Start :</label>
                                    <input type="date" name="start-date" id="start-date" class="mt-1 p-2 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
                                </div>

                                <div class="col-span-6 sm:col-span-3">
                                    <label for="end-date" class="block text-sm font-medium text-gray-700">End :</label>
                                    <input type="date" name="end-date" id="end-date" class="mt-1 p-2 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
                                </div>

                                <div class="col-span-6 ">
                                    <label for="about" class="block text-sm font-medium text-gray-700">Description :</label>
                                    <textarea placeholder="Describe your promotion" id="about" name="description" rows="3" class="p-2 shadow-sm block w-full focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm border border-gray-300 rounded-md"></textarea>
                                </div>

                                <div class="col-span-6 sm:col-span-3">
                                    <label for="center" class="block text-sm font-medium text-gray-700">Center</label>
                                    <select id="center" name="center"  class="mt-1 p-2 block w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                                        <c:forEach items="${centers}" var="center">
                                            <option value="${center.getId()}">${center.getCity()}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-span-6 sm:col-span-3">
                                    <label for="Department" class="block text-sm font-medium text-gray-700">Department</label>
                                    <select id="Department" name="department"  class="mt-1 p-2 block w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                                        <c:forEach items="${departments}" var="department">
                                            <option value="${department.getId()}">${department.getName()}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="col-span-6 sm:col-span-3">
                                    <label for="street-address" class="block text-sm font-medium text-gray-700">Percentage : </label>
                                    <input type="number" min="1" max="50" name="percentage" id="street-address" autocomplete="street-address" class="mt-1 p-2 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
                                </div>

                            </div>
                        </div>
                        <div class="px-4 py-3 bg-gray-50 text-right sm:px-6">
                            <button type="submit" class="inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">Save</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</template>


<script>
    // let endDate = document.querySelector("#end-date");
    // let startDate = document.querySelector("#start-date");
    // endDate.min = new Date().toISOString().split("T")[0];
    // startDate.min = new Date().toISOString().split("T")[0];


    let  status = document.querySelectorAll('.span-status')

    status.forEach(status => {
        switch(status.textContent){
            case 'refused':
                status.classList.add('bg-red-600')
                break;
            case 'accepted':
                status.classList.add('bg-green-600')
                break;
            case 'pending':
                status.classList.add('bg-yellow-400')
                break;
            case 'not-checked':
                status.classList.add('bg-orange-600')
                break;
        }
    })

</script>

