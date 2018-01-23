<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>更新用户信息</title>
<style type="text/css">
    #updateForm label.error {
    margin-left: 2px;
    color:red;
    }
</style>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
<script>
		//更改用户信息时性别信息的回显
		window.onload=function(){
			var gender="${sessionUser.gender}";
			var g=document.getElementById("gender");
			var option_g=g.getElementsByTagName("option");
			for(var i=0;i<option_g.length;i++){
				if(option_g[i].value==gender){
					option_g[i].selected=true;
				}
			}
		}
		$(function() {
			$("#updateForm").validate({
								rules : {
									username : "required",
									phone : {required:true,digits:true,minlength:11}
								},
								messages : {
									username : "* 用户名不能为空",
									phone : {required:"* 电话不能为空",digits:"* 必须为数字",minlength:"* 长度不能小于11"}
								}
							});
		})
</script>
</head>
<body>
	<!-- top.jsp -->
	<jsp:include page="top.jsp"></jsp:include>

	<div class="main">
		<div class="global-width">
		
			<!-- left.jsp -->
			<jsp:include page="left.jsp"></jsp:include>
			
			<div class="action">
				<div class="t">个人信息</div>
				<div class="pages">
					<%-- <form action="${pageContext.request.contextPath}/user/updateUser.do/${id}"> --%>
					<form id="updateForm" action="${pageContext.request.contextPath}/user/updateUser.do">
						<table width="90%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td align="right" width="30%">用户：</td>
								<td align="left">
									<input type="hidden" name="id"
									value="${sessionUser.id}" />
									<input type="text" name="username"
									value="${sessionUser.username}" />
								</td>
							</tr>
							<tr>
								<td align="right" width="30%">年龄：</td>
								<td align="left"><input type="text" name="age"
									value="${sessionUser.age}"/></td>
							</tr>
							<tr>
								<td align="right" width="30%">性别：</td>
								<td align="left">
									<select name="gender" id="gender">
										<!-- <option value="">---请选择---</option> -->
										<option value=0>男</option>
										<option value=1>女</option>
									</select>
								</td>
							</tr>
							<tr>
								<td align="right" width="30%">手机：</td>
								<td align="left">
									<input type="text" name="phone" id="phone"
									value="${sessionUser.phone}" />
								</td>
							</tr>
							<tr>
								<td align="right" width="30%">地址：</td>
								<td align="left"><input type="text" name="address"
									value="${sessionUser.address}" /></td>
							</tr>
							<tr>
								<%-- <td align="center" colspan="2"><br/><input type="button"  id="save" value="编辑数据" onclick="setit(${sessionUser.id})" /></td> --%>
								<td align="center" colspan="2"><br />
									<input type="submit" value="确认更改" />
									<button type="button" onclick="location.href='${pageContext.request.contextPath}/user/toindex.do'">
									返回</button>
								</td>
							</tr>

						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- </form> -->
	<div class="copyright">Copyright &nbsp; &copy;版权所有 &nbsp;</div>

</body>
</html>