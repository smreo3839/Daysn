<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style type="text/css">
#cloth {
	float: left;
	width: 30%;
	height: 350px;
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
<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script>
	$(document).ready(
			function() {
				$('#searchBtn').on(
						"click",
						function(event) {
							self.location = "list"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();

						});
			});
</script>
</head>

<body>
	<h1>스터디룸 리스트</h1>
	<div>

		<select name="searchType">
			<option value="n"
				<c:out value="${cri.searchType == null?'selected':''}"/>>
				---</option>
			<option value="t"
				<c:out value="${cri.searchType eq 't'?'selected':''}"/>>지역</option>
		</select> <input type="text" name='keyword' id="keywordInput"
			value='${cri.keyword }'>
		<button id='searchBtn'>Search</button>

	</div>
	<div>
		<c:forEach var="Room_infoVo" items="${list}">
			<div id="cloth">
				<div id="img">
					<img id="img2" alt="" src="/image/${Room_infoVo.rprofile}.jpg">
				</div>
				<div>
					<h2>${Room_infoVo.addr}</h2>
				</div>
			</div>
		</c:forEach>
	</div>

	<div style="clear: both;">
		<div>
			<ul class="pagination">
				<c:if test="${pageMaker.prev}">
					<a href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a>
				</c:if>

				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="idx">


					<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>

				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<a href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a>
				</c:if>

			</ul>
		</div>
	</div>
</body>

</html>
