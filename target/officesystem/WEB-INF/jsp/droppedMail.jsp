<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>垃圾信息列表</title>
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

		function deleteAccount(id){
			var form=document.getElementById("deleteAccount"+id);
			form.submit();
		}
		function unDropMail(sendid,time){
			var result=confirm("确实还原此邮件？")
			if(result){
				location.href="${pageContext.request.contextPath}/mail/unDropMail?sendid="+sendid+"&time="+time;
			}
		}
		function deleteMail(sendid,time){
			var result=confirm("确实永久删除此邮件？")
			if(result){
				location.href="${pageContext.request.contextPath}/mail/deleteMail?sendid="+sendid+"&time="+time;
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
				<div class="t">垃圾信息列表</div>
				<div class="pages">
					<table width="90%" border="0" cellspacing="0" cellpadding="0" style="table-layout: fixed;">
						<thead>
						<tr>
							<!-- <th>发件人</th> -->
							<th>邮件标题</th>
							<th>邮件内容</th>
							<th>是否已读</th>
							<th>时&nbsp;间</th>
							<th>操&nbsp;作</th>
						</tr>
						</thead>
						<tbody id="tbody">
						<c:forEach items="${listMails }" var="mail">
								<tr align="center">
									<!-- 邮件标题 -->
									<td><a 
									href="${pageContext.request.contextPath}/mail/toShowMail?time=${mail.time}&sendid=${mail.sendid}">
									${mail.title }</a></td>
									<!-- 邮件内容 -->
									<td style="white-space:nowrap;overflow:hidden;text-overflow: ellipsis;">${mail.content }</td>
									<!-- 是否已读 -->
									<td>${mail.isread==0?"未读":"已读" }</td>
									<!-- 时间 -->
									<td>${mail.time }</td>
									<!-- 操作:还原、删除 -->
									<td>
										<a href="javascript:void(0)" onclick="unDropMail('${mail.sendid}','${mail.time}')">还原</a>
										<label>|</label>
										<a href="javascript:void(0)" onclick="deleteMail('${mail.sendid}','${mail.time}')">删除</a>
									</td>
								</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- </form> -->
	<div class="copyright">Copyright &nbsp; &copy;版权所有 &nbsp;</div>

</body>
</html>