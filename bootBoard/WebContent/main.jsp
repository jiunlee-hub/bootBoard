<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("userId");
%>    
<!doctype html>
<html>
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" />

    <title>JSP 게시판</title>
  </head>
  <body>
    	<nav class="navbar navbar-expand-sm navbar-light bg-light">
    		<a class="navbar-brand" href="main.jsp">JSP 게시판</a>
    		<button class="navbar-toggler" type="button" data-toggle="collapse"
    		data-target="#navbarSupportedContent"
    		aria-controls="navbarSupportedContent" aria-expanded="false"
    		aria-label="Toggle navigation">
    			<span class="navbar-toggler-icon"></span>
    		</button>
    		<div class="collapse navbar-collapse" id="navbarSupportedContent">
    			<ul class="navbar-nav">
    				<li class="nav-item">
    					<a class="nav-link active" href="main.jsp">메인<span class="sr-only">(current)</span></a>
    				</li>
    				<li class="nav-item">
    					<a class="nav-link" href="bbs.jsp">게시판</a>
    				</li>
    			</ul>
    			<ul class="navbar-nav ml-auto">
    				<li class="nav-item dropdown">
    					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
    					role="button" data-toggle="dropdown" aria-haspopup="true"
    					aria-expanded="false">접속하기</a>
    					<div class="dropdown-menu" aria-labelledby="navDropdown">
   <%
   	if(id == null) {
   %>		
    						<a class="dropdown-item" href="login.jsp">
    							로그인
    						</a>
    						<div class="dropdown-divider"></div>
    						<a class="dropdown-item" href="join.jsp">회원가입</a>
    <%
   	} else {
    %>
    				<a class="dropdown-item" href="logoutAction.jsp">로그아웃</a>
    <%
   		}
    %>					
    					</div>
    				</li>
    			</ul>
    		</div>
    	</nav>
    	<div class="container pt-3">
    		<div class="jumbotron">
    	<h2>웹 사이트 소개</h2>
    	<p>이 웹사이트는 JSP로 제작한 웹 사이트입니다. 간단한 게시판의 기능을 구현하였습니다.
    	디자인 템플릿으로는 부트 스트랩을 사용하였습니다.</p>
    	<a class="btn btn-primary btn-lg" href="#" role="button">자세히 알아보기</a>
    	</div>
    </div>
    <!-- Optional JavaScript-->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
   
  </body>
</html>