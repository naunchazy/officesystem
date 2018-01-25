<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人账户</title>
<style type="text/css">
    #saveForm label.error {
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
			$("#saveForm").validate({
								rules : {
									username : "required",
									password : "required",
									repeatpwd: {equalTo:$("input[name='password']")}
								},
								messages : {
									username : " * 用户不能为空",
									password : " * 密码不能为空",/* required:true,required:"* 确认密码不能为空", */
									repeatpwd: {equalTo:" * 两次密码不一致"}
								},
								submitHandler : function() {
									alert("数据更新成功!"); //提示
									form.submit();
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
				<div class="t">个人账户</div>
				<div class="pages">
					<form id="saveForm" action="${pageContext.request.contextPath}/user/updateSingleAccount.do">
						<table width="90%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td align="right" width="30%">用户名：</td>
								<td align="left">
									<input type="hidden" name="id"
									value="${sessionUser.id}" />
									<input type="text" name="username"
									value="${sessionUser.username}" /><font color="red"> *</font>
								</td>
							</tr>
							<tr>
								<td align="right" width="30%">密&nbsp;&nbsp;码：</td>
								<td align="left"><input type="password" name="password"/><font color="red"> *</font>
								</td>
							</tr>
							<tr>
								<td align="right" width="30%">确认密码：</td>
								<td align="left"><input type="password" name="repeatpwd"/><font color="red"> *</font>
								</td>
							</tr>
							<tr>
								<%-- <td align="center" colspan="2"><br/><input type="button"  id="save" value="编辑数据" onclick="setit(${sessionUser.id})" /></td> --%>
								<td align="center" colspan="2"><br />
									<input type="submit" value="保存数据" />
									<button type="button" onclick="location.href='${pageContext.request.contextPath}/user/toSingleAccount.do'">
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