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

<#if requestAttributes.uiLabelMap??><#assign uiLabelMap = requestAttributes.uiLabelMap></#if>
<#assign useMultitenant = Static["org.apache.ofbiz.base.util.UtilProperties"].getPropertyValue("general.properties", "multitenant")>

<#assign username = requestParameters.USERNAME?default((sessionAttributes.autoUserLogin.userLoginId)?default(""))>
<#if username != "">
  <#assign focusName = false>
<#else>
  <#assign focusName = true>
</#if>
<center>






  <div class="screenlet login-screenlet">

    <div class="screenlet-body">








 <h3>${uiLabelMap.CommonRegistered}</h3>


 <div class="limiter">
 		<div class="container-login100">
 			<div class="wrap-login100">
 				<div class="login100-pic js-tilt" data-tilt>
 					<img src="https://colorlib.com/etc/lf/Login_v1/images/img-01.png" alt="IMG">
 				</div>

 				<form class="login100-form validate-form">

 				  <div class="form-group">
                    <label for="username" class="text-info">${uiLabelMap.CommonUsername}:</label><br>
                    <input type="text" name="USERNAME" value="${username}" size="20" class="form-control">
                </div>
                <div class="form-group">
                    <label for="password" class="text-info">${uiLabelMap.CommonPassword}:</label><br>
                    <input type="password" name="PASSWORD" autocomplete="off" value="" size="20" class="form-control">
                </div>
                <div class="form-group">
                    <label for="remember-me" class="text-info"><span>Remember me</span> <span><input id="remember-me" name="remember-me" type="checkbox"></span></label><br>
                    <input type="submit" value="${uiLabelMap.CommonLogin}" class="btn btn-info btn-md" >
                </div>


                                                 <input type="hidden" name="JavaScriptEnabled" value="N"/>
                                                        <br />
                                                        <a href="<@ofbizUrl>forgotPassword_step1</@ofbizUrl>">${uiLabelMap.CommonForgotYourPassword}?</a>
                                                <div id="register-link" class="text-right">
                                                    <a href="#" class="text-info">Register here</a>
                                                </div>
                                                 <div class="form-group">
                                                <#if ("Y" == useMultitenant) >
                                                            <#if !requestAttributes.userTenantId??>
                                                              <tr>
                                                                <td class="label">${uiLabelMap.CommonTenantId}</td>
                                                                <td><input type="text" name="userTenantId" value="${parameters.userTenantId!}" size="20"/></td>
                                                              </tr>
                                                            <#else>
                                                                <input type="hidden" name="userTenantId" value="${requestAttributes.userTenantId!}"/>
                                                            </#if>
                                                          </#if>
                                                          </div>

 				
 				</form>
 			</div>
 		</div>
 	</div>








</center>

<script language="JavaScript" type="text/javascript">
  document.loginform.JavaScriptEnabled.value = "Y";
  <#if focusName>
    document.loginform.USERNAME.focus();
  <#else>
    document.loginform.PASSWORD.focus();
  </#if>
</script>








