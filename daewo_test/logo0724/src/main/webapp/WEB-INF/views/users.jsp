<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>외부 API 사용자 목록</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid #ccc;
        }

        th, td {
            padding: 8px;
            text-align: left;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<h2>외부 API 사용자 목록</h2>
<table id="userTable">
    <thead>
        <tr>
            <th>ID</th><th>Name</th><th>Username</th><th>Email</th>
        </tr>
    </thead>
    <tbody>
    </tbody>
</table>

<script>
$(document).ready(function() {
    $.ajax({
        url: '/api/users',
        method: 'GET',
        success: function(data) {
            var tbody = $('#userTable tbody');
            tbody.empty();

            if(data.length === 0) {
                tbody.append('<tr><td colspan="4">해당 사용자 데이터는 없습니다.</td></tr>');
                return;
            }

            data.forEach(function(user) {
                var row = '<tr>' +
                    '<td>' + user.id + '</td>' +
                    '<td>' + user.name + '</td>' +
                    '<td>' + user.username + '</td>' +
                    '<td>' + user.email + '</td>' +
                    '</tr>';
                tbody.append(row);
            });
        },
        error: function() {
            alert('외부 데이터를 불러오기 실패');
        }
    });
});
</script>
</body>
</html>
