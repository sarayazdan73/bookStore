
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Users</title>
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

<table  id="user" >
    <thead>
    <tr>
        <th>name</th>
        <th >role</th>
        <th><button class="btn" id="btn1" onclick="myFunction()" >show all user</button></th>
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
            <label for="mySelect">Role</label><br>
            ​  <select name="role" id="mySelect"></select><br>
            <input placeholder="name" id="mysubmit" name="Submit" type="submit"  value="Edit" />
        </form>
    </div>
</div>
<script>
    var tableuser = document.getElementById("user").getElementsByTagName("tbody")[0];
    var roles=${roles}
    var modal = document.getElementById("myModal");
    function myFunction() {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                var response = xhttp.response;
                var users = JSON.parse(response);

                tableuser.innerHTML = "";
                var i;
                for (i = 0; i < users.length; i++) {
                    let id=users[i].id;
                    let name = users[i].name;
                    let role = users[i].role.name;
                    var newRow = tableuser.insertRow();
                    var newCell = newRow.insertCell(0);
                    let a=i;
                    var newText = document.createTextNode(name);
                    newCell.appendChild(newText);
                    var newCell = newRow.insertCell(1);
                    var newText = document.createTextNode(role);
                    newCell.appendChild(newText);
                    var newCell = newRow.insertCell(2);
                    var inputElement = document.createElement('input');
                    inputElement.type = "button"
                    inputElement.value="Edit"
                    inputElement.id="btnEdit"
                    inputElement.setAttribute("class", "btn1");
                    inputElement.className="btn1"
                    inputElement.addEventListener('click', function(){
                        myFunction2(id,name,role);
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
        xhttp.open("GET", "/user/users", true);
        xhttp.send();
    }
    function myFunction1() {
        modal.style.display = "none";
        alert("added")
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "http://localhost:8081/user/addusers",true);
        xhr.onload = function () {
            console.log(this.responseText);
        };
        var formData = new FormData(document.getElementById("myform"));
        xhr.send(formData);
        return false;
    }
    function myFunction2(id,name,role) {
        modal.style.display = "block";
        document.getElementById("myname").value = name;
        document.getElementById("mylibnum").value = role;
        document.getElementById("myid").value = id;
    }
    function myFunction3(id,a) {
        var xhr = new XMLHttpRequest();
        xhr.open("DELETE", "http://localhost:8081/user/users/"+id,true);
        xhr.send();
        tableuser.deleteRow(a);
    }
    console.log("roles",roles);
    var i;
    for (i = 0; i < roles.length; i++) {
        var x = document.getElementById("mySelect");
        var option = document.createElement("option");
        var name = roles[i].name;
        option.text = name;
        x.add(option, x[i]);
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