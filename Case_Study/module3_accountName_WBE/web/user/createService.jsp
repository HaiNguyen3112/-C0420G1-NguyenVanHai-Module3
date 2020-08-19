<%--
  Created by IntelliJ IDEA.
  User: Minh Nguyen
  Date: 13/8/2020
  Time: 2:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Create New Service</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        body {
            width: 1355px;
            height: 680px;
            background-image : url("../image/wall.jpg");
            background-size: cover;
            font-family: 'Varela Round', sans-serif;
        }
        .form-inline {
            display: inline-block;
        }
        .navbar {
            color: #fff;
            background: black;
            padding: 5px 16px;
            border-radius: 0;
            border: none;
            box-shadow: 0 0 4px rgba(0,0,0,.1);
        }
        .navbar img {
            border-radius: 50%;
            width: 36px;
            height: 36px;
            margin-right: 10px;
        }
        .navbar .navbar-brand {
            color: #efe5ff;
            padding-left: 0;
            padding-right: 50px;
            font-size: 24px;
        }
        .navbar .navbar-brand:hover, .navbar .navbar-brand:focus {
            color: #fff;
        }
        .navbar .navbar-brand i {
            font-size: 25px;
            margin-right: 5px;
        }
        .search-box {
            position: relative;
        }
        .search-box input {
            padding-right: 35px;
            min-height: 38px;
            border: none;
            background: #faf7fd;
            border-radius: 3px !important;
        }
        .search-box input:focus {
            background: #fff;
            box-shadow: none;
        }
        .search-box .input-group-addon {
            min-width: 35px;
            border: none;
            background: transparent;
            position: absolute;
            right: 0;
            z-index: 9;
            padding: 10px 7px;
            height: 100%;
        }
        .search-box i {
            color: #a0a5b1;
            font-size: 19px;
        }
        .navbar ul li i {
            font-size: 18px;
        }
        .navbar .nav-item span {
            position: relative;
            top: 3px;
        }
        .navbar .nav > li a {
            color: #efe5ff;
            padding: 8px 15px;
            font-size: 14px;
        }
        .navbar .nav > li a:hover, .navbar .nav > li a:focus {
            color: #fff;
            text-shadow: 0 0 4px rgba(255,255,255,0.3);
        }
        .navbar .nav > li > a > i {
            display: block;
            text-align: center;
        }
        .navbar .dropdown-menu i {
            font-size: 16px;
            min-width: 22px;
        }
        .navbar .dropdown-menu .material-icons {
            font-size: 21px;
            line-height: 16px;
            vertical-align: middle;
            margin-top: -2px;
        }
        .navbar .dropdown.open > a, .navbar .dropdown.open > a:hover, .navbar .dropdown.open > a:focus {
            color: #fff;
            background: none !important;
        }
        .navbar .dropdown-menu {
            border-radius: 1px;
            border-color: #e5e5e5;
            box-shadow: 0 2px 8px rgba(0,0,0,.05);
        }
        .navbar .dropdown-menu li a {
            color: #777 !important;
            padding: 8px 20px;
            line-height: normal;
        }
        .navbar .dropdown-menu li a:hover, .navbar .dropdown-menu li a:focus {
            color: #333 !important;
            background: transparent !important;
        }
        .navbar .nav .active a, .navbar .nav .active a:hover, .navbar .nav .active a:focus {
            color: #fff;
            text-shadow: 0 0 4px rgba(255,255,255,0.2);
            background: transparent !important;
        }
        .navbar .nav .user-action {
            padding: 9px 15px;
        }
        .navbar .navbar-toggle {
            border-color: #fff;
        }
        .navbar .navbar-toggle .icon-bar {
            background: #fff;
        }
        .navbar .navbar-toggle:focus, .navbar .navbar-toggle:hover {
            background: transparent;
        }
        .navbar .navbar-nav .open .dropdown-menu {
            background: #faf7fd;
            border-radius: 1px;
            border-color: #faf7fd;
            box-shadow: 0 2px 8px rgba(0,0,0,.05);
        }
        .navbar .divider {
            background-color: #e9ecef !important;
        }
        @media (min-width: 1200px){
            .form-inline .input-group {
                width: 350px;
                margin-left: 30px;
            }
        }
        @media (max-width: 1199px){
            .navbar .nav > li > a > i {
                display: inline-block;
                text-align: left;
                min-width: 30px;
                position: relative;
                top: 4px;
            }
            .navbar .navbar-collapse {
                border: none;
                box-shadow: none;
                padding: 0;
            }
            .navbar .navbar-form {
                border: none;
                display: block;
                margin: 10px 0;
                padding: 0;
            }
            .navbar .navbar-nav {
                margin: 8px 0;
            }
            .navbar .navbar-toggle {
                margin-right: 0;
            }
            .input-group {
                width: 100%;
            }
        }
    </style>
