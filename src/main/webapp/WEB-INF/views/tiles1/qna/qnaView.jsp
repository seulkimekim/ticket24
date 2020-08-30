<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	String ctxPath = request.getContextPath();
	//		/finalproject4
%>


<style type="text/css">

	body{margin-top: 116px;}
	
	.noti-tit-tag01 {
		border: 1px solid #568ade;
		color: #568ade; 
		font-size: 10pt;
		padding: 5px 10px;
		margin: 0 15px 35px 0;
		text-align: right;
	}
	
	.noti-content {
		margin: 0px auto;
		padding: 0;
		width: 60%;
		word-wrap: break-word; 
	}
	
	.noti-vt-open {
		line-height: 1;
		margin: 30px 0 0 0;
		padding: 20px 0 0 0;
		font-style: normal;
		vertical-align: baseline;
		outline: none;
		background: #fbe5d5;
		border: 1px solid #999;
		margin-top: -1px;
		height: 230px;
		font-size: 17px;
		font-weight: 700;
		vertical-align: middle;
	}
	
	.noti-vt-open > span:nth-child(1) em {
		inline-block;
	    height: 22px;
	    line-height: 22px;
	    padding-left: 32px;
	    color: #ec7d2c;
		background: url('http://tkfile.yes24.com/imgNew/sub/ico-rp-tko1.png') no-repeat;
		background-size: auto 100%;
	}
	
	.noti-vt-open > span {
		margin: 0px 44px;
		padding: 14px 0 0 0;
		vertical-align: middle;
	}
	
	.noti-view-date, .noti-view-date > span { 
		text-align: right;
		height: 30px;
		line-height: 30px;
		margin-bottom: 30px;
	}

	.noti-content img {
		text-align: center;
	}

	table, th, td, textarea {border: solid gray 1px;}
	
	#table, #table2 {border-collapse: collapse;
	 		         width: 900px;
	 		        }
	#table th, #table td{padding: 5px;}
	#table th{width: 120px; background-color: #DDDDDD;}
	#table td{width: 750px;}
	
	.long {width: 470px;}
	.short {width: 120px;}
	
	.move {cursor: pointer;}
	.moveColor {color: #660029; font-weight: bold;}
	
	a {text-decoration: none !important;}
	
	#star_grade a{
        text-decoration: none;
        color: gray;
    }
    
    #star_grade a.on{
        color: red;
    }
    
    <%-- 
    .star-rating { width:205px; }
	.star-rating,.star-rating span { display:inline-block; height:39px; overflow:hidden; background:url(<%= ctxPath%>/resources/images/star.png)no-repeat; color: blue;}
	.star-rating span{ background-position:left bottom; line-height:0; vertical-align:top; }
     --%>
    .star-rating { width:103px; }
	.star-rating,.star-rating span { display:inline-block; height:19px; overflow:hidden; background:url(<%= ctxPath%>/resources/images/star_resize.png)no-repeat; color: blue;}
	.star-rating span{ background-position:left bottom; line-height:0; vertical-align:top; }
	
	.blue {
		color:#568ade;
	}
	
	.orange {
		color:#ec7d2c;
	}
	
	.list-button-group{
    display: flex;
    justify-content: center;
    margin-bottom: 50px;
	}
	
	.list-button-group a{
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    width: 100px;
	    height: 40px;
	    border: 1px solid rgb(216, 222, 226);
	    border-radius: 20px;
	    margin: 10px;
	    background-color: rgb(240, 240, 240);
	}
	
	.list-button-group a:hover{
	    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.08);
	} 
	
</style>



