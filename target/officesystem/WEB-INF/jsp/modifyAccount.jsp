<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改账户信息</title>
<style type="text/css">
    #modifyForm label.error {
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
			var gender="${account.gender}";
			var g=document.getElementById("gender");
			var option_g=g.getElementsByTagName("option");
			for(var i=0;i<option_g.length;i++){
				if(option_g[i].value==gender){
					option_g[i].selected=true;
				}
			}
		}
		$(function() {
			$("#modifyForm").validate({
				rules : {
					username : "required",
					password : "required",
					age : {digits:true},
					phone : {required:true,digits:true,minlength:11}
				},
				messages : {
					username : "* 用户不能为空",
					password : "* 密码不能为空",
					age : {digits:"* 必须为数字"},
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
				<div class="t">修改账户信息</div>
				<div class="pages">
					<form id="modifyForm" action="${pageContext.request.contextPath}/user/modifyAccount.do">
						<table width="90%" border="0" cellspacing="0" cellpadding="0">
							<tr style="display:none">
								<td align="right" width="30%">工号：</td>
								<td align="left">
									<input type="text" name="id" id="myid" 
									value="${account.id }" />
									<!-- <span id="idspan"></span><b><font color="red" id="mess"></font></b> -->
								</td>
							</tr>
							<tr>
								<td align="right" width="30%">用户名：</td>
								<td align="left">
									<input type="text" name="username" 
									value="${account.username }" />
								</td>
							</tr>
							<tr>
								<td align="right" width="30%">密&nbsp;码：</td>
								<td align="left">
									<input type="password" name="password" 
									value="${account.password }" />
								</td>
							</tr>
							<tr>
								<td align="right" width="30%">年龄：</td>
								<td align="left">
									<input type="text" name="age" 
									value="${account.age }" />
								</td>
							</tr>
							<tr>
								<td align="right" width="30%">性别：</td>
								<td align="left">
									<select name="gender" id="gender">
										<option value=0 >男</option>
										<option value=1 >女</option>
									</select>
								</td>
							</tr>
							<tr>
								<td align="right" width="30%">手机：</td>
								<td align="left">
									<input type="text" name="phone" 
									value="${account.phone }" />
								</td>
							</tr>
							<tr>
								<td align="right" width="30%">地址：</td>
								<td align="left">
									<input type="text" name="address" 
									value="${account.address }" />
								</td>
							</tr>
							<tr>
								<td align="center" colspan="2"><br />
									<input type="submit" value="保存数据" />
									<button type="button" onclick="location.href='${pageContext.request.contextPath}/user/toManageAccount.do'">
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