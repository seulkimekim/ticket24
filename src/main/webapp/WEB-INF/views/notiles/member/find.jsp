<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String ctxPath = request.getContextPath();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Find ID page</title>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="resources/css/reset.css">
    <link rel="stylesheet" href="resources/css/find_id.css">
    <script src="https://kit.fontawesome.com/5342aa1b58.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <header class="tab-section">
        <h1 class="section-title">
            <a href="<%= ctxPath%>/yes24.action">TICKET24</a>
        </h1>
        <ul class="find-tab">
            <li role="tab" aria-selected="true">
                <a href="<%=ctxPath %>/findID.action" role="button">아이디 찾기</a>
            </li>
            <li role="tab" aria-selected="false">
                <a href="<%=ctxPath %>/findPW.action" role="button">비밀번호 찾기</a>
            </li>
        </ul>
    </header>
    <main class="main">
        <header>
            <h1>아이디 찾기</h1>
            <p>내 정보에 등록한 휴대폰 번호로 아이디를 찾을 수 있습니다.</p>
        </header>
        <div class="info-box">
            <div class="name-group input-group">
                <label for="name">이름</label>
                <input id="name" type="text" placeholder="">
            </div>
            <div class="mobile-group input-group">
                <label for="mobile">휴대폰</label>
                <input id="mobile" type="text" placeholder="&quot;-&quot; 없이 입력해주세요.">
            </div>
        </div>
        <ul class="button-group">
            <li role="tab" aria-selected="true">
                <a href="<%=ctxPath%>/login.action" role="button" class="cancel-button">취소</a>
            </li>
            <li role="tab" aria-selected="false">
                <button type="button" class="ok-button">확인</button>
            </li>
        </ul>
        <div class="response">
        </div>
        <footer class="main-footer">
            <p>휴대폰 번호로 아이디와 비밀번호를 찾을 수 없을 경우, <em><a href="<%= ctxPath%>/qna.action" role="button">고객센터</a></em>에 문의해 주세요.</p>
        </footer>
    </main>
    <footer class="footer">
        © TICKET24 Corp.
    </footer>
</div>
<script src="resources/js/find_id.js"></script>
</body>
</html>