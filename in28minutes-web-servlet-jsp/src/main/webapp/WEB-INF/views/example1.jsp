<%@ page import="java.util.Date,java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
MY First JSP : ${requestScope.name}
<BR/>
MY Session Scope Variable : ${sessionScope.sessionAttributeName}
<BR/>
<!--Scriptlets  -->
<%
out.println(new Date().toString());
out.println(request.getAttribute("name"));
List<String> players = (List<String>)request.getAttribute("myFavoriteCricketers");
for(String player:players){
	out.println(player);
}
%>

<BR/>
<!--Scripting Expression  -->
<%=new Date().toString()%>
<%=request.getAttribute("name")%>

<BR/>Expression Language:

${requestScope.name}

<BR/> JSTL CORE LIBRARY
<c:forEach var="player" items="${requestScope.myFavoriteCricketers}">
	${player}
</c:forEach>
<BR/>Second Player : ${requestScope.myFavoriteCricketers[1]}

<BR/>
<c:forEach var="headerValue" items="${header}">
	${headerValue.key},${headerValue.value}<BR/>
</c:forEach>

<c:set var="todo" value="${requestScope.todo}"/>


<BR/> JSTL Formatting LIBRARY
To do information : By <fmt:formatDate pattern='dd/MM/yyyy' value='${todo.dueDate}' />, 
I need to complete ${todo.title}. Its id is ${todo.id}. But I will format it as amount 

<fmt:formatNumber value="${todo.id}" type="currency"/>

<c:set var="amountToBeFormatted" value="12345688.89123" />

<p>Default: <fmt:formatNumber value="${amountToBeFormatted}" 
            type="currency"/></p>
<p>maxIntegerDigits="3": <fmt:formatNumber type="number" 
            maxIntegerDigits="3" value="${amountToBeFormatted}" /></p>
<p>maxFractionDigits="3" : <fmt:formatNumber type="number" 
            maxFractionDigits="3" value="${amountToBeFormatted}" /></p>
<p>groupingUsed="false": <fmt:formatNumber type="number" 
            groupingUsed="false" value="${amountToBeFormatted}" /></p>
<p>pattern="###.###E0" <fmt:formatNumber type="number" 
            pattern="###.###E0" value="${amountToBeFormatted}" /></p>

<c:set var="percentageToBeFormatted" value="0.99" />
<p>Percentage &amp; minFractionDigits="2" <fmt:formatNumber type="percent" 
            minFractionDigits="2" value="${percentageToBeFormatted}" /></p>
