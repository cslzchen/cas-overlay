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

<!DOCTYPE html>

<%@ page pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page import="io.cos.cas.account.flow.AccountManagerPageContext" %>
<c:set var="jsonPageContext" value="${jsonAccountPageContext}" />
<%
    String stringPageContext = (String) pageContext.getAttribute("jsonPageContext");
    AccountManagerPageContext accountPageContext = AccountManagerPageContext.fromJson(stringPageContext);
    pageContext.setAttribute("accountPageContext", accountPageContext);
%>
<c:set var="serviceUrl" value="${not empty accountPageContext.getServiceUrl() ? accountPageContext.getServiceUrl() : fn:escapeXml(param.service)}" />

<html lang="en">
    <head>
        <meta charset="UTF-8" />

        <title>OSF | Central Authentication Service</title>

        <spring:theme code="standard.custom.css.file" var="customCssFile" />
        <link rel="stylesheet" href="<c:url value="${customCssFile}" />" />
        <link rel="icon" href="<c:url value="/favicon.ico" />" type="image/x-icon" />

        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,300,700' rel='stylesheet' type='text/css'>
    </head>

    <body id="cas" onload="selectFocus()">
        <div id="container">
            <br>
            <header>
                <div class="center">
                    <spring:eval var="osfUrl" expression="@casProperties.getProperty('osf.url')" />
                    <a id="logo" class="center" href="${osfUrl}" title="<spring:message code="logo.title" />">Open Science Framework | Sign In</a>
                </div>
                <br>
                <div class="center">
                    <span id="title">
                        <c:choose>
                            <c:when test="${not empty registeredService}">
                                <span class="title-full">${registeredService.properties.title.getValue()}</span>
                                <span class="title-abbr">${registeredService.properties.titleAbbr.getValue()}</span>
                            </c:when>
                            <c:otherwise>
                                <span class="title-full">Open Science Framework</span>
                                <span class="title-abbr">OSF CAS</span>
                            </c:otherwise>
                        </c:choose>
                    </span>
                </div>
                <div class="responsive">
                    <div id="description">
                        <br><br>
                        <c:choose>
                            <c:when test="${accountPageContext.isRegister()}">
                                <spring:message code="screen.osf.register.message" />
                            </c:when>
                            <c:otherwise>
                                <spring:message code="screen.cas.login.message" />
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </header>
            <br>
            <div id="content">