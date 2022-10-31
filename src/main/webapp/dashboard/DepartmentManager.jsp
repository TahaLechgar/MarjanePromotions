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

<%
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
    <title>Department manager dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>

</head>
<body>

<div class="container p-6 ">
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
                            <% if(promotion.getStatus().equals("pending")){%>
                            <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                                <form action="${pageContext.request.contextPath}/dashboard/department-manager" method="post">
                                    <input type="hidden" name="accept" value="<%=promotion.getId()%>">
                                    <button style="outline: none;" class="inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-green-600 hover:bg-green-700 outline-none">accept</button>
                                </form>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                                <form action="${pageContext.request.contextPath}/dashboard/department-manager" method="post">
                                    <input type="hidden" name="refuse" value="<%=promotion.getId()%>">
                                    <button class="inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-red-600 hover:bg-red-700 focus:outline-none ">refuse</button>
                                </form>
                            </td>
                            <%} %>
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
