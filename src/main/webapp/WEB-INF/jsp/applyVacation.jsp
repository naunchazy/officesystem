<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>申请休假</title>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
<script type="text/javascript">
	/* window.onload=function(){
		var a=$("#begintime").attr("value");
		alert(typeof(a));
	} */
	function countDays(){
		var begintimeS=document.getElementById("begintime");
		var overtimeS=document.getElementById("overtime");
		var days=document.getElementById("days");
		var begintime=Date.parse(begintimeS.value);
		var overtime=Date.parse(overtimeS.value);
		var time=Math.abs(begintime-overtime)/(1000*60*60*24);
		if(isNaN(time)){
			days.value=0;
		}else{
			days.value=time;
		}
	}
	$(function() {
		$("#vacationForm").validate({
							rules : {
								begintime : "required",
								overtime : "required",
								days : "",
								approverid : "required",
								file : {/* digits:true,minlength:11 */}
							},
							messages : {
								begintime : "* 开始时间不能为空",
								overtime : "* 结束时间不能为空",
								days : "",
								approverid : "* 请选择审批人",
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
				<div class="t">申请休假</div>
				<div class="pages">
					<form id="vacationForm" action="${pageContext.request.contextPath}/vacation/applyVacation.do">
						<table width="90%" border="0" cellspacing="0" cellpadding="0">
							<tr style="display:none">
								<td align="left"><input type="text" name="id" value="${sessionUser.id }"/>
							</tr>
							<tr>
								<td align="right" width="30%">姓&nbsp;名：</td>
								<td align="left">
									<input type="text" name="username" size="15px"
									value="${sessionUser.username }" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<td align="right" width="30%">开始时间：</td>
								<td align="left"><input type="date" onchange="countDays()"
								id="begintime" name="begintime"/></td>
							</tr>
							<tr>
								<td align="right" width="30%">结束时间：</td>
								<td align="left"><input type="date" onchange="countDays()"
								id="overtime" name="overtime"/></td>
							</tr>
							<tr>
								<td align="right" width="30%">请假天数：</td>
								<td align="left">
									<input type="text" id="days" name="days" size="15px" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<td align="right" width="30%">请假原因：</td>
								<td align="left">
									<textarea name="reason" rows="10" cols="50"></textarea>
								</td>
							</tr>
							<tr>
								<td align="right" width="30%">审批人：</td>
								<td align="left">
									<select name="approverid" >
										<option value="">---选择审批人---</option>
										<c:forEach items="${listAdmins }" var="admin">
											<option value="${admin.id }">${admin.username }</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<%-- <td align="center" colspan="2"><br/><input type="button"  id="save" value="编辑数据" onclick="setit(${sessionUser.id})" /></td> --%>
								<td align="center" colspan="2"><br />
									<input type="submit" value="提交申请" />&nbsp;&nbsp;
									<input type="button" value="返&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;回"
									onclick="location.href='${pageContext.request.contextPath}/vacation/toListVacations.do'">
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