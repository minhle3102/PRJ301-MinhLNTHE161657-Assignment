<%-- 
    Document   : stutimetable
    Created on : Nov 8, 2022, 2:57:53 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        Student <input type="text" readonly="readonly" value="${requestScope.student.name}"/> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        <a href="/Project_PRJ301/logout">Log Out</a>
        <form action="stutimetable" method="GET">
            <input type="hidden" name="stdid" value="${param.stdid}"/>
            From: <input type="date" name="from" value="${requestScope.from}"/>
            To: <input type="date" name="to" value="${requestScope.to}"/>
            <input type="submit" value="View"/> 
        </form>
        <table border="1px">
            <tr>
                <td> </td>
                <c:forEach items="${requestScope.dates}" var="d">
                    <td>${d}<br/>${helper.getDayNameofWeek(d)}</td>
                    </c:forEach>
            </tr>
            <c:forEach items="${requestScope.slots}" var="slot">
                <tr>
                    <td>${slot.description}</td>
                    <c:forEach items="${requestScope.dates}" var="d">
                        <td>
                            <c:forEach items="${requestScope.sessions}" var="ses">
                                <c:if test="${helper.compare(ses.date,d) eq 0 and (ses.slot.id eq slot.id)}">
                                    <a href="takeatt?id=${ses.id}">${ses.group.name}-${ses.group.subject.name}</a>
                                    <br/>
                                    ${ses.room.name}
                                    <c:if test="${ses.attanded}">
                                        <img src="../img/male-icon.png" alt=""/>
                                    </c:if>
                                    <c:if test="${!ses.attanded}">
                                        <img src="../img/female-icon.png" alt=""/>
                                    </c:if>
                                </c:if>
                                  
                            </c:forEach>
                        </td>
                    </c:forEach>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
