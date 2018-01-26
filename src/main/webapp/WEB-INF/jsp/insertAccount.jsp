<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加账号</title>
<style type="text/css">
#saveForm label.error {
	margin-left: 2px;
	color: red;
}
</style>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
</head>

<body>
	<!-- top.jsp -->
	<jsp:include page="top.jsp"></jsp:include>

	<div class="main">
		<div class="global-width">

			<!-- left.jsp -->
			<jsp:include page="left.jsp"></jsp:include>

			<div class="action">
				<div class="t">添加账号</div>
				<div class="pages">
					<form id="saveForm"
						action="${pageContext.request.contextPath}/user/insertAccount.do"
						method="post">
						<!-- <form id="saveForm" > -->
						<table width="90%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td align="right" width="30%">工&nbsp;号：</td>
								<td align="left"><input type="text" name="id" id="myid" /><font
									id="idspan" color="red"></font> <b><font color="red"
										id="mess"></font></b><font color="red"> *</font></td>
							</tr>
							<tr>
								<td align="right" width="30%">用户名：</td>
								<td align="left"><input type="text" name="username" /><font
									color="red"> *</font></td>
							</tr>
							<tr>
								<td align="right" width="30%">密&nbsp;码：</td>
								<td align="left"><input type="password" name="password" /><font
									color="red"> *</font></td>
							</tr>
							<tr>
								<td align="right" width="30%">年&nbsp;龄：</td>
								<td align="left"><input type="text" name="age" /></td>
							</tr>
							<tr>
								<td align="right" width="30%">性&nbsp;别：</td>
								<td align="left"><select name="gender">
										<option value="">---请选择---</option>
										<option value=0>男</option>
										<option value=1>女</option>
								</select></td>
							</tr>
							<tr>
								<td align="right" width="30%">手&nbsp;机：</td>
								<td align="left"><input type="text" name="phone" /><font
									color="red"> *</font></td>
							</tr>
							<tr>
								<td align="right" width="30%">地&nbsp;址：</td>
								<td align="left"><input type="text" name="address" /></td>
							</tr>
							<tr>
								<td align="center" colspan="2"><br /> <input id="save"
									type="button" onclick="mySubmit()" value="保存数据" />
									<button type="button"
										onclick="location.href='${pageContext.request.contextPath}/user/toManageAccount.do'">
										返回</button></td>
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
<script type="text/javascript">
	var flag = false;
	$(function() {

		$("#saveForm").validate({
			rules : {
				/* id : "required", */
				username : "required",
				password : "required",
				age : {
					digits : true
				},
				phone : {
					required : true,
					digits : true,
					minlength : 11
				}
			},
			messages : {
				/* id : " * 工号不能为空", */
				username : " * 用户名不能为空",
				password : " * 密码不能为空",
				age : {
					digits : " * 必须为数字"
				},
				phone : {
					required : " * 电话不能为空",
					digits : " * 必须为数字",
					minlength : " * 长度不能小于11"
				}
			}/* ,
			success:function(){
				demo=$("#validateForm").valid();
			} */
		/* ,
			submitHandler : function(){
				//提交Ajax
				$.ajax({
					data : $("#saveForm").serialize(),
					dataType : "text",
					type : "post",
					url : "${pageContext.request.contextPath}/user/insertAccount.do",
					success : function(rec) {
						if(rec=="1"){
							$("#mess").html(" * id已被注册");
						}else{
							alert("添加用户成功！");
							location.href = "${pageContext.request.contextPath}/user/toManageAccount.do"
						}	
					}
				}); 
			} */
		});
		//在工号填写处，当鼠标失去焦点时就会验证工号是否已存在
		$("#myid").blur(function() {
			$.post("${pageContext.request.contextPath}/user/checkId.do", {
				"id" : this.value
			},
			function(data) {
				if (data == "0") {
					$("#idspan").html(" *");
					$("#idspan").html(" * 工号可以使用");
					flag = false;
				} else if(data == "1") {
					$("#idspan").html(" *");
					$("#idspan").html(" * 工号已被注册");
					flag = true;
				}else{
					$("#idspan").html(" *");
					$("#idspan").html(" * 工号不能为空");
					flag = true;
				}
			},
			"text"
			);
		});
		/* $('#save').click(function(){
		    if(flag && ($("#saveForm").validate)){  
		    	alert("添加用户成功！");
		        $('#saveForm').submit();  
		    } 
		}); */
	})

	function mySubmit() {
		if (flag && $("#saveForm").valid()) {
			alert("添加用户成功！");
			$('#saveForm').submit();
		}
	}
</script>
</html>