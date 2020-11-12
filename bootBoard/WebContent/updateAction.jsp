<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="javax.naming.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 데이터 처리</title>
</head>
<body>
<%
	String  userId = (String)session.getAttribute("userId");
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
	int result = bbsDAO.update(bbsId, request.getParameter("bbsTitle"), request.getParameter("bbsContent"));
	bbsDAO.connClose();
	if(result == -1) {
		out.println("<script>");
		out.println("alert('글수정에 실패하였습니다.')");
		out.println("history.back()");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("location.href='bbs.jsp'");
		out.println("</script>");
	}
%>
</body>
</html>