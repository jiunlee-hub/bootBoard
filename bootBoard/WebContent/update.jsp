<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%
	String  userId = (String)session.getAttribute("userId");
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
    					<a class="nav-link" href="main.jsp">메인</a>
    				</li>
    				<li class="nav-item">
    					<a class="nav-link active" href="bbs.jsp">게시판<span class="sr-only">(current)</span></a>
    				</li>
    			</ul>
    			<ul class="navbar-nav ml-auto">
    				<li class="nav-item dropdown">
    					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
    					role="button" data-toggle="dropdown" aria-haspopup="true"
    					aria-expanded="false">접속하기</a>
    					<div class="dropdown-menu" aria-labelledby="navDropdown">
   <%
   	if(userId == null) {
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
    	<%
    		if(session.getAttribute("userId") != null)
    		userId = (String) session.getAttribute("userId");
    		if(userId == null) {
    			out.println("<script>");
    			out.println("alert('로그인을 하세요.')");
    			out.println("location.href = login.jsp'");
    			out.println("</script>");
    		}
    		int bbsId = 0;
    		if(request.getParameter("bbsId") != null)
    			bbsId = Integer.parseInt(request.getParameter("bbsId"));
    		if(bbsId == 0) {
    			out.println("<script>");
    			out.println("alert('유효하지 않는 글입니다..')");
    			out.println("location.href = bbs.jsp'");
    			out.println("</script>");
    		}
    		BbsDAO bbsDAO = new BbsDAO();
    		Bbs bbs = bbsDAO.getBbs(bbsId);
    		if(!userId.equals(bbs.getUserId())) {
    			out.println("<script>");
    			out.println("alert('권한이 없습니다.')");
    			out.println("location.href = bbs.jsp'");
    			out.println("</script>");
    		}
    	%>
    	<div class="container pt-3">
    			<form method="post" action="updateAction.jsp?bbsId=<%=bbsId%>">
    				<table class="table table-striped text-center">
    					<thead class="thead-light">
    						<tr>
    							<th>게시판 수정</th>
    						</tr>
    						</thead>
    						<tbody>
    							<tr>
    								<td>
    									<input type="text" class="form-control" placeholder="글 제목"
    									name="bbsTitle" maxlength="50" value="<%=bbs.getBbsTitle() %>"/>
    									</td>
    								</tr>
    								<tr>
    									<td>
    										<textarea class="form-control" placeholder="글 내용" name="bbsContent"
    										maxlength="2048" style="height:350px; resize:none;"><%=bbs.getBbsContent()%></textarea>
    										</td>
    									</tr>
    						</tbody>
    				</table>
    				<a href="bbs.jsp" class="btn btn-success float-left">목록</a>
    				<button type="submit" class="btn btn-primary float-right">글수정</button>
    			</form>
    		</div>
    <!-- Optional JavaScript-->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
   
  </body>
</html>