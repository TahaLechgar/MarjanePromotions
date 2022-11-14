<%--
  Created by IntelliJ IDEA.
  User: Youcode
  Date: 11/13/2022
  Time: 3:24 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div @click.away="refusePromo = false; promotionId = ''" class="absolute left-1/4 top-0 left-0 h-6/12 top-1/4 w-6/12 mt-10 sm:mt-0">
    <div class=" mx-auto w-full flex justify-center">
        <div class="mt-5 w-full md:mt-0 md:col-span-2">
            <form action="${pageContext.request.contextPath}/dashboard/manager/not-accepted" method="post">
                <div class="shadow overflow-hidden sm:rounded-md">
                    <div class="px-4 py-5 bg-white sm:p-6">
                        <div class="grid grid-cols-6 gap-6">
                            <input type="hidden" name="refuse" :value="promotionId">

                            <div class="col-span-6 ">
                                <label for="about" class="block text-sm font-medium text-gray-700">Reason :</label>
                                <textarea placeholder="Describe why you want to decline this promotion" id="about" name="reason" rows="3" class="p-2 shadow-sm block w-full focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm border border-gray-300 rounded-md"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="px-4 py-3 bg-gray-50 text-right sm:px-6">
                        <button type="submit" class="inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">refuse</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>