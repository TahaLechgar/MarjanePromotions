<%--
  Created by IntelliJ IDEA.
  User: Youcode
  Date: 10/26/2022
  Time: 2:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>
<html>
<head>
    <title>Log in as an Admin</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/login.css">
    <script src="https://cdn.tailwindcss.com"></script>

</head>
<body>

    <div class="min-h-full flex justify-center login-wrapper">
        <div class="overlay"></div>
        <div class="flex flex-col justify-center bg-white z-10 py-12 px-4 h-fit my-auto border rounded-xl sm:px-6 lg:flex-none lg:px-20 xl:px-24">
            <div class="mx-auto w-full max-w-sm lg:w-96">
                <div>
                    <h2 class="mt-6 text-3xl font-extrabold text-gray-900">Log in as <%=request.getAttribute("userType")%></h2>
                </div>

                <div class="mt-8">
                    <div class="mt-6">
                        <form action="${pageContext.request.contextPath}/login/<%= request.getAttribute("userType") %>" method="POST" class="space-y-6">
                            <div>
                                <label for="email" class="block text-sm font-medium text-gray-700"> Email address </label>
                                <div class="mt-1">
                                    <input id="email" name="email" type="email" autocomplete="email" required class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                                </div>
                            </div>

                            <div class="space-y-1">
                                <label for="password" class="block text-sm font-medium text-gray-700"> Password </label>
                                <div class="mt-1">
                                    <input id="password" name="password" type="password" autocomplete="current-password" required class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                                </div>
                            </div>

                            <div class="flex items-center justify-between">
                                <div class="flex items-center">
                                    <input id="remember-me" name="remember-me" type="checkbox" class="h-4 w-4 text-indigo-600 focus:ring-indigo-500 border-gray-300 rounded">
                                    <label for="remember-me" class="ml-2 block text-sm text-gray-900"> Remember me </label>
                                </div>

                                <div class="text-sm">
                                    <a href="#" class="font-medium text-indigo-600 hover:text-indigo-500"> Forgot your password? </a>
                                </div>
                            </div>

                            <div>
                                <button type="submit" class="w-full flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">Sign in</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
