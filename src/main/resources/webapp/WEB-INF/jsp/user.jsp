
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Users</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/static/bootstrap.min.css">
    <link rel="stylesheet" href="/static/sara.css">
    <script src="/static/jquery.min.js"></script>
    <script src="/static/bootstrap.min.js"></script>
</head>
<body dir=rtl id="tbody">
<button class="btn" id="btn1" onclick="myFunction()" >show all user</button>
<table dir="ltr" id="user" >
    <thead>
    <tr>
        <th>name</th>
        <th >role</th>
        <th >role</th>
    </tr>
    </thead>
    <tbody>

    </tbody>
</table>
<script>
    var tableuser = document.getElementById("user").getElementsByTagName("tbody")[0];

    function myFunction() {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                var response = xhttp.response;
                var users = JSON.parse(response);

                tableuser.innerHTML = "";
                var i;
                for (i = 0; i < users.length; i++) {
                    var name = users[i].name;
                    var role = users[i].role.name;
                    var pass = users[i].password;
                    var newRow = tableuser.insertRow();
                    var newCell = newRow.insertCell(0);
                    var newText = document.createTextNode(name);
                    newCell.appendChild(newText);
                    var newCell = newRow.insertCell(1);
                    var newText = document.createTextNode(role);
                    newCell.appendChild(newText);
                    var newCell = newRow.insertCell(2);
                    var newText = document.createTextNode(pass);
                    newCell.appendChild(newText);
                }
            }
        };
        xhttp.open("GET", "/user/users", true);
        xhttp.send();

    }
</script>
</body>
</html>