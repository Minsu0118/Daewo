<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>회원가입</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fff;
            margin: 0;
            padding: 0;
        }

        .register-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 30px;
            border: 1px solid #ccc;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 10px;
        }
        td.label {
		    width: 120px;
		    text-align: right;
		    font-weight: 500;
		    background-color: #f2f2f2;
		}
        td.input {
            width: auto;
        }
        tr.password-confirm-row td {
		    padding-top: 4px; /* 기본보다 조금 좁게 */
		}

        input[type="text"],
        input[type="password"],
        input[type="email"] {
            width: 90%;
            padding: 8px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        .pw-check-container {
            display: flex;
            gap: 10px;
            align-items: center;
        }
        .pw-check-container input {
            flex: 1;
        }
        .pw-check-container button {
            padding: 8px 14px;
            background-color: white;
            border: 1px solid #222;
            cursor: pointer;
        }
        #pwCheckMessage {
            font-size: 13px;
            margin-top: 5px;
            color: red;
        }
        .pw-check-success {
            color: green;
        }

        .button-row {
            margin-top: 30px;
            text-align: center;
        }
        .button-row button {
            padding: 10px 30px;
            margin: 0 10px;
            border-radius: 4px;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
        }
        .btn-cancel {
            background-color: white;
            border: 1px solid #333;
            color: black;
        }
        .btn-submit {
            background-color: #555;
            color: white;
            border: none;
        }
        .btn-cancel:hover {
            background-color: #eee;
        }
        .btn-submit:hover {
            background-color: #444;
        }
    </style>

<script>
    const passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()\-_=+{};:,<.>]).+$/;

    function checkPasswordMatch() {
        const pw1 = document.querySelector('input[name="password"]').value;
        const pw2 = document.querySelector('input[name="passwordConfirm"]').value;
        const msg = document.getElementById("pwCheckMessage");

        if (!pw1 || !pw2) {
            msg.textContent = "비밀번호를 입력하세요.";
            msg.classList.remove("pw-check-success");
            return false;
        }

        if (!passwordPattern.test(pw1)) {
            msg.textContent = "영문 대문자, 소문자, 숫자, 특수문자가 포함되어 있지 않습니다!!";
            msg.classList.remove("pw-check-success");
            return false;
        }

        if (pw1 === pw2) {
            msg.textContent = "비밀번호가 일치합니다.";
            msg.classList.add("pw-check-success");
            return true;
        } else {
            msg.textContent = "비밀번호가 일치하지 않습니다.";
            msg.classList.remove("pw-check-success");
            return false;
        }
    }

    function validateForm(event) {
        if (!checkPasswordMatch()) {
            event.preventDefault();
        }
    }

    window.onload = function () {
        document.querySelector('input[name="password"]').addEventListener('input', checkPasswordMatch);
        document.querySelector('input[name="passwordConfirm"]').addEventListener('input', checkPasswordMatch);
        document.querySelector('form').addEventListener('submit', validateForm);
    };
</script>

</head>
<body>

<div class="register-container">
    <h2>회원가입 양식</h2>
    <form action="/register" method="post">
    <sec:csrfInput />
        <table>
            <tr>
                <td class="label">이름</td>
                <td class="input"><input type="text" name="name" required></td>
            </tr>
            <tr>
                <td class="label">아이디</td>
                <td class="input"><input type="text" name="username" required></td>
            </tr>
            <tr>
                <td class="label">비밀번호</td>
                <td class="input"><input type="password" name="password" required></td>
            </tr>
            <tr>
                <td class="label">비밀번호 확인</td>
                <td class="input">
                    <div class="pw-check-container">
                        <input type="password" name="passwordConfirm" required>
                        <button type="button" onclick="checkPasswordMatch()">비밀번호 확인</button>
                    </div>
                    <p id="pwCheckMessage"></p>
                </td>
            </tr>
            <tr>
                <td class="label">이메일</td>
                <td class="input"><input type="email" name="email" required></td>
            </tr>
        </table>

        <div class="button-row">
            <button type="button" class="btn-cancel" onclick="location.href='/main'">가입 취소</button>
            <button type="submit" class="btn-submit">회원가입</button>
        </div>
    </form>
</div>

</body>
</html>
