<%@ page import="com.marjanepromotion.models.Admin" %>
<%@ page import="java.util.List" %>
<%@ page import="com.marjanepromotion.models.Promotion" %>
<%@ page import="com.marjanepromotion.dao.AdminDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: Youcode
  Date: 10/27/2022
  Time: 2:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    List<Admin> admins = (List<Admin>) request.getAttribute("admins");
    List<Promotion> acceptedPromotions = (List<Promotion>) request.getAttribute("acceptedPromotions");
    List<Promotion> notAcceptedPromotions = (List<Promotion>) request.getAttribute("notAcceptedPromotions");
    List<Promotion> pendingPromotions = (List<Promotion>) request.getAttribute("pendingPromotions");

    HashMap<String, List<Promotion>> allPromotions = new HashMap<>();
    allPromotions.put("Accepted promotions", acceptedPromotions);
    allPromotions.put("Refused promotions", notAcceptedPromotions);
    allPromotions.put("Pending promotions", pendingPromotions);

%>

<html>
<head>
    <title>Director dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>

</head>
<body>

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
                        <% for(Admin admin: admins){ %>
                        <tr>
                            <td class="px-6 py-4 whitespace-nowrap">
                                <div class="flex items-center">
                                    <div class="flex-shrink-0 h-10 w-10">
                                        <img class="h-10 w-10 rounded-full" src="https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60" alt="">
                                    </div>
                                    <div class="ml-4">
                                        <div class="text-sm text-gray-500"><%=admin.getEmail()%></div>
                                    </div>
                                </div>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"><%=admin.getCenter().getCity()%></td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"><%=admin.getCenter().getCity()%></td>
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
    <% for(Map.Entry<String, List<Promotion>> set: allPromotions.entrySet()){
        List<Promotion> promotions = set.getValue();
        String type = set.getKey();
    %>
    <div class="flex flex-col w-11/12 my-10 mx-auto">

        <h1 class="my-4 bold text-xl font-bold"><%= type %> </h1>

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
    <% } %>

</div>


</body>
</html>
