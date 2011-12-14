<%-- 
    Document   : index
    Created on : Dec 13, 2011, 1:21:53 AM
    Author     : ioparnas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<script type="text/javascript" src="js/clearForm.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>

<jsp:useBean id="mybasket" class="beans.Basket" scope="page"/>
<% 
	String[] product_amount= new String[] {"0.0", "0.0", "0.0"}; 
	String[] amount_tag= new String[] {"cafeamount", "sugaramount", "wateramount"};
	for (int i=0; i<amount_tag.length; i++){
		if (request.getParameter(amount_tag[i])!=null){
			product_amount[i]= request.getParameter(amount_tag[i]);	
		}
		else{
			Cookie[] cookies = request.getCookies();
				if ( cookies != null ){ 
					for (int j = 0; j < cookies.length; j++) {
						if (cookies[j].getName().equals(amount_tag[i])) {
							product_amount[i]=cookies[j].getValue();
						}
					}
				}	
		}
		Cookie cookie2 = new Cookie(amount_tag[i], product_amount[i]);	
		cookie2.setMaxAge(60*60*24*7*4);
		response.addCookie(cookie2);	
	}		
 %>
  	<c:choose>
		<c:when test="${param.cafeamount!=null}">
			<jsp:setProperty name="mybasket" property="cafeamount" value="${param.cafeamount}"/>
		</c:when>	
		<c:when test="${cookie.cafeamount.value!=null}">
			<jsp:setProperty name="mybasket" property="cafeamount" value="${cookie.cafeamount.value}"/>
		</c:when>
		<c:otherwise>
			<jsp:setProperty name="mybasket" property="cafeamount" value="0.0"/>
		</c:otherwise>
	</c:choose>
	  	<c:choose>
		<c:when test="${param.sugaramount!=null}">
			<jsp:setProperty name="mybasket" property="sugaramount" value="${param.sugaramount}"/>
		</c:when>	
		<c:when test="${cookie.sugaramount.value!=null}">
			<jsp:setProperty name="mybasket" property="sugaramount" value="${cookie.sugaramount.value}"/>
		</c:when>
		<c:otherwise>
			<jsp:setProperty name="mybasket" property="sugaramount" value="0.0"/>
		</c:otherwise>
	</c:choose>
	  	<c:choose>
		<c:when test="${param.wateramount!=null}">
			<jsp:setProperty name="mybasket" property="wateramount" value="${param.wateramount}"/>
		</c:when>	
		<c:when test="${cookie.wateramount.value!=null}">
			<jsp:setProperty name="mybasket" property="wateramount" value="${cookie.wateramount.value}"/>
		</c:when>
		<c:otherwise>
			<jsp:setProperty name="mybasket" property="wateramount" value="0.0"/>
		</c:otherwise>
	</c:choose>
<html>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" >
<style type="text/css">
body,input{
font-family:"Times New Roman";
font-size:30px;
}
table
{
border-collapse:collapse;
width:60%;
}
th
{
width:15%;
}
table, th, td
{
font-family:"Times New Roman";
font-size:30px;
border: 1px solid black;
}
td
{
text-align:center;
}
</style>
<title>e-Shop</title>
</head>
<body>
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
			<td><input type="text" id="cafeamount" name="cafeamount" value="${mybasket.cafeamount}"></td>
			<td>${mybasket.cafeamount * initParam.cafeprice}</td>
		</tr>
		<tr>
			<td>Sugar</td>
			<td>${initParam.sugarprice}</span></td>
			<td><input type="text" id="sugaramount" name="sugaramount" value="${mybasket.sugaramount}"></td>
			<td>${mybasket.sugaramount * initParam.sugarprice}</td>
		</tr>
		<tr>
			<td>Water</td>
			<td>${initParam.waterprice}</span></td>
			<td><input type="text" id="wateramount" name="wateramount" value="${mybasket.wateramount}"></td>
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
<a href="https://github.com/ioparnas/WWW-project" target="_blank">S</a>
<a href="https://github.com/ioparnas/WWW-project/tarball/master">T</a>
<a href="http://parnas-sos.comule.com" target="_blank">?</a>
</center>
</body>
</html>