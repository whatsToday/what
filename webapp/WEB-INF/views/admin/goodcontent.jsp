 <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="/assets/js/board/jquery-1.9.1.min.js"></script>
	<tr>

		<td>
		<h1> GoodContent 등록</h1>
			<form action="/admin/insertgoodcontent" method="post">
				<table border="1" >
					<tr>
						<td bgcolor="#CCCCCC" align="center">타이틀</td>
						<td bgcolor="#CCCCCC" align="center">멤버번호</td>
						<td bgcolor="#CCCCCC" align="center">멤버이름</td>
					    <td bgcolor="#CCCCCC" align="center">content_no</td>
						<td bgcolor="#CCCCCC" align="center">등록</td>
					</tr>
					<tr>
					<td>
						<select name="title" onchange="changeContent(this.value)">
							 <c:forEach var="vo" items="${contentList}">
							  <option value="${vo.getTitle()}">${vo.getTitle()}</option>
							 </c:forEach>
					  </select> 
						</td>
						<td>
						<select name="member_no" onchange="changeEvent(this.value)">
							 <c:forEach var="vo" items="${memberList}">
							  <option value="${vo.getMember_no()}">${vo.getMember_no()}</option>
							 </c:forEach>
					  </select> 
							
						</td>
						<td><input size="10" type="text" id=memberName name="memberName" readonly="readonly"></td>
						<td><input size="10" type="text" id="content_no" name="content_no" readonly="readonly"></td>
						<td><input type="submit" value="등록"></td>
					</tr>
				</table>
			</form>
				<h1> GoodContent 조회</h1>
					<table class="selectVo" border="1">
					<tr>
						<td bgcolor="#CCCCCC" align="center">NO</td>
						<td bgcolor="#CCCCCC" align="center">content_no</td>
						<td bgcolor="#CCCCCC" align="center">멤버번호</td>
						<td bgcolor="#CCCCCC" align="center">멤버이름</td>
						<td bgcolor="#CCCCCC" align="center">타이틀</td>
						<td bgcolor="#CCCCCC" align="center">삭제</td>
					</tr>
					<c:forEach var="vo" items="${goodContentList}">
					<tr>
						<td>${vo.goodContent_no }</td>
						<td>${vo.content_no }</td>
						<td>${vo.member_no }</td>
						<td>${vo.memberName }</td>
						<td>${vo.title }</td>
						<td><a href="/admin/deletegoodcontent?goodContent_no=${vo.goodContent_no }">삭제</a></td>
					</tr>
					</c:forEach>
				</table>
		</td>
    	<table >			
<tr>
   <td>
      <c:if test="${nowpage<=1}">
         [이전]&nbsp;
      </c:if>
      <c:if test="${nowpage>1}">
         <a href="/admin/goodcontent?page=${nowpage-1}">[이전]</a>&nbsp;
      </c:if>
      <c:forEach var="a" begin="${startpage}"  end="${endpage}">
             <c:if test="${a==nowpage}">
                <font color="red">[${a}]</font>
             </c:if>
             <c:if test="${a!=nowpage}">
                <a href="/admin/goodcontent?page=${a}">[${a}]</a>&nbsp;
             </c:if>    
      </c:forEach>
      <c:if test="${nowpage>=maxpage}">
           [다음]&nbsp;
      </c:if>
      <c:if test="${nowpage<maxpage}">
           <a href="/admin/goodcontent?page=${nowpage+1}">[다음]</a>
      </c:if>
   </td>
</tr>
</table>
	</tr>
	<script>
	    function changeEvent(val){
	    	$.ajax({
				type : 'get',
			    url:'/admin/getMemberName',
			    data : {
			    	 member_no : val
			    },
			    dataType:'json',
			    success: function(response){
			    	$("#memberName").val(response.memberName);
			    } 
			 })
	    } 
	    function changeContent(val){
	 	   $.ajax({
	 		   type :'get',
	 		   url  :'/admin/getcontent_no',
	 		   data :{
	 			   title:val
	 		   },
	 		   dataType:'json',
	 		   success:function(response){
	 			   $("#content_no").val(response.content_no);
	 		   }
	 	   })
	    }
	</script>