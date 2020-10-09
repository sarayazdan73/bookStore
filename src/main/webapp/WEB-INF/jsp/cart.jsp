<!DOCTYPE html>
<html lang="en">

<head>
    <title>Books</title>
    <meta charset="utf-8">
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/bootstrap.min.css">
    <link rel="stylesheet" href="/sara.css">
    <link rel="stylesheet" href="/home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="/jquery.min.js"></script>
    <script src="/bootstrap.min.js"></script>

</head>
<body  id="tbody">

<nav class="menu2">
    <menu>
        <li><a href="http://localhost:8081/home">home</a></li>
        <li><a href="http://localhost:8081/data/library">library</a></li>
        <li><a href="http://localhost:8081/data/book">book</a></li>
        <sec:authorize access="hasRole('ADMIN')">
            <li><a href="http://localhost:8081/data/user">user</a></li>
        </sec:authorize>
        <li><a href="http://localhost:8081/data/cart">cart</a></li>
        <li><a href="http://localhost:8081/logout">logout</a></li>
    </menu>
</nav>



<table id="book" >
    <thead>
    <tr>
        <th>name</th>
        <th>price</th>
        <th>count</th>
        <th >image</th>
        <th >library</th>
        <th >name writer</th>

        <th>number</th>

    </tr>
    </thead>
    <tbody>

    </tbody>
</table>

<script>

    var tablebook = document.getElementById("book").getElementsByTagName("tbody")[0];
    var id=${list}
    console.log("id",id)

        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                var response = xhttp.response;
                var books = JSON.parse(response);
                console.log("sara",books)
                tablebook.innerHTML = "";
                  var i;
                for (i = 0; i <books.length ; i++) {
                    let name = books[i].name;
                    let price = books[i].price;
                    let count = books[i].count;
                    let image = books[i].imageStorage.id;
                    let nameWriter = books[i].nameWriter;
                    let library=books[i].library.name;
                    var newRow = tablebook.insertRow();
                    var newCell = newRow.insertCell(0);
                    var newText = document.createTextNode(name);
                    newCell.appendChild(newText);
                    var newCell = newRow.insertCell(1);
                    var newText = document.createTextNode(price);
                    newCell.appendChild(newText);
                    var newCell = newRow.insertCell(2);
                    var newText = document.createTextNode(count);
                    newCell.appendChild(newText);
                    var newCell = newRow.insertCell(3);
                    var newText = document.createElement("IMG");
                    newText.setAttribute("src", "http://localhost:8081/book/img/"+image);
                    newText.setAttribute("width", "80");
                    newText.setAttribute("height","80");
                    newCell.appendChild(newText);
                    var newCell = newRow.insertCell(4);
                    var newText = document.createTextNode(library);
                    newCell.appendChild(newText);
                    var newCell = newRow.insertCell(5);
                    var newText = document.createTextNode(nameWriter);
                    newCell.appendChild(newText);
                    var newCell = newRow.insertCell(6);
                    var inputElement3 = document.createElement('input');
                    inputElement3.type = "number"
                    newCell.appendChild(inputElement3);

                }

            }
        };
        xhttp.open("GET", "http://localhost:8081/book/bookid/"+id, true);
        xhttp.send();
    console.log("http://localhost:8081/book/bookid/"+id)

</script>
</body>
</html>


