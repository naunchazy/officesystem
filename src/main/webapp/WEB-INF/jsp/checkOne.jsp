<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>休假审核</title>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
<script>
	//审核通过
	function submit1(){
		document.getElementById("checkForm").action = "${pageContext.request.contextPath}/vacation/checkOneYes";
	    document.getElementById("checkForm").submit();
	}
	//审核不通过
	function submit2(){
		document.getElementById("checkForm").action = "${pageContext.request.contextPath}/vacation/checkOneNo";
	    document.getElementById("checkForm").submit();
	}
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
				<div class="t">休假审核</div>
				<div class="pages">
					<form id="checkForm" method="post">
						<table width="90%" border="0" cellspacing="0" cellpadding="0">
							<tr style="display:none">
								<td align="left"><input type="text" name="id" value="${vacation.id }"/>
							</tr>
							<tr>
								<td align="right" width="30%">姓&nbsp;名：</td>
								<td align="left">
									<input type="text" name="username" size="15px"
									value="${vacation.username }" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<td align="right" width="30%">开始时间：</td>
								<td align="left"><input type="text" value="${vacation.begintime }"
								name="begintime" readonly="readonly" size="15px"/></td>
							</tr>
							<tr>
								<td align="right" width="30%">结束时间：</td>
								<td align="left"><input type="text" value="${vacation.overtime }"
								name="overtime" readonly="readonly" size="15px"/></td>
							</tr>
							<tr>
								<td align="right" width="30%">请假天数：</td>
								<td align="left">
									<input type="text" value="${vacation.days }" name="days" size="15px" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<td align="right" width="30%">请假原因：</td>
								<td align="left">
									<textarea name="reason" rows="10" cols="50" readonly="readonly">${vacation.reason }</textarea>
								</td>
							</tr>
							<tr>
								<td align="right" width="30%">审批人：</td>
								<td align="left">
									<input type="hidden" name="approverid" value="${sessionUser.id }"/>
									<input type="text" value="${sessionUser.username }" size="15px" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<td align="center" colspan="2"><br />
									<input type="button" onclick="submit1()" value="审核通过">&nbsp;&nbsp;
									<input type="button" onclick="submit2()" value="审核不通过">&nbsp;&nbsp;
									<input type="button" onclick="location.href='${pageContext.request.contextPath}/vacation/toCheckVacation.do'" value="返&nbsp;&nbsp;回">
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