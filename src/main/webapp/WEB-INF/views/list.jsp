<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
#cloth {
	float: left;
	width: 25%;
	height: 350px;
}

#h2 {
	text-align: center;
}

hr {
	margin-right: 150px;
}

#img {
	margin-right: 5px;
}

#img2 {
	width: 310px;
}

#box-footer {
	clear: both;
}
</style>
</head>
<body>
	<h1>list.jsp</h1>

	<%-- <%-- <c:forEach items="${list}" var="Room_infoVo">
		<img alt="" src="../image/${Room_infoVo.rprofile }.jpg">
	</c:forEach> --%>
	<div>
		<c:forEach var="Room_infoVo" items="${list}">
			<div id="cloth">
				<div id="img">
					<img id="img2" alt="" src="/image/${Room_infoVo.rprofile}.jpg">
				</div>
			</div>
		</c:forEach>
	</div>

	<div class="box-footer" style="clear: both;">
		<div class="text-center">
			<ul class="pagination">

				<c:if test="${pageMaker.prev}">
					<li><a
						href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
				</c:if>

				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="idx">
					<li
						<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
						<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
					</li>
				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a
						href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
				</c:if>

			</ul>
		</div>
	</div>
</body>
</html>