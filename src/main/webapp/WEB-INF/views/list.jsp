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
<!-- <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
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
				카테고리</option>
			<option value="addr"
				<c:out value="${cri.searchType eq 'addr'?'selected':''}"/>>지역</option>
			<option value="name"
				<c:out value="${cri.searchType eq 'name'?'selected':''}"/>>가게명</option>
			<option value="rcode"
				<c:out value="${cri.searchType eq 'rcode'?'selected':''}"/>>글번호</option>
		</select> <input type="text" name='keyword' id="keywordInput"
			value='${cri.keyword }'>
		<button id='searchBtn'>Search</button>

	</div>
	<c:forEach var="Room_infoVo" items="${list}">
		<div id="cloth">
			<div id="img">
				<a href='/room/readDetail${pageMaker.makeSearch(pageMaker.cri.page) }&rcode=${Room_infoVo.rcode}'><img
					id="img2" alt="" src="/image/${Room_infoVo.rprofile}.jpg"></a>
			</div>
			<div>
				<h4>
					가게번호 : ${Room_infoVo.rcode}<br>가게명 : ${Room_infoVo.name}<br>
					가게주소 : ${Room_infoVo.addr}
				</h4>
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
