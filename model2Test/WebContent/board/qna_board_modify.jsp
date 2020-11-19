<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*, java.util.*, java.text.SimpleDateFormat" %>
<%
	BoardBean article = (BoardBean) request.getAttribute("article");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC게시판</title>
<script>
	function modifyboard() {
		modifyform.submit();
	}
</script>
<style>
	#registForm {
		width: 500px;
		height: 610px;
		border: 1px solid red;
		margin: auto;
	}
	h2 {
		text-align: center;
	}
	table {
		margin: auto;
		width: 450px;
	}
	.td_left {
		width: 150px;
		background: orange;
	}
	.td_right {
		width: 300px;
		background: skyblue;
	}
	#commandCell {
		text-align: center;
	}
</style>
</head>
<body>
	<!-- 게시판 등록 -->
	<section id="writeForm">
		<h2>게시판 글 수정</h2>
		<form action="boardModifyPro.do" method="post" name="modifyform">
		<input type="hidden" name="BOARD_NUM" value="<%=article.getBOARD_NUM() %>" />
		<input type="hidden" name="page" value="<%=request.getParameter("page") %>" />
			<table>
				<tr>
					<td class="td_left"><label for="BOARD_NAME">글쓴이</label></td>
					<td class="td_right"><input type="text" name="BOARD_NAME" id="BOARD_NAME" value="<%=article.getBOARD_NAME() %>"></td>
					</tr>
					<tr>
						<td class="td_left"><label for="BOARD_PASS">비밀번호</label></td>
						<td class="td_right"><input name="BOARD_PASS" type="password" id="BOARD_PASS"></td>
					</tr>
					<tr>
						<td class="td_left"><label for="BOARD_SUBJECT">제목</label></td>
						<td class="td_right"><input name="BOARD_SUBJECT" type="text" id="BOARD_SUBJECT" value="<%=article.getBOARD_CONTENT() %>" /></td>
					</tr>
					<tr>
						<td class="td_left"><label for="BOARD_CONTENT">내용</label></td>
						<td><textarea id="BOARD_CONTENT" name="BOARD_CONTENT" cols="40" rows="15"><%=article.getBOARD_CONTENT() %></textarea></td>
					</tr>
			</table>
			<section id="commandCell">
				<a href="javascript:modifyboard()">[수정]</a>&nbsp;&nbsp;
				<a href="javascript:history.go(-1)">[뒤로]</a>
			</section>
		</form>
	</section>
	<!-- 게시판 등록 -->
</body>
</html>