<div style="margin-top: 200px;">
	
	<h1 style="text-align: center; ">고객의 소리 게시판</h1>
	
	<div align="center">
	<hr style="border-top: solid 1px black; width:60%; margin: 50px 0; text-align: center;">
	<div style="text-align: center; font-size: 20pt;">
		<span class="noti-tit-tag01">${qnavo.qna_cate_name}</span>
		<c:if test="${qnavo.fk_seq == 0}">
			${qnavo.name}(${qnavo.fk_userid})님의 문의 : 
		</c:if>
		${qnavo.subject}</div>
	<hr style="border-top: solid 1px black; width:60%; margin: 50px 0; text-align: center;">
	</div>
	
	<div class="noti-content">
	
		<div class="noti-view-date">
			· <span>등록일 : ${qnavo.regDate}</span>&nbsp;&nbsp;&nbsp; 
			· <span>글번호 : ${qnavo.qna_id}</span>
			<br/>
			<c:if test="${qnavo.fk_userid != 'admin'}">
			· <c:if test="${qnavo.adminans == 0}"><span class="ans orange">답변대기</span></c:if><c:if test="${qnavo.adminans == 1}"><span class="ans blue">답변완료</span></c:if>&nbsp;&nbsp;&nbsp; 
			· <c:if test="${qnavo.adminread == 0}"><span class="ans orange">읽지않음</span></c:if><c:if test="${qnavo.adminread == 1}"><span class="ans blue">읽음</span></c:if>
			<br/>
			</c:if>
			<br/>
		</div>
		
		<c:if test="${qnavo.prod_img != ' '}">
			<div class="noti-vt-open">
			    <span><em>예매내역</em></span>
			    <span><a href="detail.action?seq=${qnavo.fk_rev_id}"><img src="resources/images/${qnavo.prod_img}" width="130px;"></a></span>
			    <span id="title1">${qnavo.prod_title}</span>
		    </div>
		</c:if>
				
			
		<p style="word-break: break-all; padding: 20px 20px; font-size: 13pt;">${qnavo.content}</p>
		
		<br/>
		
		<div>
		
			
			<hr style="border-top: solid 1px black; margin: 0 0 10px 0; text-align: center;">
				<div style="margin-bottom: 1%;">&nbsp;<i class="fas fa-chevron-up"></i> 이전글&nbsp;&nbsp;<span class="move" onclick="javascript:location.href='?seq=${qnavo.previousseq}'">${qnavo.previoussubject}</span></div>
				<div style="margin-bottom: 1%;">&nbsp;<i class="fas fa-chevron-down"></i> 다음글&nbsp;&nbsp;<span class="move" onclick="javascript:location.href='?seq=${qnavo.nextseq}'">${qnavo.nextsubject}</span></div>
			<hr style="border-top: solid 1px black; margin: 0; text-align: center;">
			
			<br/>
			
			<div style="text-align: center; margin-bottom: 50px;">
			
				<div class="row">
	                <div class="col-12">
	                    <div class="list-button-group">
	                        <a href="<%= request.getContextPath()%>/qnaListMain.action" role="button">전체목록보기</a>
	                        <a href="<%= request.getContextPath()%>/qnaListMain.action" role="button">목록보기</a>
	                        <a href="<%= request.getContextPath()%>/qnaAddAdmin.action?fk_seq=${qnavo.qna_id}&groupno=${qnavo.groupno}&depthno=${qnavo.depthno}&category=${qnavo.category}" role="button">답변글쓰기</a>
	                        <c:if test="${sessionScope.loginuser.userid eq 'admin' && qnavo.fk_userid eq 'admin'}">
	                            <a href="<%= request.getContextPath()%>/qnaEditAdmin.action?seq=${qnavo.qna_id}" role="button">수정</a>
	                            <a href="<%= request.getContextPath()%>/qnaDelAdmin.action?seq=${qnavo.qna_id}" role="button">삭제</a>
	                        </c:if>
	                    </div>
	                </div>
	            </div>
			
			<%-- 
				<button type="button" onclick="javascript:location.href='<%= request.getContextPath()%>/qnaListMain.action'">전체목록보기</button>
				<button type="button" onclick="javascript:location.href='<%= request.getContextPath()%>/qnaListMain.action'">목록보기</button>
					
				<c:if test="${gobackURL != null}">
					<button type="button" onclick="javascript:location.href=''">목록보기</button>
				</c:if>
				<c:if test="${gobackURL == null}">
					<button type="button" onclick="javascript:location.href='<%= request.getContextPath()%>/noticeMain.action'">목록보기</button>
				</c:if>
				
				<button type="button" onclick="javascript:location.href='<%= request.getContextPath()%>/qnaAddAdmin.action?fk_seq=${qnavo.qna_id}&groupno=${qnavo.groupno}&depthno=${qnavo.depthno}&category=${qnavo.category}'">답변글쓰기</button>
				<button type="button" onclick="javascript:location.href='<%= request.getContextPath()%>/qnaEdit.action?seq=${qnavo.qna_id}'">수정</button>
				<button type="button" onclick="javascript:location.href='<%= request.getContextPath()%>/qnaDel.action?seq=${qnavo.qna_id}'">삭제</button> --%>
			</div>
			
		</div>
		
	</div>
	
	
</div>

	




