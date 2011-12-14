<%-- 
    Document   : index
    Created on : Dec 10, 2011, 11:45:15 AM
    Author     : ioparnas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<script type="text/javascript" src="js/clearForm.js"></script>

<%!  double cafe_price=18.5; %>
<%!  double sugar_price=6.95; %>
<%! double water_price=1.29; %>
<% 
	Double[] product_amount= new Double[] {0.0, 0.0, 0.0}; 
	String[] amount_tag= new String[] {"cafe_amount", "sugar_amount", "water_amount"};
	for (int i=0; i<amount_tag.length; i++){
		if (request.getParameter(amount_tag[i])!=null){
			product_amount[i]= Double.parseDouble(request.getParameter(amount_tag[i]));	
		}
		else{
			Cookie[] cookies = request.getCookies();
				if ( cookies != null ){ 
					for (int j = 0; j < cookies.length; j++) {
						if (cookies[j].getName().equals(amount_tag[i])) {
							String tmp=cookies[j].getValue();
							try{
							product_amount[i] = Double.parseDouble(tmp)	;
							}
							catch(Exception e){}
						}
					}
				}	
		}
		Cookie cookie2 = new Cookie(amount_tag[i], request.getParameter(amount_tag[i]));	
		cookie2.setMaxAge(60*60*24*7*4);
		response.addCookie(cookie2);	
	}		
 double cafe_amount=product_amount[0]; 
 double sugar_amount=product_amount[1]; 
 double water_amount=product_amount[2]; 
 %>

<html>
<head>
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
<td><%= cafe_price %></span></td>
<td><input type="text" id="cafe_amount" name="cafe_amount" value=<%= cafe_amount %>></td>
<td><%= cafe_amount*cafe_price %></td>
</tr>
<tr>
<td>Sugar</td>
<td><%= sugar_price %></span></td>
<td><input type="text" id="sugar_amount" name="sugar_amount" value=<%= sugar_amount %>></td>
<td><%= sugar_amount*sugar_price %></td>
</tr>
<tr>
<td>Water</td>
<td><%= water_price %></span></td>
<td><input type="text" id="water_amount" name="water_amount" value=<%= water_amount %>></td>
<td><%= water_amount*water_price %></td>
</tr>
<tr>
<td>Total</td>
<td></td>
<td></td>
<td><%= cafe_amount*cafe_price+sugar_amount*sugar_price+water_amount*water_price %></td>
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