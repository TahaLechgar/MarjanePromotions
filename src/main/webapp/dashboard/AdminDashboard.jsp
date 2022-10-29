<%@ page import="com.marjanepromotion.models.DepartmentManager" %>
<%@ page import="java.util.List" %>
<%@ page import="com.marjanepromotion.models.Promotion" %>
<%@ page import="com.marjanepromotion.models.Center" %>
<%@ page import="com.marjanepromotion.models.Department" %><%--
  Created by IntelliJ IDEA.
  User: Youcode
  Date: 10/27/2022
  Time: 9:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%
    List<DepartmentManager> departmentManagers = (List<DepartmentManager>) request.getAttribute("departmentManagers");
    List<Promotion> promotions = (List<Promotion>) request.getAttribute("promotions");

%>

<html>
<head>
    <title>Admin dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>

</head>
<body>
<!-- This example requires Tailwind CSS v2.0+ -->

<div class="container p-6 ">
    <div class="flex flex-col w-11/12 my-10 mx-auto">




        <h1 class="my-4 bold text-xl font-bold">Department Managers : </h1>

        <div class="-my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
            <div class="py-2 align-middle inline-block min-w-full sm:px-6 lg:px-8">
                <div class="shadow overflow-hidden border-b border-gray-200 sm:rounded-lg">
                    <table class="min-w-full divide-y divide-gray-200">
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
                        <% for(DepartmentManager departmentManager: departmentManagers){ %>
                        <tr>
                            <td class="px-6 py-4 whitespace-nowrap">
                                <div class="flex items-center">
                                    <div class="flex-shrink-0 h-10 w-10">
                                        <img class="h-10 w-10 rounded-full" src="https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60" alt="">
                                    </div>
                                    <div class="ml-4">
                                        <div class="text-sm text-gray-500"><%=departmentManager.getEmail()%></div>
                                    </div>
                                </div>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"><%=departmentManager.getCenter().getCity()%></td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"><%=departmentManager.getDepartment().getName()%></td>
                            <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                                <a href="#" class="text-indigo-600 hover:text-indigo-900">Edit</a>
                            </td>
                        </tr>
                        <%}%>

                        <!-- More people... -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="flex flex-col w-11/12 my-10 mx-auto">

        <h1 class="my-4 bold text-xl font-bold">Promotions </h1>

        <div class="-my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
            <div class="py-2 align-middle inline-block min-w-full sm:px-6 lg:px-8">
                <div class="shadow overflow-hidden border-b border-gray-200 sm:rounded-lg">
                    <table class="min-w-full divide-y divide-gray-200">
                        <thead class="bg-gray-50">
                        <tr>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Product</th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Date</th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Percentage</th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">status</th>
                            <th scope="col" class="relative px-6 py-3">
                                <span class="sr-only">Edit</span>
                            </th>
                        </tr>
                        </thead>
                        <tbody class="bg-white divide-y divide-gray-200">
                        <% for(Promotion promotion: promotions) { %>
                        <tr>
                            <td class="px-6 py-4 whitespace-nowrap">
                                <div class="flex items-center">
                                    <div class="ml-4">
                                        <div class="text-sm font-medium text-gray-900"><%= promotion.getDepartment().getName() %></div>
                                    </div>
                                </div>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap">
                                <div class="text-sm text-gray-900">From : <%= promotion.getStartDate() %></div>
                                <div class="text-sm text-gray-900">To : <%= promotion.getEndDate() %></div>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"><%= promotion.getPercentage() %>%</td>
                            <td class="px-6 py-4 whitespace-nowrap">
                                <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800"> <%= promotion.getStatus() %> </span>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                                <a href="#" class="text-indigo-600 hover:text-indigo-900">Edit</a>
                            </td>
                        </tr>
                        <% } %>

                        <!-- More people... -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

</div>

<c:if test="${error != null}">
    <h4 class="text-red-500 font-bold w-full text-center">
        <c:out value="${error}"/>
    </h4>
</c:if>


<div class=" w-full mt-10 sm:mt-0">
    <div class=" mx-auto w-6/12 flex justify-center">
        <div class="mt-5 w-full md:mt-0 md:col-span-2">
            <form action="${pageContext.request.contextPath}/AdminDashboard" method="POST">
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
                                <textarea placeholder="describe your promotion" id="about" name="description" rows="3" class="p-2 shadow-sm block w-full focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm border border-gray-300 rounded-md"></textarea>
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

<script>
    let endDate = document.querySelector("#end-date");
    let startDate = document.querySelector("#start-date");
    endDate.min = new Date().toISOString().split("T")[0];
    startDate.min = new Date().toISOString().split("T")[0];


</script>

</body>
</html>
