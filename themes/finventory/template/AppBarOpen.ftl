<#--
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
-->

<#if (requestAttributes.externalLoginKey)??><#assign externalKeyParam = "?externalLoginKey=" + requestAttributes.externalLoginKey!></#if>
<#if (externalLoginKey)??><#assign externalKeyParam = "?externalLoginKey=" + requestAttributes.externalLoginKey!></#if>
<#assign ofbizServerName = application.getAttribute("_serverId")?default("default-server")>
<#assign contextPath = request.getContextPath()>
<#assign displayApps = Static["org.apache.ofbiz.webapp.control.LoginWorker"].getAppBarWebInfos(security, userLogin, ofbizServerName, "main")>
<#assign displaySecondaryApps = Static["org.apache.ofbiz.webapp.control.LoginWorker"].getAppBarWebInfos(security, userLogin, ofbizServerName, "secondary")>

<#if userLogin?has_content>
  <#assign appMax = Static["org.apache.ofbiz.base.util.UtilProperties"].getPropertyAsInteger("finventory", "appMax", 10)/>
  <div id="main-navigation">
 <#assign appCount = 0>






    <ul>

      <#assign firstApp = true>
      <!--
      <#list displayApps as display>
        <#assign thisApp = display.getContextRoot()>
        <#assign selected = false>
        <#if thisApp == contextPath || contextPath + "/" == thisApp>
          <#assign selected = true>
        </#if>
        <#assign servletPath = Static["org.apache.ofbiz.webapp.WebAppUtil"].getControlServletPath(display)>
        <#assign thisURL = StringUtil.wrapString(servletPath)>
        <#if thisApp != "/">
          <#assign thisURL = thisURL + "main">
        </#if>
        <#if layoutSettings.suppressTab?? && display.name == layoutSettings.suppressTab>
          <#-- do not display this component-->
        <#else>
          <#if appCount % 4 == 0>
            <#if firstApp>
              <li class="first">
              <#assign firstApp = false>
            <#else>
              </li>
              <li>
            </#if>
          </#if>
          <a href="${thisURL}${StringUtil.wrapString(externalKeyParam)}"<#if selected> class="selected"</#if><#if uiLabelMap??> title="${uiLabelMap[display.description]}">${uiLabelMap[display.title]}<#else> title="${display.description}">${display.title}</#if></a>
          <#assign appCount = appCount + 1>
        </#if>
      </#list>
      -->







<nav class="navbar navbar-expand-lg navbar-dark bg-primary">


    <#if userLogin?has_content>
  <div  id="parent-navigation">

         <ul  id="menu">

             <#-- Primary Applications -->
             <#list displayApps as display>
               <#assign thisApp = display.getContextRoot()>
               <#assign selected = false>
               <#if thisApp == contextPath || contextPath + "/" == thisApp>
                 <#assign selected = true>
               </#if>
               <#assign thisApp = StringUtil.wrapString(thisApp)>
               <#assign thisURL = thisApp>

               <#if thisApp != "/">
                 <#assign thisURL = thisURL + "/control/main">
               </#if>
               <#if layoutSettings.suppressTab?? && display.name == layoutSettings.suppressTab>
                 <!-- do not display this component-->

               <#else>


                <#if display.title == "Example" || display.title == "ExampleExt" >
                <!-- do not display this component-->



                <#else>

                 <li class="parent" <#if selected> class="selected"</#if>><a class="nav-link" href="${thisURL + externalKeyParam}"<#if uiLabelMap??> title="${uiLabelMap[display.description]}">${uiLabelMap[display.title]}
                 <#else> title="${display.description}">${display.title}</#if></a></li>

                </#if>





               </#if>
             </#list>
             </ul>
         	</div>
         	 </#if>
         	 </nav>

      <!--
      <#list displaySecondaryApps as display>
        <#assign thisApp = display.getContextRoot()>
        <#assign selected = false>
        <#if thisApp == contextPath || contextPath + "/" == thisApp>
          <#assign selected = true>
        </#if>
          <#assign servletPath = Static["org.apache.ofbiz.webapp.WebAppUtil"].getControlServletPath(display)>
          <#assign thisURL = StringUtil.wrapString(servletPath)>
          <#if thisApp != "/">
            <#assign thisURL = thisURL + "main">
          </#if>
        <#if appCount % 4 == 0>
          <#if firstApp>
            <li class="first">
            <#assign firstApp = false>
          <#else>
            </li>
            <li>
          </#if>
        </#if>
        <a href="${thisURL}${StringUtil.wrapString(externalKeyParam)}"<#if selected> class="selected"</#if><#if uiLabelMap??> title="${uiLabelMap[display.description]}">${uiLabelMap[display.title]}<#else> title="${display.description}">${display.title}</#if></a>
        <#assign appCount = appCount + 1>
      </#list>
      -->
      <#if appCount != 0>
        </li>
        <li class="last"></li>
      </#if>
    </ul>
  </div>
</#if>
