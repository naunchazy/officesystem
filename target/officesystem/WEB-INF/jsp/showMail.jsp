<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>邮件信息详情</title>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
<script type="text/javascript">
	function downloadfiles(file){
		var filenames = file.split("@");
		for(var i=0;i<filenames.length-1;i++){
			var filename=filenames[i];
			var path="${pageContext.request.contextPath}/mail/toDownload.do?file="+filename;
			window.open(path);
			//location.href="${pageContext.request.contextPath}/mail/toDownload.do?file="+filename;
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
				<div class="t">邮件信息详情</div>
				<div class="pages">
						<table width="90%" border="0" cellspacing="0" cellpadding="0">
							<tr style="display:none">
								<td align="left"><input type="text" name="receiveid" value="${sessionUser.id }"/>
							</tr>
							<tr>
								<td align="right" width="30%">邮件标题：</td>
								<td align="left"><input type="text" value="${mail.title }" readonly="readonly"/></td>
							</tr>
							<tr>
								<td align="right" width="30%">邮件内容：</td>
								<td align="left">
									<textarea rows="10" cols="70" readonly="readonly">${mail.content }</textarea>
								</td>
							</tr>
							<tr>
								<td align="right" width="30%">发信时间：</td>
								<td align="left">
									<input type="text" name="time" value="${mail.time }" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<td align="right" width="30%">来&nbsp;自：</td>
								<td align="left">
									<input type="text" value="${senderName }" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<td align="right" width="30%">附件下载：</td>
								<c:if test="${!empty mail.file}">
									<%-- <td align="left">
										<a href="${pageContext.request.contextPath}/mail/toDownload.do?file=${mail.file}">下载</a>
									</td> --%>
									<td align="left">
										<!-- <a href="javascript:void(0)" onclick="">全部下载</a> -->
										<input type="button" onclick="downloadfiles('${mail.file}')" value="全部下载">&nbsp;&nbsp;
										选择下载：
										<c:forEach items="${filenames}" var="filename" varStatus="vs">
											${vs.count}:<a href="${pageContext.request.contextPath}/mail/toDownload.do?file=${filename}">${filename}</a>&nbsp;
										</c:forEach>
									</td>
								</c:if>
								<c:if test="${empty mail.file}">
									<td align="left">
										无
									</td>
								</c:if>
							</tr>
							<tr>
								<td align="center" colspan="2"><br />
									<c:if test="${mail.isdrop==0 }">
										<input type="button" value="返回" onclick="location.href='${pageContext.request.contextPath}/mail/toReceivedMail.do'"/>
									</c:if>
									<c:if test="${mail.isdrop==1 }">
										<input type="button" value="返回" onclick="location.href='${pageContext.request.contextPath}/mail/todroppedMail.do'"/>
									</c:if>
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