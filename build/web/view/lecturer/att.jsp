<%-- 
    Document   : att
    Created on : Nov 5, 2022, 10:45:02 AM
    Author     : dell
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        .header{
            text-align: center;
            padding-bottom: 30px;
        }

    </style>
    <body>
        <div class="title">
            <h1>
                <span>FPT University Academic Portal</span>
            </h1>
        </div>
        <div class="header">
            <h1>
                <span>Take Attendance</span>
            </h1>
        </div>
        <div class="detail">
            <h1>
                <span>Details</span>
            </h1>
        </div>
        Take attendance for Group: ${requestScope.ses.group.name} <br/>
        Subject: ${requestScope.ses.group.subject.name} <br/>
        Room: ${requestScope.ses.room.name} <br/>
        Date: ${requestScope.ses.date} - Time: ${requestScope.ses.slot.description}<br/>
        Attended: <span style="color: red;"> ${requestScope.ses.attanded?"Yes":"No"} </span>
        <form  action="takeatt" method="POST">
            <input type="hidden" name="sesid" value="${param.id}"/>
            <table class="table" border="1px">
                <thead style="background: #6b90da; box-shadow: 0px 2px #f5f5f5"  align="center">
                    <tr>
                    <td>No.</td>
                    <td>StudentID</td>
                    <td>Full Name</td>
                    <td>Present</td>
                    <td>Absent</td>
                    <td>Description</td>
                </tr>
                </thead>                
                <c:forEach items="${requestScope.ses.atts}" var="a" varStatus="loop">
                 <tr>
                    <td>${loop.index+1}</td>
                    <td>${a.student.id}
                    <input type="hidden" name="stdid" value="${a.student.id}"/>
                    </td>
                    <td>${a.student.name}</td>
                    <td><input type="radio"
                               <c:if test="${a.present}">
                               checked="checked"
                               </c:if>
                               name="present${a.student.id}" value="present"/></td>
                    <td><input type="radio"
                               <c:if test="${!a.present}">
                               checked="checked"
                               </c:if>
                               name="present${a.student.id}" value="absent"/></td>
                    <td><input type="text" name="description${a.student.id}" value="${a.description}" /></td>
                </tr>   
                    
                </c:forEach>
                
            </table>
            <input type="submit" value="Save"/>
        </form>
    </body>
</html>
