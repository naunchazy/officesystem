<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script>
		function toUpdateUser(){
			location.href="${pageContext.request.contextPath}/user/toUpdateUser.do";
		}
	</script>
</head>
<body>
	<div class="main">
		<div class="global-width">

			<!-- left.jsp -->
			<jsp:include page="left.jsp"></jsp:include>

			<div class="action">
				<div class="t">个人信息</div>
				<div class="pages">
					<table width="90%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td align="right" width="30%">用户名：</td>
							<td align="left"><input type="text" name="username"
								value="${sessionUser.username}" readonly="readonly"/>
							</td>
						</tr>
						<tr>
							<td align="right" width="30%">年&nbsp;龄：</td>
							<td align="left"><input type="text" name="age"
								value="${sessionUser.age}" readonly="readonly"/>
							</td>
						</tr>
						<tr>
							<td align="right" width="30%">性&nbsp;别：</td>
							<td align="left">
								<c:if test="${sessionUser.gender==0}">
									<input type="text" name="gender" id="gender" value="男"
										readonly="readonly" />
								</c:if> 
								<c:if test="${sessionUser.gender==1}">
									<input type="text" name="gender" id="gender" value="女"
										readonly="readonly" />
								</c:if>
							</td>
						</tr>
						<tr>
							<td align="right" width="30%">手&nbsp;机：</td>
							<td align="left"><input type="text" name="u.mobile"
								value="${sessionUser.phone}" readonly="readonly"/>
							</td>
						</tr>
						<tr>
							<td align="right" width="30%">地&nbsp;址：</td>
							<td align="left"><input type="text" name="address"
								value="${sessionUser.address}" readonly="readonly"/>
							</td>
						</tr>
						<tr>
							<td align="center" colspan="2"><br />
								<input type="button" value="编辑数据" onclick="toUpdateUser()" />
							</td>
						</tr>

					</table>

				</div>
			</div>
		</div>
	</div>
</body>
</html>