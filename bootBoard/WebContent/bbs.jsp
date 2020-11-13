<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.util.Vector"%>
<%
	String id = (String) session.getAttribute("userId");
	String opt = "";
		if (id == null) {
			opt = " disabled";
}
%>
<!doctype html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" />

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
				<li class="nav-item"><a class="nav-link" href="main.jsp">메인</a>
				</li>
				<li class="nav-item"><a class="nav-link active" href="bbs.jsp">게시판<span
						class="sr-only">(current)</span></a></li>
			</ul>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">접속하기</a>
					<div class="dropdown-menu" aria-labelledby="navDropdown">
						<%
							if (id == null) {
						%>
						<a class="dropdown-item" href="login.jsp"> 로그인 </a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="join.jsp">회원가입</a>
						<%
							} else {
						%>
						<a class="dropdown-item" href="logoutAction.jsp">로그아웃</a>
						<%
							}
						%>
					</div></li>
			</ul>
		</div>
	</nav>
	<div class="container pt-3">
		<table class="table table-striped text-center">
			<thead class="thead-light">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<%
					int pageNumber = 1;
				if (request.getParameter("pageNumber") != null) {
					pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
				}
				BbsDAO bbsDAO = new BbsDAO();
				Vector<Bbs> list = bbsDAO.getList(pageNumber);
				for (int i = 0; i < list.size(); i++) {
				%>
				<tr>
					<td><%=list.get(i).getBbsId()%></td>
					<td><a href="view.jsp?bbsId=<%=list.get(i).getBbsId()%>">
							<%=list.get(i).getBbsTitle()%>
					</a></td>
					<td><%=list.get(i).getUserId()%></td>
					<td><%=list.get(i).getBbsDate()%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	<%
		String optPb = "";
		String optPp = "";
		String optNb = "";
		String optNp = "";
		if(pageNumber <= 1) {
			optPp = " disabled";
		}
		if(pageNumber <= bbsDAO.getWidthBlock()) {
			optPb = " disabled";
		}
		if(pageNumber >= bbsDAO.totalPage()) {
			optNb = " disabled";
		}
		if(pageNumber > bbsDAO.totalPage() - bbsDAO.getWidthBlock()) {
			optNb = " disabled";
		}
	%>
		
		<nav aria-label="Page navigation">
  <ul class="pagination justify-content-center">
    <li class="page-item<%=optPb %>" id="prevBlock">
      <a class="page-link" aria-label="PreviousBlock"
      href="bbs.jsp?pageNumber=<%=pageNumber - bbsDAO.getWidthBlock() %>">
      <span aria-hidden="true">«</span>
      <span class="sr-only">Previous Block</span>
      </a>
    </li>
     <li class="page-item<%=optPp %>" id="prevPage">
      <a class="page-link" href="bbs.jsp?pageNumber=<%=pageNumber -1%>"
      aria-label="PreviousPage">
      	<span aria-hidden="true">‹</span>
      	<span class="sr-only">Previous Page</span>
      </a>
    </li>
   <%
   	String opt1 = "";
   	String opt2 = "";
   	int loopNum = bbsDAO.getWidthBlock();
   	if (bbsDAO.totalBlock() == bbsDAO.currentBlock(pageNumber)) {
   		loopNum = bbsDAO.totalPage() - bbsDAO.getWidthBlock() * (bbsDAO.totalBlock() -1);
   	}
   	for (int i = 0; i < loopNum; i++) {
   		int now = (i + 1) + (bbsDAO.currentBlock(pageNumber) -1) * bbsDAO.getWidthBlock();
   	 	if(now == pageNumber) {
   	 		opt1 = "active"; 
   	 		opt2 = "disabled"; 
   	 	}
   	 %>
   		<li class="page-item<%=opt1 %>">
   			<a class="page-link<%=opt2 %>" href="bbs.jsp?pageNumber=<%=now %>">
   			<%=now %>
   				</a>
   			</li>
   	<%
   		opt1= opt2 = "";
 	}
   	%>
  
    <li class="page-item<%=optNp %>" id="nextPage">
      <a class="page-link"  aria-label="NextPage"
       href="bbs.jsp?pageNumber=<%=pageNumber + 1%>">
      	<span aria-hidden="true">›</span>
      	<span class="sr-only">Next Page</span>
      </a>
    </li>
    <li class="page-item<%=optNb %>" id="nextBlock">
      <a class="page-link" aria-label="NextBlock"
      href="bbs.jsp?pageNumber=<%=pageNumber + bbsDAO.getWidthBlock() %>">
      <span aria-hidden="true">»</span>
      	<span class="sr-only">Next Block</span>
      </a>
    </li>
  </ul>
</nav>
		<a href="write.jsp" class="btn btn-primary float-right<%=opt%>" id="writeBtn">글쓰기</a>

	</div>
	<%
			bbsDAO.connClose();
	%>
	<!-- Optional JavaScript-->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>

</body>
</html>