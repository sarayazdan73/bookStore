
<!DOCTYPE html>
<html lang="en">

<head>
    <title>home</title>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/bootstrap.min.css">
    <link rel="stylesheet" href="/home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="/jquery.min.js"></script>
    <script src="/bootstrap.min.js"></script>
</head>
<body dir=rtl id="tbody">
<nav class="menu2">
    <menu>
        <li><a href="http://localhost:8081/home">home</a></li>
        <li><a href="http://localhost:8081/data/library">library</a></li>
        <li><a href="http://localhost:8081/data/book">book</a></li>
        <sec:authorize access="hasRole('ADMIN')">
            <li><a href="http://localhost:8081/data/user">user</a></li>
        </sec:authorize>
        <li><a href="http://localhost:8081/logout">logout</a></li>
    </menu>
</nav>


</body>
</html>