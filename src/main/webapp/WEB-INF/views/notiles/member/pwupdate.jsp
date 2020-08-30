<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Find Password page</title>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="resources/css/reset.css">
    <link rel="stylesheet" href="resources/css/reset_pw.css">
    <script src="https://kit.fontawesome.com/5342aa1b58.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <header class="tab-section">
        <h1 class="section-title">
            <a href="#">TICKET24</a>
        </h1>
    </header>
    <main class="main">
        <header>
            <h1>비밀번호 변경하기</h1>
            <p>8~20자 이내의 영문과 숫자 또는 특수문자의 조합으로 입력해주세요.</p>
        </header>
        <form action="/finalproject4/updatePW.action" method="POST" onsubmit="return validateForm()">
            <input name="userid" type="hidden" value="${sessionScope.userid}">
            <div class="info-box">
                <div class="userpw-group input-group">
                    <label for="userpw">비밀번호</label>
                    <input name="userpw" id="userpw" type="password" placeholder="">
                    <button type="button" aria-label="Show password" class="password-button hide"></button>
                </div>
                <div class="userpw-check-group input-group">
                    <label for="userpw-check">비밀번호 재입력</label>
                    <input id="userpw-check" type="password" placeholder="">
                    <button type="button" aria-label="Show password" class="password-button hide"></button>
                </div>
            </div>
            <div class="response"></div>
            <ul class="button-group">
                <li role="tab" aria-selected="true">
                    <a href="/finalproject4/login.action" role="button" class="cancel-button">취소</a>
                </li>
                <li role="tab" aria-selected="false">
                    <button type="submit" class="ok-button">확인</button>
                </li>
            </ul>
        </form>
    </main>
    <footer class="footer">
        © TICKET24 Corp.
    </footer>
</div>
<script src="resources/js/reset_pw.js"></script>
</body>
</html>