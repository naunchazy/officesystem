<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>写邮件</title>
<style type="text/css">
    #mailForm label.error {
    margin-left: 2px;
    color:red;
    }
</style>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
<script type="text/javascript">
/* function confirmsend()
{
    var result=confirm("确定发送？");
    if(result){
    	document.forms[0].submit(); 
    	alert("邮件发送成功！");
    }
} */
/* window.onload=function(){
	if("${message}"!=null){
		alert("${message}");
	}
} */
$(function() {
		$("#mailForm").validate({
							rules : {
								receiveid : "required",
								title : "required"
							},
							messages : {
								receiveid : "* 收件人不能为空",
								title : "* 标题不能为空"
							}
						});
		var max_size = 9437184;
		$("#file").change(function(evt) {
			var finput = $(this);
			var files = evt.target.files;
			var output = [];
			for (var i = 0, f; f = files[i]; i++) {
				if (f.size > max_size) {
					/* alert("上传文件不能超过9M"); */
					$("#filetip").html("* 上传文件不能超过9M");
					$(this).val('');
				}else{
					$("#filetip").html("");
				}
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
				<div class="t">写邮件</div>
				<div class="pages">
					<%-- <font id="message" style="hidden">${message}</font> --%>
					<form id="mailForm" method="post" enctype="multipart/form-data"
					action="${pageContext.request.contextPath}/mail/writeMail.do">
						<table width="90%" border="0" cellspacing="0" cellpadding="0">
							<tr style="display:none">
								<td align="left"><input type="text" name="sendid" value="${sessionUser.id }"/>
							</tr>
							<tr>
								<td align="right" width="30%">收件人：</td>
								<td align="left">
									<select name="receiveid" id="receiveid">
										<option value="">---选择收件人---</option>
										<c:forEach items="${listUsers }" var="user">
											<option value="${user.id }">${user.username }</option>
										</c:forEach>
									</select>
									<font id="receivetip" color="red"></font>
								</td>
							</tr>
							<tr>
								<td align="right" width="30%">邮件标题：</td>
								<td align="left"><input type="text" name="title"/></td>
							</tr>
							<tr>
								<td align="right" width="30%">邮件内容：</td>
								<td align="left">
									<textarea name="content" rows="10" cols="70"></textarea>
								</td>
							</tr>
							<tr>
								<td align="right" width="30%">上传附件：</td>
								<td align="left">
									<input type="file" name="file" id="file" multiple/>
									<font id="filetip" color="red"></font>
								</td>
							</tr>
							<tr>
								<%-- <td align="center" colspan="2"><br/><input type="button"  id="save" value="编辑数据" onclick="setit(${sessionUser.id})" /></td> --%>
								<td align="center" colspan="2"><br />
									<input type="submit" value="发送邮件"/>
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