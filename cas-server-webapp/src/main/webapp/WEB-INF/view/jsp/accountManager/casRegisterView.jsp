<%--

    Licensed to Apereo under one or more contributor license
    agreements. See the NOTICE file distributed with this work
    for additional information regarding copyright ownership.
    Apereo licenses this file to you under the Apache License,
    Version 2.0 (the "License"); you may not use this file
    except in compliance with the License.  You may obtain a
    copy of the License at the following location:

      http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.

--%>
<jsp:directive.include file="./includes/top.jsp" />

<spring:eval var="tgcCookieSecure" expression="@casProperties.getProperty('tgc.cookie.secure')" />
<c:if test="${not pageContext.request.secure && tgcCookieSecure}">
    <div id="msg" class="errors">
        <h2><spring:message code="screen.nonsecure.title" /></h2>
        <p><spring:message code="screen.nonsecure.message" /></p>
    </div>
</c:if>

<c:if test="${not empty registeredService}">
    <c:if test="${not empty registeredService.logo || not empty registeredService.name}">
        <div id="service-ui" class="service-info">
            <table>
                <tr>
                    <c:if test="${not empty registeredService.logo && empty registeredService.name}">
                        <td><img class="service-logo-full" src="${registeredService.logo}"> </td>
                    </c:if>
                    <c:if test="${empty registeredService.logo && not empty registeredService.name}">
                        <td><span class="service-name">${registeredService.name}</span></td>
                    </c:if>
                    <c:if test="${not empty registeredService.logo && not empty registeredService.name}">
                        <td><img id="service-logo" class="service-logo-${registeredService.name}" src="${registeredService.logo}"> </td>
                        <td>&nbsp;&nbsp;&nbsp;</td>
                        <td><span class="service-name">${registeredService.name} Preprints</span></td>
                    </c:if>
                </tr>
            </table>
        </div>
        <p/>
    </c:if>
</c:if>

<div class="box" id="login">
    <form:form method="post" id="fm1" commandName="${commandName}" htmlEscape="true">

        <section class="row">
            <label for="fullname"><spring:message code="screen.register.label.fullname" /></label>
            <spring:message code="screen.register.label.fullname.accesskey" var="fullnameAccessKey" />
            <form:input cssClass="required" cssErrorClass="error" id="fullname" size="25" tabindex="1" accesskey="${fullnameAccessKey}" path="fullname" autocomplete="off" htmlEscape="true" />
            <form:errors path="fullname" id="msg" cssClass="errors" element="div" htmlEscape="false" />
        </section>

        <section class="row">
            <label for="email"><spring:message code="screen.register.label.email" /></label>
            <spring:message code="screen.register.label.email.accesskey" var="emailAccessKey" />
            <form:input cssClass="required" cssErrorClass="error" id="email" size="25" tabindex="1" accesskey="${emailAccessKey}" path="email" autocomplete="off" htmlEscape="true" />
            <form:errors path="email" id="msg" cssClass="errors" element="div" htmlEscape="false" />
        </section>

        <section class="row">
            <label for="confirmEmail"><spring:message code="screen.register.label.email.confirm" /></label>
            <spring:message code="screen.register.label.email.confirm.accesskey" var="confirmEmailAccessKey" />
            <form:input cssClass="required" cssErrorClass="error" id="confirmEmail" size="25" tabindex="1" accesskey="${confirmEmailAccessKey}" path="confirmEmail" autocomplete="off" htmlEscape="true" />
            <form:errors path="confirmEmail" id="msg" cssClass="errors" element="div" htmlEscape="false" />
        </section>

        <section class="row">
            <label for="password"><spring:message code="screen.welcome.label.password" />
            </label><spring:message code="screen.welcome.label.password.accesskey" var="passwordAccessKey" />
            <form:password cssClass="required" cssErrorClass="error" id="password" size="25" tabindex="2" path="password"  accesskey="${passwordAccessKey}" htmlEscape="true" autocomplete="off" />
            <form:errors path="password" id="msg" cssClass="errors" element="div" htmlEscape="false" />
        </section>

        <form:errors path="action" id="msg" cssClass="errors" element="div" htmlEscape="false" />

        <section class="row">
            <input type="hidden" name="action" value="${accountPageContext.getAction()}" />
            <input type="hidden" name="campaign" value="${accountPageContext.getCampaign()}" />
            <input type="hidden" name="lt" value="${loginTicket}" />
            <input type="hidden" name="execution" value="${flowExecutionKey}" />
            <input type="hidden" name="_eventId" value="submit" />
            <input type="submit" class="btn-submit" name="submit" accesskey="l" value="<spring:message code="screen.register.button.register" />" tabindex="4"  />
        </section>

    </form:form>
</div>

<jsp:directive.include file="./includes/bottom.jsp" />