</head>
<body>
<nav class="navbar navbar-inverse navbar-expand-xl navbar-dark">
    <div class="navbar-header">
        <a class="navbar-brand" href="#"><i class="fa fa-cube"></i>Furama<b>Resort</b></a>
        <button type="button" data-target="#navbarCollapse" data-toggle="collapse" class="navbar-toggle">
            <span class="navbar-toggler-icon"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
    </div>
    <!-- Collection of nav links, forms, and other content for toggling -->
    <div id="navbarCollapse" class="collapse navbar-collapse">
        <ul class="nav navbar-nav navbar-right">
            <li class="active"><a href="/furama"><i class="fa fa-home"></i><span>Home</span></a></li>
            <li><a href="/furama?action=employee"><i class="fa fa-gears"></i><span>Employee</span></a></li>
            <li><a href="/furama?action=customer"><i class="fa fa-users"></i><span>Customer</span></a></li>
            <li><a href="/furama?action=createservice"><i class="fa fa-pie-chart"></i><span>Service</span></a></li>
            <li><a href="/furama?action=createcontract"><i class="fa fa-briefcase"></i><span>Contract</span></a></li>
            <li>
                <form class="navbar-form form-inline">
                    <div class="input-group search-box">
                        <input type="text" id="search" class="form-control" placeholder="Search here...">
                        <span class="input-group-addon"><i class="material-icons">&#xE8B6;</i></span>
                    </div>
                </form>
            </li>
        </ul>
    </div>
</nav>

<div><a href="/furama">Back</a>
    <form method="post">
        <h3>
            Thêm mới Dịch Vụ!!!
        </h3>
        <table>
            <tr>
                <td>Loại dịch vụ: </td>
                <td>
                    <select id="selectType" onchange="displayInput()" name="serviceTypeId">
                        <option value="1">Villa</option>
                        <option value="2">House</option>
                        <option value="3">Room</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>STT: </td>
                <td><input type="text" name="id"></td>
            </tr>
            <tr>
                <td>Tên dịch vụ: </td>
                <td><input type="text" name ="name"></td>
            </tr>
            <tr>
                <td>Diện tích: </td>
                <td><input type="text" name="serviceArea"></td>
            </tr>
        
            <tr>
                <td>Giá: </td>
                <td><input type="text" name="cost"></td>
            </tr>
            <tr>
                <td>Số người tối đa: </td>
                <td><input type="text" name="maxPeople"></td>
            </tr>
            <tr>
                <td>Kiểu thuê: </td>
                <td><input type="text" name="rentTypeId"></td>
            </tr>
            <tr id="standard_Room">
                <td>Tiêu chuẩn phòng: </td>
                <td><input type="text" name="standardRoom" ></td>
            </tr>
            <tr id="description">
                <td>Tiện nghi khác: </td>
                <td><input type="text" name="description" ></td>
            </tr>

            <tr id="poolArea">
                <td>Diện tích hồ bơi: </td>
                <td><input type="text" name="poolArea" ></td>
            </tr>

            <tr id="numberOfFloors">
                <td>Số tầng: </td>
                <td><input type="text" name="numberOfFloors" ></td>
            </tr>

            <tr>
                <td align="center" colspan="2">
                    <a href="/furama?action=createservice"><input type="button" value="Xoá"></a>
                    <input type="submit" name="submit" value="Lưu">
                </td>
            </tr>
        </table>
    </form>

</div>
<script>
    
    function displayInput() {
        let select = document.getElementById("selectType");
        let standard = document.getElementById("standard_Room");
        let description = document.getElementById("description");
        let pool = document.getElementById("poolArea");
        let number = document.getElementById("numberOfFloors");

        if (select.value === "2"){
            standard.style.display = "table-row";
            description.style.display = "table-row";
            pool.style.display = "none";
            number.style.display = "table-row";
            pool.value = 0;
        } else if (select.value === "3"){
            standard.style.display = "none";
            description.style.display = "none";
            pool.style.display = "none";
            number.style.display = "none";
        } else{
            standard.style.display = "table-row";
            description.style.display = "table-row";
            pool.style.display = "table-row";
            number.style.display = "table-row";
        }

    }
</script>
</body>
</html>
