

<html xmlns:th="https://www.thymeleaf.org">
<head th:include="layout :: head(title=~{::title},links=~{})">
    <title>Please Login</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/loginStyle.css">
    <link rel="stylesheet" href="/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="/jquery.min.js"></script>
    <script src="/bootstrap.min.js"></script>

</head>
<body th:include="layout :: body" th:with="content=~{::content}">
<div th:fragment="content">
            <div class="login-page-cont">
                <div class="forms-cont" id="signInSection">
                    <div class="login-form">
                        <form  th:action="@{/login}" method="post" class="form-inputs" name="loginForm">
                            <p class="auth-logo">
                                <img src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0id2luZG93cy0xMjUyIj8+DQo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTYuMC4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+DQo8IURPQ1RZUEUgc3ZnIFBVQkxJQyAiLS8vVzNDLy9EVEQgU1ZHIDEuMS8vRU4iICJodHRwOi8vd3d3LnczLm9yZy9HcmFwaGljcy9TVkcvMS4xL0RURC9zdmcxMS5kdGQiPg0KPHN2ZyB2ZXJzaW9uPSIxLjEiIGlkPSJDYXBhXzEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4IiB3aWR0aD0iNDkyLjA2OXB4IiBoZWlnaHQ9IjQ5Mi4wNjlweCIgdmlld0JveD0iMCAwIDQ5Mi4wNjkgNDkyLjA2OSIgc3R5bGU9ImVuYWJsZS1iYWNrZ3JvdW5kOm5ldyAwIDAgNDkyLjA2OSA0OTIuMDY5OyIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSI+DQo8ZyBmaWxsPSIjMDA4NDk4Ij4NCgk8cGF0aCBkPSJNMjY4LjY1NiwxNDQuMjdjMC02Mi42OTctNTAuOTk4LTExMy42OTktMTEzLjY5OC0xMTMuNjk5QzkyLjI1MywzMC41NzEsNDEuMjYsODEuNTczLDQxLjI2LDE0NC4yN3Y1Ny4yNSAgICAgQzE1LjczNSwyMjkuMTQ3LDAsMjY1Ljk2MiwwLDMwNi41Mzd2MTI1LjUwOGMwLDE2LjI2NiwxMy4xODksMjkuNDU0LDI5LjQ3MiwyOS40NTRoMjUwLjk4NyAgICAgYzE2LjI2NiwwLDI5LjQ1NC0xMy4xODgsMjkuNDU0LTI5LjQ1NHYtMTI1LjVjMC00MC41ODMtMTUuNzM1LTc3LjQwNy00MS4yNTYtMTA1LjAzNEwyNjguNjU2LDE0NC4yN0wyNjguNjU2LDE0NC4yN3ogICAgICBNMTc2Ljg1MiwzMTcuMDQ5djM1Ljk0OWMwLDEyLjA5NS05LjgwNSwyMS44OTgtMjEuODk0LDIxLjg5OGMtMTIuMDk0LDAtMjEuODk4LTkuODA1LTIxLjg5OC0yMS44OTh2LTM1Ljk0OSAgICAgYy04LjkxNi02LjY5MS0xNC43NjUtMTcuMjUyLTE0Ljc2NS0yOS4yNTZjMC0yMC4yNDIsMTYuNDEzLTM2LjY0OSwzNi42NjQtMzYuNjQ5czM2LjY2NCwxNi40MDcsMzYuNjY0LDM2LjY0OSAgICAgQzE5MS42MjEsMjk5Ljc5NywxODUuNzY3LDMxMC4zNTYsMTc2Ljg1MiwzMTcuMDQ5eiBNMjE5LjEyNywxNjUuNjI1Yy0xOS41NzMtOC45MzQtNDEuMjYtMTQuMDM4LTY0LjE2OS0xNC4wMzggICAgIGMtMjIuOTEzLDAtNDQuNTk2LDUuMTA0LTY0LjE2OCwxNC4wMzhWMTQ0LjI3YzAtMzUuMzg0LDI4Ljc3NS02NC4xNjksNjQuMTY4LTY0LjE2OWMzNS4zODksMCw2NC4xNjksMjguNzg1LDY0LjE2OSw2NC4xNjkgICAgIFYxNjUuNjI1TDIxOS4xMjcsMTY1LjYyNXoiLz4NCgk8cGF0aCBkPSJNNDA5LjMyNiw4Ni40NTdjLTQ1LjY5MSwwLTgyLjc0MSwzNy4wNDUtODIuNzQxLDgyLjc1NGMwLDMyLjQ4MywxOC44NzcsNjAuMjk4LDQ2LjEwOSw3My44NDd2MTM3LjQzMyAgICAgYzAsMjguMTM0LDIyLjgxMiw1MC45NDgsNTAuOTQ3LDUwLjk0OGMxMi4zMTcsMCwyMi4zMTQtOS45NzksMjIuMzE0LTIyLjI5OFYyNDMuMDU4YzI3LjIxNC0xMy41NDQsNDYuMTEzLTQxLjM2Myw0Ni4xMTMtNzMuODQ3ICAgICBDNDkyLjA3MSwxMjMuNTAyLDQ1NS4wMTgsODYuNDU3LDQwOS4zMjYsODYuNDU3eiBNNDA5LjMyNiwxNTQuNDk2Yy0xMC43MzgsMC0xOS40NDMtOC43MDUtMTkuNDQzLTE5LjQzNCAgICAgYzAtMTAuNzI5LDguNzA1LTE5LjQzOCwxOS40NDMtMTkuNDM4czE5LjQ0Miw4LjcwOSwxOS40NDIsMTkuNDM4UzQyMC4wNjQsMTU0LjQ5Niw0MDkuMzI2LDE1NC40OTZ6Ii8+DQo8L2c+DQo8IS0tIENvZGUgaW5qZWN0ZWQgYnkgbGl2ZS1zZXJ2ZXIgLS0+CjxzY3JpcHQgdHlwZT0idGV4dC9qYXZhc2NyaXB0Ij4KCS8vIDwhW0NEQVRBWyAgPC0tIEZvciBTVkcgc3VwcG9ydAoJaWYgKCdXZWJTb2NrZXQnIGluIHdpbmRvdykgewoJCShmdW5jdGlvbiAoKSB7CgkJCWZ1bmN0aW9uIHJlZnJlc2hDU1MoKSB7CgkJCQl2YXIgc2hlZXRzID0gW10uc2xpY2UuY2FsbChkb2N1bWVudC5nZXRFbGVtZW50c0J5VGFnTmFtZSgibGluayIpKTsKCQkJCXZhciBoZWFkID0gZG9jdW1lbnQuZ2V0RWxlbWVudHNCeVRhZ05hbWUoImhlYWQiKVswXTsKCQkJCWZvciAodmFyIGkgPSAwOyBpIDwgc2hlZXRzLmxlbmd0aDsgKytpKSB7CgkJCQkJdmFyIGVsZW0gPSBzaGVldHNbaV07CgkJCQkJdmFyIHBhcmVudCA9IGVsZW0ucGFyZW50RWxlbWVudCB8fCBoZWFkOwoJCQkJCXBhcmVudC5yZW1vdmVDaGlsZChlbGVtKTsKCQkJCQl2YXIgcmVsID0gZWxlbS5yZWw7CgkJCQkJaWYgKGVsZW0uaHJlZiAmJiB0eXBlb2YgcmVsICE9ICJzdHJpbmciIHx8IHJlbC5sZW5ndGggPT0gMCB8fCByZWwudG9Mb3dlckNhc2UoKSA9PSAic3R5bGVzaGVldCIpIHsKCQkJCQkJdmFyIHVybCA9IGVsZW0uaHJlZi5yZXBsYWNlKC8oJnxcPylfY2FjaGVPdmVycmlkZT1cZCsvLCAnJyk7CgkJCQkJCWVsZW0uaHJlZiA9IHVybCArICh1cmwuaW5kZXhPZignPycpID49IDAgPyAnJicgOiAnPycpICsgJ19jYWNoZU92ZXJyaWRlPScgKyAobmV3IERhdGUoKS52YWx1ZU9mKCkpOwoJCQkJCX0KCQkJCQlwYXJlbnQuYXBwZW5kQ2hpbGQoZWxlbSk7CgkJCQl9CgkJCX0KCQkJdmFyIHByb3RvY29sID0gd2luZG93LmxvY2F0aW9uLnByb3RvY29sID09PSAnaHR0cDonID8gJ3dzOi8vJyA6ICd3c3M6Ly8nOwoJCQl2YXIgYWRkcmVzcyA9IHByb3RvY29sICsgd2luZG93LmxvY2F0aW9uLmhvc3QgKyB3aW5kb3cubG9jYXRpb24ucGF0aG5hbWUgKyAnL3dzJzsKCQkJdmFyIHNvY2tldCA9IG5ldyBXZWJTb2NrZXQoYWRkcmVzcyk7CgkJCXNvY2tldC5vbm1lc3NhZ2UgPSBmdW5jdGlvbiAobXNnKSB7CgkJCQlpZiAobXNnLmRhdGEgPT0gJ3JlbG9hZCcpIHdpbmRvdy5sb2NhdGlvbi5yZWxvYWQoKTsKCQkJCWVsc2UgaWYgKG1zZy5kYXRhID09ICdyZWZyZXNoY3NzJykgcmVmcmVzaENTUygpOwoJCQl9OwoJCQlpZiAoc2Vzc2lvblN0b3JhZ2UgJiYgIXNlc3Npb25TdG9yYWdlLmdldEl0ZW0oJ0lzVGhpc0ZpcnN0VGltZV9Mb2dfRnJvbV9MaXZlU2VydmVyJykpIHsKCQkJCWNvbnNvbGUubG9nKCdMaXZlIHJlbG9hZCBlbmFibGVkLicpOwoJCQkJc2Vzc2lvblN0b3JhZ2Uuc2V0SXRlbSgnSXNUaGlzRmlyc3RUaW1lX0xvZ19Gcm9tX0xpdmVTZXJ2ZXInLCB0cnVlKTsKCQkJfQoJCX0pKCk7Cgl9CgllbHNlIHsKCQljb25zb2xlLmVycm9yKCdVcGdyYWRlIHlvdXIgYnJvd3Nlci4gVGhpcyBCcm93c2VyIGlzIE5PVCBzdXBwb3J0ZWQgV2ViU29ja2V0IGZvciBMaXZlLVJlbG9hZGluZy4nKTsKCX0KCS8vIF1dPgo8L3NjcmlwdD48L3N2Zz4=" alt="Icon" />
                            </p>
                            <div class="form-group">
                                <label class="input-label" for="username"><i class="fa fa-user"></i> User Name</label>
                                <input type="text" class="form-control" name="username" id="username"type="text" id="username" name="username"
                                       placeholder="user name" />
                            </div>
                            <div class="form-group">
                                <label class="input-label" for="Password"><i class="fa fa-key"></i> Password</label>
                                <input type="password" class="form-control" name="password" id="Password"
                                       placeholder="password" />
                            </div>
                            <div class="form-group form-check">
                                <p class="remember-check-box">
                                    <input type="checkbox" class="form-check-input" name="remember" id="inputRemember" />
                                    <label class="check-box fas fa-check" for="inputRemember"></label>
                                    <label class="form-check-label" for="inputRemember">Remember me</label>
                                </p>
                            </div>

                            <button type="submit" class="btn btn-primary btn-block">Login</button>


                        </form>
                    </div>

                    <div class="register-form">
                        <form onsubmit="return myFunction()" class="form-inputs" id="myform" name="signInForm">
                            <p class="auth-logo">
                                <img src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0id2luZG93cy0xMjUyIj8+DQo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTYuMC4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+DQo8IURPQ1RZUEUgc3ZnIFBVQkxJQyAiLS8vVzNDLy9EVEQgU1ZHIDEuMS8vRU4iICJodHRwOi8vd3d3LnczLm9yZy9HcmFwaGljcy9TVkcvMS4xL0RURC9zdmcxMS5kdGQiPg0KPHN2ZyB2ZXJzaW9uPSIxLjEiIGlkPSJDYXBhXzEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4IiB3aWR0aD0iNDM4LjU0MnB4IiBoZWlnaHQ9IjQzOC41NDJweCIgdmlld0JveD0iMCAwIDQzOC41NDIgNDM4LjU0MiIgc3R5bGU9ImVuYWJsZS1iYWNrZ3JvdW5kOm5ldyAwIDAgNDM4LjU0MiA0MzguNTQyOyIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSI+DQoJPGcgZmlsbD0iIzAwODQ5OCI+DQoJCTxwYXRoIGQ9Ik00MTQuNDEsNjAuNjc2Yy0xNi4wODQtMTYuMDgzLTM1LjQ0Ni0yNC4xMjUtNTguMTAyLTI0LjEyNWgtOTEuMzU3Yy0yLjQ3OCwwLTQuNDI5LDAuNjE0LTUuODUzLDEuODU1ICAgIGMtMS40MzEsMS4yMzctMi4zODIsMy4wOTMtMi44NTQsNS41NjhjLTAuNDc5LDIuNDc0LTAuNzYsNC43MDktMC44NTMsNi43MDdjLTAuMDk2LDEuOTk3LTAuMDUxLDQuNTIxLDAuMTQ0LDcuNTY1ICAgIGMwLjE4NiwzLjA0NiwwLjI4MSw0Ljk0OSwwLjI4MSw1LjcxM2MwLjU3MSwxLjUyNCwwLjc2NywyLjgxLDAuNTcxLDMuODU1Yy0wLjE5MSwxLjA0MywwLjQ3NiwxLjkwMywxLjk5OCwyLjU2OCAgICBjMS41MiwwLjY2NiwyLjI3OSwxLjE5MSwyLjI3OSwxLjU2OWMwLDAuMzc4LDEuMDk2LDAuNjYyLDMuMjg1LDAuODU1YzIuMTksMC4xOTIsMy4yODksMC4yODQsMy4yODksMC4yODRoMy43MTNoMy4xNDJoODIuMjI4ICAgIGMxMi41NiwwLDIzLjMxMiw0LjQ3MSwzMi4yNTgsMTMuNDIyYzguOTUyLDguOTQ1LDEzLjQyMiwxOS42OTYsMTMuNDIyLDMyLjI2MVYzMTkuNzdjMCwxMi41NjMtNC40NywyMy4zMTItMTMuNDIyLDMyLjI1OCAgICBjLTguOTQ1LDguOTQ4LTE5LjY5OCwxMy40MjEtMzIuMjU4LDEzLjQyMWgtOTEuMzU3Yy0yLjQ3OCwwLTQuNDM2LDAuNjItNS44NTMsMS44NTVjLTEuNDMsMS4yNDItMi4zODIsMy4wOTQtMi44NTcsNS41NjQgICAgYy0wLjQ3NiwyLjQ3OC0wLjc2Myw0LjcxNi0wLjg1NSw2LjcxNGMtMC4wOTIsMS45OTUtMC4wNTEsNC41MTgsMC4xNDQsNy41NjNjMC4xOTUsMy4wNDYsMC4yODgsNC45NDgsMC4yODgsNS43MDggICAgYzAsMi40NzgsMC44OTYsNC42MTMsMi43MDcsNi40MjdjMS44MSwxLjgwNywzLjk0OSwyLjcxLDYuNDI3LDIuNzFoOTEuMzU3YzIyLjY0OCwwLDQyLjAxOC04LjA0Miw1OC4wOTUtMjQuMTMzICAgIGMxNi4wODQtMTYuMDc3LDI0LjEyNi0zNS40NDYsMjQuMTI2LTU4LjA5NVYxMTguNzY5QzQzOC41MzMsOTYuMTE4LDQzMC40OTEsNzYuNzU0LDQxNC40MSw2MC42NzZ6Ii8+DQoJCTxwYXRoIGQ9Ik0zMzguMDQ3LDIxOS4yN2MwLTQuOTQ4LTEuODEzLTkuMjMzLTUuNDI3LTEyLjg1TDE3Ny4zMDIsNTEuMTAxYy0zLjYxNi0zLjYxMi03Ljg5NS01LjQyNC0xMi44NDctNS40MjQgICAgYy00Ljk1MiwwLTkuMjMzLDEuODEyLTEyLjg1LDUuNDI0Yy0zLjYxNSwzLjYxNy01LjQyNCw3LjkwNC01LjQyNCwxMi44NXY4Mi4yMjZIMTguMjc0Yy00Ljk1MiwwLTkuMjM1LDEuODEyLTEyLjg1MSw1LjQyNCAgICBDMS44MDcsMTU1LjIxOSwwLDE1OS41MDMsMCwxNjQuNDUydjEwOS42MzVjMCw0Ljk0OSwxLjgwNyw5LjIzMyw1LjQyNCwxMi44NDhjMy42MTksMy42MSw3LjkwMiw1LjQyNywxMi44NTEsNS40MjdoMTI3LjkwNiAgICB2ODIuMjI1YzAsNC45NDUsMS44MDksOS4yMzMsNS40MjQsMTIuODQ3YzMuNjIxLDMuNjE3LDcuOTAyLDUuNDI4LDEyLjg1LDUuNDI4YzQuOTQ5LDAsOS4yMzEtMS44MTEsMTIuODQ3LTUuNDI4bDE1NS4zMTgtMTU1LjMxMiAgICBDMzM2LjIzNCwyMjguNTAxLDMzOC4wNDcsMjI0LjIxNiwzMzguMDQ3LDIxOS4yN3oiLz4NCgk8L2c+DQo8IS0tIENvZGUgaW5qZWN0ZWQgYnkgbGl2ZS1zZXJ2ZXIgLS0+CjxzY3JpcHQgdHlwZT0idGV4dC9qYXZhc2NyaXB0Ij4KCS8vIDwhW0NEQVRBWyAgPC0tIEZvciBTVkcgc3VwcG9ydAoJaWYgKCdXZWJTb2NrZXQnIGluIHdpbmRvdykgewoJCShmdW5jdGlvbiAoKSB7CgkJCWZ1bmN0aW9uIHJlZnJlc2hDU1MoKSB7CgkJCQl2YXIgc2hlZXRzID0gW10uc2xpY2UuY2FsbChkb2N1bWVudC5nZXRFbGVtZW50c0J5VGFnTmFtZSgibGluayIpKTsKCQkJCXZhciBoZWFkID0gZG9jdW1lbnQuZ2V0RWxlbWVudHNCeVRhZ05hbWUoImhlYWQiKVswXTsKCQkJCWZvciAodmFyIGkgPSAwOyBpIDwgc2hlZXRzLmxlbmd0aDsgKytpKSB7CgkJCQkJdmFyIGVsZW0gPSBzaGVldHNbaV07CgkJCQkJdmFyIHBhcmVudCA9IGVsZW0ucGFyZW50RWxlbWVudCB8fCBoZWFkOwoJCQkJCXBhcmVudC5yZW1vdmVDaGlsZChlbGVtKTsKCQkJCQl2YXIgcmVsID0gZWxlbS5yZWw7CgkJCQkJaWYgKGVsZW0uaHJlZiAmJiB0eXBlb2YgcmVsICE9ICJzdHJpbmciIHx8IHJlbC5sZW5ndGggPT0gMCB8fCByZWwudG9Mb3dlckNhc2UoKSA9PSAic3R5bGVzaGVldCIpIHsKCQkJCQkJdmFyIHVybCA9IGVsZW0uaHJlZi5yZXBsYWNlKC8oJnxcPylfY2FjaGVPdmVycmlkZT1cZCsvLCAnJyk7CgkJCQkJCWVsZW0uaHJlZiA9IHVybCArICh1cmwuaW5kZXhPZignPycpID49IDAgPyAnJicgOiAnPycpICsgJ19jYWNoZU92ZXJyaWRlPScgKyAobmV3IERhdGUoKS52YWx1ZU9mKCkpOwoJCQkJCX0KCQkJCQlwYXJlbnQuYXBwZW5kQ2hpbGQoZWxlbSk7CgkJCQl9CgkJCX0KCQkJdmFyIHByb3RvY29sID0gd2luZG93LmxvY2F0aW9uLnByb3RvY29sID09PSAnaHR0cDonID8gJ3dzOi8vJyA6ICd3c3M6Ly8nOwoJCQl2YXIgYWRkcmVzcyA9IHByb3RvY29sICsgd2luZG93LmxvY2F0aW9uLmhvc3QgKyB3aW5kb3cubG9jYXRpb24ucGF0aG5hbWUgKyAnL3dzJzsKCQkJdmFyIHNvY2tldCA9IG5ldyBXZWJTb2NrZXQoYWRkcmVzcyk7CgkJCXNvY2tldC5vbm1lc3NhZ2UgPSBmdW5jdGlvbiAobXNnKSB7CgkJCQlpZiAobXNnLmRhdGEgPT0gJ3JlbG9hZCcpIHdpbmRvdy5sb2NhdGlvbi5yZWxvYWQoKTsKCQkJCWVsc2UgaWYgKG1zZy5kYXRhID09ICdyZWZyZXNoY3NzJykgcmVmcmVzaENTUygpOwoJCQl9OwoJCQlpZiAoc2Vzc2lvblN0b3JhZ2UgJiYgIXNlc3Npb25TdG9yYWdlLmdldEl0ZW0oJ0lzVGhpc0ZpcnN0VGltZV9Mb2dfRnJvbV9MaXZlU2VydmVyJykpIHsKCQkJCWNvbnNvbGUubG9nKCdMaXZlIHJlbG9hZCBlbmFibGVkLicpOwoJCQkJc2Vzc2lvblN0b3JhZ2Uuc2V0SXRlbSgnSXNUaGlzRmlyc3RUaW1lX0xvZ19Gcm9tX0xpdmVTZXJ2ZXInLCB0cnVlKTsKCQkJfQoJCX0pKCk7Cgl9CgllbHNlIHsKCQljb25zb2xlLmVycm9yKCdVcGdyYWRlIHlvdXIgYnJvd3Nlci4gVGhpcyBCcm93c2VyIGlzIE5PVCBzdXBwb3J0ZWQgV2ViU29ja2V0IGZvciBMaXZlLVJlbG9hZGluZy4nKTsKCX0KCS8vIF1dPgo8L3NjcmlwdD48L3N2Zz4=" alt="Icon" />
                            </p>
                            <div class="form-group">
                                <label class="input-label" for="name"><i class="fa fa-user"></i> Name*</label>
                                <input type="text" class="form-control" name="name" id="name"
                                       placeholder="your name"/>
                            </div>
                            <div class="form-group">
                                <label class="input-label" for="username2"><i class="fa fa-user"></i> User Name*</label>
                                <input type="text" class="form-control" name="userName" id="username2"
                                       placeholder="user name" />
                            </div>
                            <div class="form-group">
                                <label class="input-label" for="password2"><i class="fa fa-key"></i>Password*</label>
                                <input type="password" class="form-control" name="password" id="password2"
                                       placeholder="password" />
                            </div>

                            <div class="form-group">
                                <input type="hidden" value="1" class="form-control" name="role.id" id="role"/>
                            </div>
                            <input id="id" name="id" type="hidden" />

                            <button type="submit" class="btn btn-primary btn-block">Sign Up</button>
                        </form>
                    </div>

                    <button type="button" class="btn signin-btn" id="goToSignInSection">
                        <span id="login">Sign Up</span>
                        <span id="signIn">Login</span>
                        <i class="fas fa-hand-point-right"></i>
                    </button>
                </div>
            </div>



    </form>
</div>
<script>
    function myFunction() {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "http://localhost:8081/user/adduser",true);

        var formData = new FormData(document.getElementById("myform"));
        xhr.send(formData);

        document.getElementById("name").value="";
        document.getElementById("username2").value="";
        document.getElementById("password2").value="";
        alert("Registration completed successfully!")
        return false;
    }


    $(document).ready(function(){
        $("#signIn").hide();
        $("#goToSignInSection").click(function(){
            $("#signInSection").toggleClass("signin");
            $("#login, #signIn").toggle();
        });
    });

</script>
</body>
</html>



