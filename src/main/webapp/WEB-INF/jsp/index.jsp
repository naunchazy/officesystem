<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>办公自动化管理系统</title>
		<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		
	</head>
	
	<body>
	
		<!-- top.jsp -->
		<jsp:include page="top.jsp"></jsp:include>
		
		<!-- <form id="myForm" name="myForm" action="user/toEditUserInfo.do" method="post"> -->
		<input type="hidden" name="u.id" value="26"/>
		<input type="hidden" name="u.sex" value="2" id="u_sex"/>
		<input type="hidden" name="u.supper" value="0" id="u_supper"/>
		
		<!-- middle.jsp -->
		<jsp:include page="middle.jsp"></jsp:include>
		
		<!-- </form> -->
		<div class="copyright">
			Copyright &nbsp; &copy;版权所有 &nbsp; 
		</div>
 
	</body>
</html>