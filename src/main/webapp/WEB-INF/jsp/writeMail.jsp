<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>写邮件</title>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
<script type="text/javascript">
	$(function() {
		$("#mailForm").validate({
							rules : {
								/* receiveid : "required",*/ 
								title : "required",
								file : {/* digits:true,minlength:11 */}
							},
							messages : {
								/* receiveid : "* 收件人不能为空", */
								title : "* 标题不能为空",
								file : {/* digits:"* 删除更换附件不能大于9M",minlength:"* 长度不能小于11" */}
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
					<form id="mailForm" method="post" enctype="multipart/form-data"
					action="${pageContext.request.contextPath}/mail/writeMail.do">
						<table width="90%" border="0" cellspacing="0" cellpadding="0">
							<tr style="display:none">
								<td align="left"><input type="text" name="sendid" value="${sessionUser.id }"/>
							</tr>
							<tr>
								<td align="right" width="30%">收件人：</td>
								<td align="left">
									<select name="receiveid" >
										<option value="">---选择收件人---</option>
										<c:forEach items="${listUsers }" var="user">
											<option value="${user.id }">${user.username }</option>
										</c:forEach>
									</select>
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
									<input type="file" name="file"/>
								</td>
							</tr>
							<tr>
								<%-- <td align="center" colspan="2"><br/><input type="button"  id="save" value="编辑数据" onclick="setit(${sessionUser.id})" /></td> --%>
								<td align="center" colspan="2"><br />
									<input type="submit" value="发送邮件" />
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