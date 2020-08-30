<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- === #24. tiles 를 사용하는 레이아웃1 페이지 만들기 === --%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<%
	String ctxPath = request.getContextPath();
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>YES24 티켓</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<link rel="shortcut icon" href="http://tkfile.yes24.com/img/favicon.ico?ver=150825a" type="image/x-icon">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">

<link rel="stylesheet" href="resources/css/header2.css">


<link rel="stylesheet" href="resources/css/footer.css">
<link rel="stylesheet" href="resources/css/grid.min.css">




</head>
<body>
<tiles:insertAttribute name="header" />

<tiles:insertAttribute name="content" />

<tiles:insertAttribute name="footer" />
</body>
</html>