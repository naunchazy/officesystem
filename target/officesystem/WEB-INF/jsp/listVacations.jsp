<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>休假信息列表</title>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" />
<script>
		window.onload=function(){
			 var tbl = document.getElementById("tbody");
			 var trs = tbl.getElementsByTagName("tr");
			 for (var i = 0; i < trs.length; i++){
				  var j = i + 1;
				  if (j % 2 != 0) { //偶数行
					  trs[i].style.background = "#ccc";
				  }
			}
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
				<div class="t">休假信息列表</div>
				<div class="pages">
					<table width="90%" border="0" cellspacing="0" cellpadding="0"
					style="table-layout: fixed;">
						<thead>
						<tr>
							<th>申请人工号</th>
							<th>申请人姓名</th>
							<th>开始时间</th>
							<th>结束时间</th>
							<th>持续天数</th>
							<th>审批状态</th>
							<th>原&nbsp;因</th>
						</tr>
						</thead>
						<tbody id="tbody">
						<c:forEach items="${myVacations }" var="vacation">
								<tr align="center">
									<!-- 申请人工号 -->
									<td>${vacation.id }</td>
									<!-- 申请人姓名 -->
									<td>${vacation.username }</td>
									<!-- 开始时间 -->
									<td>${vacation.begintime }</td>
									<!-- 结束时间 -->
									<td>${vacation.overtime }</td>
									<!-- 持续天数 -->
									<td>${vacation.days }</td>
									<!-- 审批状态 -->
									<%-- <td>${vacation.ispass==1?"已审核":"未审核" }</td> --%>
									<c:if test="${vacation.ispass==0}">
										<td>未审核</td>
									</c:if>
									<c:if test="${vacation.ispass==1}">
										<td>已审核</td>
									</c:if>
									<c:if test="${vacation.ispass==2}">
										<td>审核拒绝</td>
									</c:if>
									<!-- 原因 -->
									<td style="white-space:nowrap;overflow:hidden;text-overflow: ellipsis;">${vacation.reason }</td>
								</tr>
						</c:forEach>
						</tbody>
						<!-- 按钮 -->
						<tr>
							<td align="left" colspan="5"><br/>
								<input type="button"  id="save" value="申请休假" onclick="location.href='${pageContext.request.contextPath}/vacation/toApplyVacation.do'" />
							</td>
						</tr>

					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- </form> -->
	<div class="copyright">Copyright &nbsp; &copy;版权所有 &nbsp;</div>

</body>
</html>