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
<jsp:directive.include file="includes/top.jsp" />

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

<div id="login" style="width: 100%;">
    <form:form method="post" id="fm1" commandName="${commandName}" htmlEscape="true">

        <c:choose>
            <c:when test="${osfLoginContext.getAction() == 'forgotPassword'}">
                <spring:message code="screen.help.forgot.password.header" var="helpHeader"/>
                <spring:message code="screen.help.forgot.password.message" var="helpMessage"/>
            </c:when>
            <c:when test="${osfLoginContext.getAction() == 'resendConfirmation'}">
                <spring:message code="screen.help.resend.confirmation.header" var="helpHeader"/>
                <spring:message code="screen.help.resend.confirmation.message" var="helpMessage"/>
            </c:when>
        </c:choose>

        <h2>${helpHeader}</h2>

        <section class="row">
            <label for="email">${helpMessage}</label><br/>
            <spring:message code="screen.help.label.email.accesskey" var="emailAccessKey" />
            <form:input cssClass="required" cssErrorClass="error" id="email" size="25" tabindex="1" accesskey="${emailAccessKey}" path="email" autocomplete="off" htmlEscape="true" />
        </section>

        <form:errors path="email" id="msg" cssClass="errors" element="div" htmlEscape="false" />
        <form:errors path="loginAction" id="msg" cssClass="errors" element="div" htmlEscape="false" />

        <section class="row btn-row">
            <input type="hidden" name="loginAction" value="${osfLoginContext.getAction()}" />
            <input type="hidden" name="lt" value="${loginTicket}" />
            <input type="hidden" name="execution" value="${flowExecutionKey}" />
            <input type="hidden" name="_eventId" value="submit" />
            <input class="btn-submit" name="submit" accesskey="l" value="<spring:message code="screen.help.button.send" />" tabindex="4" type="submit" />
        </section>

    </form:form>
</div>

<c:set var="alternativeBottomLogin" value="true"/>

<jsp:directive.include file="includes/bottom.jsp" />
