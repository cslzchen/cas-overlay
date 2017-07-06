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

<div id="login" style="width: 100%;">
    <form:form method="post" id="fm1" commandName="${commandName}" htmlEscape="true">

        <c:set var="externalIdP" value="${credential.getNonInstitutionExternalIdProvider()}"/>
        <c:set var="externalId" value="${credential.getNonInstitutionExternalId()}" />

        <div id="msg" class="success">
            <p><spring:message code="screen.externalAuthRegister.success.message" arguments="${externalIdP}" /></p>
        </div>

        <h2><spring:message code="screen.externalAuthRegister.header" arguments="${externalIdP}" /></h2>
        <p><spring:message code="screen.externalAuthRegister.message" arguments="${externalIdP}" /></p>

        <section class="row">
            <label for="externalId"><spring:message code="screen.externalAuthRegister.label.externalId" arguments="${externalIdP}" /></label><br/>
            <spring:message code="screen.externalAuthRegister.label.externalId.accesskey" var="externalIdAccessKey" />
            <form:input disabled="true" value="${externalId}" cssClass="required" cssErrorClass="error" id="externalId" size="25" tabindex="1" accesskey="${externalIdAccessKey}" path="externalId" autocomplete="off" htmlEscape="true" />
        </section>

        <section class="row">
            <label for="email"><spring:message code="screen.externalAuthRegister.label.email" arguments="${externalIdP}" /></label><br/>
            <spring:message code="screen.findAccount.label.email.accesskey" var="emailAccessKey" />
            <form:input cssClass="required" cssErrorClass="error" id="email" size="25" tabindex="1" accesskey="${emailAccessKey}" path="email" autocomplete="off" htmlEscape="true" />
        </section>

        <section class="row check">
            <input type="checkbox" name="consent" id="consent" value="true" tabindex="5" onchange="checkConsent(this)" />
            <label for="consent"><spring:message code="screen.register.checkbox.consent.title" /></label>
        </section>

        <form:errors path="email" id="msg" cssClass="errors" element="div" htmlEscape="false" />
        <form:errors path="action" id="msg" cssClass="errors" element="div" htmlEscape="false" />

        <section class="row btn-row">
            <input type="hidden" name="action" value="${accountManagerContext.getAction()}" />
            <input type="hidden" name="lt" value="${loginTicket}" />
            <input type="hidden" name="execution" value="${flowExecutionKey}" />
            <input type="hidden" name="_eventId" value="submit" />
            <input id="register-submit" class="btn-submit" name="submit" disabled accesskey="l" value="<spring:message code="screen.externalAuthRegister.button.createOrLink" />" tabindex="4" type="submit" />
        </section>

    </form:form>
</div>

<c:set var="alternativeBottomLogin" value="true"/>

<jsp:directive.include file="./includes/bottom.jsp" />
