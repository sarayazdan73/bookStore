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
        <li><a href="http://localhost:8081/logout">logout</a></li>
    </menu>
</nav>

<button class="btn" id="btn1" onclick="myFunction()" >show all books</button>

<table id="book" >
    <thead>
    <tr>
        <th>name</th>
        <th>price</th>
        <th>count</th>
        <th >image</th>
        <th >library</th>
        <th >name writer</th>
        <th><button id="myBtn" class="btn2">Add Book</button></th>
    </tr>
    </thead>
    <tbody>

    </tbody>
</table>

<div id="myModal" class="modal">

    <div class="modal-content">
        <span class="close">&times;</span>
        <form id="myform"   onsubmit="return myFunction1()">
            <label for="myname">Name</label><br>
            <input placeholder="name" id="myname" name="name" type="text" /><br>
            <input  id="myid" name="id" type="hidden" />
            <label for="myprice">Price</label><br>
            <input placeholder="price" id="myprice" name="price" type="number" /><br>
            <label for="mycount">Count</label><br>
            <input placeholder="count" id="mycount" name="count" type="number"><br>
            <label for="myimg">Image</label><br>
            <input placeholder="image" id="myimg" name="imageStorage" type="file" /><br>
            <label for="myimg">Writer</label><br>
            <input placeholder="name Writer" id="mynameWtr" name="nameWriter" type="text" /><br>
            <label for="mySelect">Choose Library</label><br>
            ​  <select name="library" id="mySelect"></select><br>
            <input placeholder="name" id="mysubmit" name="Submit" type="submit"  value="Insert" />
        </form>
    </div>

</div>

<script>

    var tablebook = document.getElementById("book").getElementsByTagName("tbody")[0];
    var libraries=${libraries}
    var modal = document.getElementById("myModal");
        function myFunction() {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    var response = xhttp.response;
                    var books = JSON.parse(response);
                    console.log("sara",books)
                    tablebook.innerHTML = "";
                    var i;
                    for (i = 0; i < books.length; i++) {
                        let id=books[i].id;
                        let name = books[i].name;
                        let price = books[i].price;
                        let count = books[i].count;
                        let image = books[i].imageStorage.id;
                        let nameWriter = books[i].nameWriter;
                        let library=books[i].library.name;
                        var newRow = tablebook.insertRow();
                        let a=i;
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
                        var inputElement = document.createElement('input');
                        inputElement.type = "button"
                        inputElement.value="Edit"
                        inputElement.id="btnEdit"
                        inputElement.setAttribute("class", "btn1");
                        inputElement.className="btn1"

                        inputElement.addEventListener('click', function(){
                            myFunction2(id,name,price,count,image,nameWriter,library);
                        });
                        var inputElement2 = document.createElement('input');
                        inputElement2.type = "button"
                        inputElement2.className="btn1"
                        inputElement2.value="Delete"
                        inputElement2.addEventListener('click', function(){
                            myFunction3(id,a);
                        });
                        newCell.appendChild(inputElement);
                        newCell.appendChild(inputElement2);
                    }

                }
            };
            xhttp.open("GET", "/book/books", true);
            xhttp.send();

        }
    console.log("libraries",libraries);
    var i;
    for (i = 0; i < libraries.length; i++) {
        var x = document.getElementById("mySelect");
        var option = document.createElement("option");
        var name = libraries[i].name;
        option.text = name;
        x.add(option, x[i]);
    }
    function myFunction1() {
        modal.style.display = "none";
        alert("added")
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "http://localhost:8081/book/addbookimage",true);
        xhr.onload = function () {
            console.log(this.responseText);
        };

        var formData = new FormData(document.getElementById("myform"));
        xhr.send(formData);
        return false;
    }
    function myFunction2(id,name,price,count,image,nameWriter,library) {
        modal.style.display = "block";
        document.getElementById("myname").value = name;
        document.getElementById("myprice").value = price;
        document.getElementById("mycount").value = count;
        document.getElementById("myimg").value = image;
        document.getElementById("mynameWtr").value = nameWriter;
        document.getElementById("mylibnum").value = library;
        document.getElementById("mysubmit").value = Edit;
        document.getElementById("myid").value = id;
    }
    function myFunction3(id,a) {
        var xhr = new XMLHttpRequest();
        xhr.open("DELETE", "http://localhost:8081/book/books/"+id,true);
        xhr.send();
        tablebook.deleteRow(a);
    }
    var btn = document.getElementById("myBtn");
    var span = document.getElementsByClassName("close")[0];
    btn.onclick = function() {
        modal.style.display = "block";
    }
    span.onclick = function() {
        modal.style.display = "none";
    }
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }


</script>
</body>
</html>


