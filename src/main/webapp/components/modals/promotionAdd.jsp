<%--
  Created by IntelliJ IDEA.
  User: Youcode
  Date: 11/11/2022
  Time: 3:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                        <button type="submit" class="inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">Ajouter</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>