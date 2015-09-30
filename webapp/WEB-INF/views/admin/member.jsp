<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
     <div class="">
        <c:forEach var="vo" items="${memberList }">
           <table>
              <tr>
                 <td>member_no</td>
                 <td>email</td>
                 <td>password</td>
                 <td>imageUrl</td>
                 <td>memberGrade</td>
                 <td>memberName</td>
              </tr>
              <tr>
                  <td>${vo.member_no}</td>
                  <td>${vo.eamil}</td>
                  <td>${vo.password }</td>
                  <td>${vo.imageUrl }</td>
                  <td>${vo.memberGrade }</td>
                  <td>${vo.memberName }</td>
              </tr>
           </table>
        </c:forEach>
     </div>
    
</body>
</html>