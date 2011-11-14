<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" >
<style type="text/css">
div.top
{
background-color:#000000;
height:100px;
width:600px;
border-style:solid;
border-width:4px;
}
div.middle
{
background-color:#BDB76B;
height:240px;
width:500px;
}
div.middlebig
{
background-color:#BDB76B;
height:280px;
width:600px;
border-style:solid;
border-width:15px;
}
button
{
font-size:25px;
}
h1{
font-size:40px;
color:white;
font-family:"Times New Roman";
}
body{
background-image:url('http://mindmillion.com/images/money/money-background-dollar-sign-blackl.jpg');
background-color:#505050;
}
p{
font-family:"Times New Roman";
font-size:28px;
}
</style>
<title>Currency Converter Result</title>
</head>

<body>
<center>
<div class="top"><h1>Back To Drachmas!</h1>
</div><br><br>
<div class="middlebig">
<div class="middle">
<p align="left">
<% 
String result = (String)request.getAttribute("result");
out.println(result);
%>
<br>
<center>
<button TYPE="BUTTON" ONCLICK="window.location.href='http://parnaserver.dyndns.org:8080/currencyconverter/'"> Back to Currency Converter</button>
</center>
</div>
</div>
</center>
</body> 
</html> 