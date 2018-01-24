<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人账户</title>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" />
</head>
<body>
	<!-- top.jsp -->
	<jsp:include page="top.jsp"></jsp:include>

	<div class="main">
		<div class="global-width">
		
			<!-- left.jsp -->
			<jsp:include page="left.jsp"></jsp:include>
			
			<div class="action">
				<div class="t">个人账户</div>
				<div class="pages">
					<%-- <form id="saveForm" action="${pageContext.request.contextPath}/user/saveSingleAccount.do"> --%>
						<table width="90%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td align="right" width="30%">用户名：</td>
								<td align="left">
									<input type="hidden" name="id"
									value="${sessionUser.id}" />
									<input type="text" name="username"
									value="${sessionUser.username}" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<td align="right" width="30%">密&nbsp;码：</td>
								<td align="left"><input type="password" name="password"
									value="${sessionUser.password}" readonly="readonly"/></td>
							</tr>
							<tr>
								<td align="center" colspan="2"><br/>
									<input type="button"  id="save" value="编辑数据" onclick="location.href='${pageContext.request.contextPath}/user/toUpdateSingleAccount.do'" />
								</td>
							</tr>

						</table>
					<!-- </form> -->
				</div>
			</div>
		</div>
	</div>
	<!-- </form> -->
	<div class="copyright">Copyright &nbsp; &copy;版权所有 &nbsp;</div>

</body>
</html>