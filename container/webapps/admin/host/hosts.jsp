<!--
  Licensed to the Apache Software Foundation (ASF) under one or more
  contributor license agreements.  See the NOTICE file distributed with
  this work for additional information regarding copyright ownership.
  The ASF licenses this file to You under the Apache License, Version 2.0
  (the "License"); you may not use this file except in compliance with
  the License.  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
-->
<!-- Standard Struts Entries -->
<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/controls.tld" prefix="controls" %>

<html:html locale="true">

<%@ include file="../users/header.jsp" %>

<!-- Body -->
<body bgcolor="white" background="../images/PaperTexture.gif">

<!--Form -->

<html:errors/>

<html:form method="POST" action="/DeleteHosts">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr bgcolor="7171A5">
      <td width="81%">
        <div class="page-title-text" align="left">
          <bean:message key="actions.hosts.delete"/>
        </div>
      </td>
      <td align="right" nowrap>
        <div class="page-title-text">
            <controls:actions label="Host Actions">
              <controls:action selected="true"> ----<bean:message key="actions.available.actions"/>---- </controls:action>
              <controls:action> --------------------------------- </controls:action>
            </controls:actions>
        </div>
      </td>
    </tr>
  </table>

<%@ include file="../buttons.jsp" %>
  <br>

  <%-- Hosts List --%>

  <table class="back-table" border="0" cellspacing="0" cellpadding="1" width="100%">
    <tr>
      <td>
        <table class="front-table" border="1"
         cellspacing="0" cellpadding="0" width="100%">
          <tr class="header-row">
            <td><div align="left" class="table-header-text">
              <bean:message key="actions.delete"/>
            </div></td>
            <td><div align="left" class="table-header-text">
              <bean:message key="host.name"/>
            </div></td>
          </tr>

        <logic:iterate name="hostsList" id="host">
          <tr class="line-row">
            <td><div align="left" class="table-normal-text">&nbsp;
            
             <logic:match name="host"
                        value='<%= (String)request.getAttribute("adminAppHost") %>'>
             <font color='red'>*</font>
             </logic:match>
             <logic:notMatch name="host"
                        value='<%= (String)request.getAttribute("adminAppHost") %>'>
              <label for="hosts"></label>          
              <html:multibox property="hosts"
                                value="<%= host.toString() %>" styleId="hosts"/>
              </logic:notMatch>
              
            </div></td>
            <td><div align="left" class="table-normal-text">&nbsp;
              <html:link page='<%= "/EditHost.do?select=" +
                         java.net.URLEncoder.encode(host.toString(),"UTF-8") %>'>
                <controls:attribute name="host" attribute="name"/>
              </html:link>
            </div></td>
          </tr>
        </logic:iterate>
        </table>
      </td>
    </tr>
  </table>

<%@ include file="../buttons.jsp" %>

  <br>
</html:form>

<p>&nbsp;</p>
</body>
</html:html>
