<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="helper" class="util.DateTimeHelper"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../../css/reset.css">
        <link rel="stylesheet" href="../../css/timetable.css">
        <style>
            .log-out{

                margin-left:  90%;

            }
            .log-out a{
                text-decoration: none;
                color: blue;
            }
            .header-title{
                text-align: center;
                padding-bottom: 30px;
            }
            .header-title span{
                font-size: 50px;
                font-weight: bold;
            }
            .timetable{

            }
        </style>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="title">
            <h1>
                <span>FPT University Academic Portal</span>
            </h1>
        </div>
        <div class="log-out"><a href="/Project_PRJ301/logout">Log Out</a></div>
        <div class="header-title">
            <span>Lecturer's Schedule</span>
        </div>
        Lecturer: <input type="text" readonly="readonly" value="${requestScope.lecturer.name}"/> 
        <form action="timetable" method="GET">
            <input type="hidden" name="lid" value="${param.lid}"/>
            From: <input type="date" name="from" value="${requestScope.from}"/>
            To: <input type="date" name="to" value="${requestScope.to}"/>
            <input type="submit" value="View"/> 
        </form>
        <div>

        </div>
        <table class="timetable" border="1px">
            <thead style="background: #6b90da; box-shadow: 0px 2px #f5f5f5"  align="center">
                <tr>
                    <td></td>
                    <c:forEach items="${requestScope.dates}" var="d">
                        <td>${d}<br/>${helper.getDayNameofWeek(d)}</td>
                        </c:forEach>
                </tr>
            </thead>
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
                                        <img src="../img/check.png" alt=""/>
                                    </c:if>
                                    <c:if test="${!ses.attanded}">
                                        <img src="../img/xmark.png" alt=""/>
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
