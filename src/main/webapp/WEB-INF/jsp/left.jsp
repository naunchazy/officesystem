<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>办公自动化管理系统</title>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%-- <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>办公自动化管理系统</title>
		<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
	</head>
  
  <body> --%>
    <div class="nav" id="nav">
		<div class="t"></div>
			<dl>
				<dt onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
					信息管理 
				</dt>
				<dd>
					<a href="${pageContext.request.contextPath }/user/toindex.do" target="_self">个人信息</a>
				</dd>
			</dl>
			<dl>
				<dt onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
					邮件管理
				</dt>
				<dd>
					<a href="${pageContext.request.contextPath }/mail/toWriteMail.do" target="_self">写邮件</a>
				</dd>
				<dd>
					<a href="${pageContext.request.contextPath }/mail/toReceivedMail.do" target="_self">收邮件</a>
				</dd>
				<dd>
					<a href="${pageContext.request.contextPath }/mail/todroppedMail.do" target="_self">垃圾邮件</a>
				</dd>
			</dl>
			<dl>
				<dt onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
					考勤管理
				</dt>
				<dd>
					<a href="leave.action" target="_self">休假</a>
				</dd>
			</dl>
					
			<dl >
				<dt onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
					权限管理
				</dt>
				<dd>
					<a href="${pageContext.request.contextPath }/user/toSingleAccount.do" target="_self">个人账户</a>
				</dd>
				<c:if test="${sessionUser.isadmin==1}">
					<dd>
						<a href="${pageContext.request.contextPath }/user/toManageAccount.do" target="_self">管理账户</a>
					</dd>
				</c:if>
			</dl>
		</div>
<!--   </body>
</html> -->
</body>
</html>