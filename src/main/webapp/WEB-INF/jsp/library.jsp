
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Libraries</title>
    <meta charset="utf-8">
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/bootstrap.min.css">
    <link rel="stylesheet" href="/sara.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="/jquery.min.js"></script>
    <script src="/bootstrap.min.js"></script>
</head>
<body dir=rtl id="tbody">
<%--<sec:authorize access="hasRole('USER')">--%>
<button class="btn" id="btn1" onclick="myFunction()" >show all library</button>
<%--</sec:authorize>--%>
<table dir="ltr" id="library" >
    <thead>
    <tr>
        <th >id</th>
        <th>Name</th>
        <th><button id="myBtn" class="btn2">Add Library</button></th>
    </tr>
    </thead>
    <tbody>

    </tbody>
</table>
<div id="myModal" class="modal">

    <div class="modal-content">
        <span class="close">&times;</span>
        <form id="myform"   onsubmit="return myFunction1()">
            <input id="myname"  name="name" type="text" />
            <input id="myid" name="id" type="hidden" />
            <input id="mysubmit" name="Submit" type="submit"  value="Insert" />
        </form>
    </div>

</div>
<script>
    var tablelibrary = document.getElementById("library").getElementsByTagName("tbody")[0];
    var modal = document.getElementById("myModal");
    function myFunction2(id,name) {
        modal.style.display = "block";
        document.getElementById("myname").value = name;
        document.getElementById("myid").value = id;
        document.getElementById("mysubmit").value = Edit;
        }

    function myFunction1() {
        modal.style.display = "none";
        alert("added")
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "http://localhost:8081/library/addlibrary", true);
        xhr.onload = function () {
            var response = xhr.response;
            var libraries = JSON.parse(response);
            let id = libraries.id;
            var newRow = tablelibrary.insertRow();
            var newCell = newRow.insertCell(0);
            var newTextid = document.createTextNode(id);
            newCell.appendChild(newTextid);
            let name = libraries.name;
            var newCell = newRow.insertCell(1);
            var newText = document.createTextNode(name);
            newCell.appendChild(newText);
            var newCell = newRow.insertCell(2);
            var inputElement = document.createElement('input');
            inputElement.type = "button"
            inputElement.value = "Edit"
            inputElement.id = "btnEdit"
            inputElement.setAttribute("class", "btn1");
            inputElement.className = "btn1"
            inputElement.addEventListener('click', function () {
                myFunction2(id, name);
            });
            var inputElement2 = document.createElement('input');
            inputElement2.type = "button"
            inputElement2.className = "btn1"
            inputElement2.value = "Delete"
            var icon = document.createElement('i');
            // icon.innerHTML="<i class='fa fa-remove'></i>";
            inputElement2.appendChild(icon)
            inputElement2.addEventListener('click', function () {
                myFunction3(id, tablelibrary.rows.length - 1);
            });
            newCell.appendChild(inputElement);
            newCell.appendChild(inputElement2);
            // newCell.innerHTML="<button onclick='myFunction2(\\"" + result.name + "\\")' class='btn1' ><i class='fa fa-edit'></i></button>" +
            //     "<button id='btnDelete' onclick='myFunction3()' class='btn1' ><i class='fa fa-remove'></i></button>" ;

        }



        var formData = new FormData(document.getElementById("myform"));
        xhr.send(formData);
        return false;
    }
    function myFunction3(id,a) {
        var xhr = new XMLHttpRequest();
        xhr.open("DELETE", "http://localhost:8081/library/libraries/"+id,true);
        xhr.send();
        tablelibrary.deleteRow(a);
      }
    function myFunction() {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                var response = xhttp.response;
                var libraries = JSON.parse(response);
                tablelibrary.innerHTML = "";
                var i;

                for (i = 0; i < libraries.length; i++) {
                    let id = libraries[i].id;
                    var newRow = tablelibrary.insertRow();
                    let a=i;
                    var newCell = newRow.insertCell(0);

                    var newTextid = document.createTextNode(id);
                    newCell.appendChild(newTextid);

                    let name = libraries[i].name;
                    var newCell = newRow.insertCell(1);
                    var newText = document.createTextNode(name);
                    newCell.appendChild(newText);
                    var newCell = newRow.insertCell(2);
                    var inputElement = document.createElement('input');
                    inputElement.type = "button"
                    inputElement.value="Edit"
                    inputElement.id="btnEdit"
                    inputElement.setAttribute("class", "btn1");
                    inputElement.className="btn1"

                    inputElement.addEventListener('click', function(){
                        myFunction2(id,name);
                    });
                    var inputElement2 = document.createElement('input');
                    inputElement2.type = "button"
                    inputElement2.className="btn1"
                    inputElement2.value="Delete"
                    var icon=document.createElement('i');
                   // icon.innerHTML="<i class='fa fa-remove'></i>";
                    inputElement2.appendChild(icon)
                    inputElement2.addEventListener('click', function(){
                        myFunction3(id,a);
                    });
                    newCell.appendChild(inputElement);
                    newCell.appendChild(inputElement2);
                    // newCell.innerHTML="<button onclick='myFunction2(\\"" + result.name + "\\")' class='btn1' ><i class='fa fa-edit'></i></button>" +
                    //     "<button id='btnDelete' onclick='myFunction3()' class='btn1' ><i class='fa fa-remove'></i></button>" ;

                }
            }
        };
        xhttp.open("GET", "/library/libraries", true);
        xhttp.send();
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
