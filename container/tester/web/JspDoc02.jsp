<?xml version="1.0"?>
<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page"
  version="1.2">
<jsp:directive.page contentType="text/html"/>
<jsp:directive.page import="java.util.Date, java.util.Locale"/>
<jsp:directive.page import="java.text.*"/>

<jsp:declaration>
  String getData() {
    return "foo";
  }
</jsp:declaration>

<html>
<head>
  <title>Example JSP in XML format</title>
</head>

<body>
This is the output of a simple JSP using XML format. 
<br />

<div>Use a jsp:scriptlet to loop from 1 to 10: </div>
<jsp:scriptlet>
// Note we need to declare CDATA because we don't escape the less than symbol
<![CDATA[
  for (int i = 1; i<=10; i++) {
    out.print(i);
    if (i < 10) {
      out.print(", ");
    }
  }
]]>
</jsp:scriptlet>

<!-- Because I omit br's end tag, declare it as CDATA -->
<![CDATA[
  <br><br>
]]>

<div align="left">
  Use a jsp:expression to write something: 
  <jsp:expression>getData()</jsp:expression>
</div>


<jsp:text>
  &lt;p&gt;This sentence is enclosed in a jsp:text element.&lt;/p&gt;
</jsp:text>

</body>
</html>
</jsp:root>