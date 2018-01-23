<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>申请休假</title>
<style type="text/css">
    #vacationForm label.error {
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
	function countDays(){
		var nowtimeS=new Date().toLocaleDateString();/* 获得当前日期字符串 */
		var todaytime=Date.parse(nowtimeS);/* 将当前日期字符串转为毫秒数 */
		var begintimeS=document.getElementById("begintime");
		var overtimeS=document.getElementById("overtime");
		var begintime=Date.parse(begintimeS.value);//得到的begintimeS.value为String类型的，Date.parse能转化为毫秒数
		var overtime=Date.parse(overtimeS.value);
		var days=document.getElementById("days");
		var begintip=document.getElementById("begintip");
		var overtip=document.getElementById("overtip");
		if(begintime>=todaytime){
			begintip.innerHTML="";
			if(begintime<=overtime){
				overtip.innerHTML="";
				var time=1+Math.abs(begintime-overtime)/(1000*60*60*24);
				days.value=time;
			}else if(begintime>overtime){
				overtip.innerHTML="* 结束日期早于开始日期";
				days.value='';
			}
		}else{
			overtip.innerHTML="";
			begintip.innerHTML="* 日期已过期";
			days.value='';
		}
		
	}
	$(function() {
		$("#vacationForm").validate({
							rules : {
								begintime : "required",
								overtime : "required",
								days:"required",
								approverid : "required"
							},
							messages : {
								begintime : "* 开始时间不能为空",
								overtime : "* 结束时间不能为空",
								days:"",//时间无效时，逻辑控制请假天数也不能计算出来，由逻辑控制中给出相应提示。同时这边不让表单提交
								approverid : "* 请选择审批人"
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
								id="begintime" name="begintime"/>
								<span id="begintip" style="color:red"></span>
								</td>
							</tr>
							<tr>
								<td align="right" width="30%">结束时间：</td>
								<td align="left"><input type="date" onchange="countDays()"
								id="overtime" name="overtime"/><span id="overtip" style="color:red"></span>
								</td>
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