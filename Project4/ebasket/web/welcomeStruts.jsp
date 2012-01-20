<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://www.servletsuite.com/servlets/cooktag" prefix="cookie" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>

<html:html lang="true">
    <jsp:useBean id="mybasket" scope="session" class="beans.Basket" />
    <c:choose>
        <c:when test="${param.cafe_am!=null}">
            <jsp:setProperty name="mybasket" property="cafeamount" value="${param.cafe_am}"/>
            <cookie:addCookie name="cafecookie" value="${param.cafe_am}" age="10000"/>
        </c:when>	
        <c:when test="${cookie.cafecookie.value!=null}">
            <jsp:setProperty name="mybasket" property="cafeamount" value="${cookie.cafecookie.value}"/>
        </c:when>
        <c:otherwise>
            <jsp:setProperty name="mybasket" property="cafeamount" value="0.0"/>
        </c:otherwise>
    </c:choose>
    <c:choose>
        <c:when test="${param.sugar_am!=null}">
            <jsp:setProperty name="mybasket" property="sugaramount" value="${param.sugar_am}"/>
            <cookie:addCookie name="sugarcookie" value="${param.sugar_am}" age="10000"/>
        </c:when>	
        <c:when test="${cookie.sugarcookie.value!=null}">
            <jsp:setProperty name="mybasket" property="sugaramount" value="${cookie.sugarcookie.value}"/>
        </c:when>
        <c:otherwise>
            <jsp:setProperty name="mybasket" property="sugaramount" value="0.0"/>
        </c:otherwise>
    </c:choose>
    <c:choose>
        <c:when test="${param.water_am!=null}">
            <jsp:setProperty name="mybasket" property="wateramount" value="${param.water_am}"/>
            <cookie:addCookie name="watercookie" value="${param.water_am}" age="10000"/>
        </c:when>	
        <c:when test="${cookie.watercookie.value!=null}">
            <jsp:setProperty name="mybasket" property="wateramount" value="${cookie.watercookie.value}"/>
        </c:when>
        <c:otherwise>
            <jsp:setProperty name="mybasket" property="wateramount" value="0.0"/>
        </c:otherwise>
    </c:choose>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><bean:message key="welcome.title"/></title>
        <html:base/>
    </head>
    <body style="background-color: white">

        <logic:notPresent name="org.apache.struts.action.MESSAGE" scope="application">
            <div  style="color: red">
                ERROR:  Application resources not loaded. Zong!
            </div>
        </logic:notPresent>
    <center>
        <br>
        <form method="POST" action="index.jsp" >
            <table datasrc="#test">
                <tr>
                    <th>Item</td>
                    <th>Price</td>
                    <th>Quantity</td>
                    <th>Total</td>
                </tr>
                <tr>
                    <td>Cafe</td>
                    <td>${initParam.cafeprice}</td>
                    <td><input type="text" id="cafe_am" name="cafe_am" value="${mybasket.cafeamount}"></td>
                    <td>${mybasket.cafeamount * initParam.cafeprice}</td>
                </tr>
                <tr>
                    <td>Sugar</td>
                    <td>${initParam.sugarprice}</span></td>
                    <td><input type="text" id="sugar_am" name="sugar_am" value="${mybasket.sugaramount}"></td>
                    <td>${mybasket.sugaramount * initParam.sugarprice}</td>
                </tr>
                <tr>
                    <td>Water</td>
                    <td>${initParam.waterprice}</span></td>
                    <td><input type="text" id="water_am" name="water_am" value="${mybasket.wateramount}"></td>
                    <td>${mybasket.wateramount * initParam.waterprice}</td>
                </tr>
                <tr>
                    <td>Total</td>
                    <td></td>
                    <td></td>
                    <td>${mybasket.cafeamount * initParam.cafeprice + mybasket.sugaramount * initParam.sugarprice + mybasket.wateramount * initParam.waterprice}</td>
                </tr>
            </table>
            <br>
            <button type="SUBMIT">Calculate</button>
        </form>
    </center>
</body>
</html:html>
