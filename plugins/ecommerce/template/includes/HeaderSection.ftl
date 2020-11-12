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
    <script>
    $(document).ready(function() {
      if (jQuery.fn.bsgdprcookies !== undefined) {
        jQuery('body').bsgdprcookies({
            title: '${uiLabelMap.EcommerceCookieConsentTitle}',
            message: '${uiLabelMap.EcommerceCookieConsentMessage}',
            moreLink: '/ecommerce/control/CookiePolicy',
            moreLinkLabel: ' ${uiLabelMap.EcommerceCookieConsentMoreLinkLabel}',
            acceptButtonLabel: '${uiLabelMap.EcommerceCookieConsentAcceptButtonLabel}',
            advancedButtonLabel: '${uiLabelMap.EcommerceCookieConsentAdvancedButtonLabel}',
            allowAdvancedOptions: false
        });
      }
    });
    </script>



<#assign shoppingCart = sessionAttributes.shoppingCart!>
<#if shoppingCart?has_content>
  <#assign shoppingCartSize = shoppingCart.size()>
<#else>
  <#assign shoppingCartSize = 0>
</#if>



     <#if layoutSettings.headerImageUrl??>
            <#assign headerImageUrl = layoutSettings.headerImageUrl>
            <#elseif layoutSettings.VT_HDR_IMAGE_URL??>
                       <#assign headerImageUrl = layoutSettings.VT_HDR_IMAGE_URL>

            </#if>



      <!-- Start header section -->
       <header id="aa-header">
         <!-- start header top  -->
         <div class="aa-header-top">
           <div class="container">
             <div class="row">
               <div class="col-md-12">
                 <div class="aa-header-top-area">
                   <!-- start header top left -->
                   <div class="aa-header-top-left">
                     <!-- start language -->
                     <div class="aa-language">

                     <a href="<@ofbizUrl>main</@ofbizUrl>">
                               <span class="glyphicon glyphicon-home"></span>
                             </a>

                     </div>
                     <!-- / language -->

                     <!-- start currency -->
                     <div class="aa-currency">
                     <!--
                       <div class="dropdown">
                         <a class="btn dropdown-toggle" href="#" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                           <i class="fa fa-usd"></i>USD
                           <span class="caret"></span>
                         </a>
                         <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                           <li><a href="#"><i class="fa fa-euro"></i>EURO</a></li>
                           <li><a href="#"><i class="fa fa-jpy"></i>YEN</a></li>
                         </ul>
                       </div>
                       -->
                     </div>
                     <!-- / currency -->
                     <!-- start cellphone -->
                     <!--
                     <div class="cellphone hidden-xs">
                       <p><span class="fa fa-phone"></span>00-62-658-658</p>
                     </div>
                     -->
                     <!-- / cellphone -->
                   </div>
                   <!-- / header top left -->
                   <div class="aa-header-top-right">
                     <ul class="aa-head-top-nav-right">
                      <#if !userLogin?has_content || (userLogin.userLoginId)! != "anonymous">
                       <li><a href="<@ofbizUrl>viewprofile</@ofbizUrl>">My Account</a></li>
                       </#if>
                       <li class="hidden-xs"><a href="wishlist.html">Wishlist</a></li>
                       <li class="hidden-xs"><a href="<@ofbizUrl>view/showcart</@ofbizUrl>">My Cart</a></li>
                       <#if (shoppingCartSize > 0)>
                       <li class="hidden-xs"><a href="<@ofbizUrl>quickcheckout</@ofbizUrl>">Checkout</a></li>
                           <#else>
                              <li class="hidden-xs">Checkout</li>
                           </#if>


                        <#if userLogin?has_content && userLogin.userLoginId != "anonymous">
                               <li  class="hidden-xs">
                                 <a class="nav-link" href="<@ofbizUrl>logout</@ofbizUrl>">${uiLabelMap.CommonLogout}</a>
                               </li>
                             <#else>
                               <li  class="hidden-xs">
                                 <a class="nav-link" href="<@ofbizUrl>${checkLoginUrl}</@ofbizUrl>">${uiLabelMap.CommonLogin}</a>
                               </li>
                               <li  class="hidden-xs">
                                 <a class="nav-link" href="<@ofbizUrl>newcustomer</@ofbizUrl>">${uiLabelMap.EcommerceRegister}</a>
                               </li>
                             </#if>
                     </ul>
                   </div>
                 </div>
               </div>
             </div>
           </div>
         </div>
         <!-- / header top  -->

         <!-- start header bottom  -->
         <div class="aa-header-bottom">
           <div class="container">
             <div class="row">
               <div class="col-md-12">
                 <div class="aa-header-bottom-area">
                   <!-- logo  -->
                   <div class="aa-logo">

                     <!-- img based logo -->
                      <#if layoutSettings.VT_HDR_IMAGE_URL?has_content>
 <a href="<@ofbizUrl>main</@ofbizUrl>">
                               <img src="/ecommerce${layoutSettings.VT_HDR_IMAGE_URL}"/>
                             </a>

                               </#if>

                   </div>
                   <!-- / logo  -->
                    <!-- cart box -->
                   <div class="aa-cartbox">
                    <#if !userLogin?has_content || (userLogin.userLoginId)! != "anonymous">

                     <a class="aa-cart-link" href="<@ofbizUrl>editShoppingList</@ofbizUrl>">
                       <span class="fa fa-shopping-basket"></span>
                       <span class="aa-cart-title"></span>
                       <span class="aa-cart-notify">2</span>
                     </a>
                     </#if>
                     <div class="aa-cartbox-summary">
                       <ul>
                         <li>
                           <a class="aa-cartbox-img" href="#"><img src="/ecommerce/img/woman-small-2.jpg" alt="img"></a>
                           <div class="aa-cartbox-info">
                             <h4><a href="#">Product Name</a></h4>
                             <p>1 x $250</p>
                           </div>
                           <a class="aa-remove-product" href="#"><span class="fa fa-times"></span></a>
                         </li>
                         <li>
                           <a class="aa-cartbox-img" href="#"><img src="/ecommerce/img/woman-small-1.jpg" alt="img"></a>
                           <div class="aa-cartbox-info">
                             <h4><a href="#">Product Name</a></h4>
                             <p>1 x $250</p>
                           </div>
                           <a class="aa-remove-product" href="#"><span class="fa fa-times"></span></a>
                         </li>
                         <li>
                           <span class="aa-cartbox-total-title">
                             Total
                           </span>
                           <span class="aa-cartbox-total-price">
                             $500
                           </span>
                         </li>
                       </ul>
                       <a class="aa-cartbox-checkout aa-primary-btn" href="checkout.html">Checkout</a>
                     </div>
                   </div>
                   <!-- / cart box -->
                   <!-- search box -->
                   <div class="aa-search-box">





                      <form name="keywordsearchform" id="keywordSearchForm" method="post" action="<@ofbizUrl>keywordsearch?VIEW_SIZE=25&amp;PAGING=Y</@ofbizUrl>">
                       <input type="text" name="" id="" placeholder="Search here ex. 'man' ">
                       <input type="submit" name="find" value="${uiLabelMap.CommonFind}" class="buttontext" />
                     </form>
                   </div>
                   <!-- / search box -->
                 </div>
               </div>
             </div>
           </div>
         </div>
         <!-- / header bottom  -->
       </header>
       <!-- / header section -->





