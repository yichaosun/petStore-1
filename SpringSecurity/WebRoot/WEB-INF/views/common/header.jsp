<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:url value="/styles/style.css" var="cssUrl"/>
<link rel="stylesheet" type="text/css" href="${cssUrl}"/>

<title>JBCP Pets: ${pageTitle}</title>
</head>
<body>
<div id="message">
	${GLOBAL_MESSAGE}
</div>
<div id="header">
<sec:authorize ifAnyGranted="ROLE_USER">
	<div class="username">
		<fmt:message key="header.call"/>,  <strong><sec:authentication property="principal.username"/></strong>
	</div>
</sec:authorize>
<ul>

	<c:url value="/" var="homeUrl"/>
	<li><a href="${homeUrl}"><fmt:message key="header.url.home"/></a></li>
	
	<sec:authorize ifNotGranted="ROLE_USER">
		<c:url value="/registration.do" var="registrationUrl"/>
		<li><a href="${registrationUrl}"><fmt:message key="header.url.registration"/></a></li>
	</sec:authorize>
	 <c:if test="${showLoginLink}">
	 	<c:url value="/login.do" var="loginUrl"/>
		<li><a href="${loginUrl}"><fmt:message key="header.url.login"/></a></li>
	 </c:if>
<%-- Late Ch 3 after logout URL customization
	<c:url value="/logout" var="logoutUrl"/>
	<li><a href="${logoutUrl}">Log Out</a></li>
--%>
	<sec:authorize ifAnyGranted="ROLE_USER">
		<c:url value="/logout" var="logoutUrl"/>
		<li><a href="${logoutUrl}"><fmt:message key="header.url.logout"/></a></li>
	</sec:authorize>
	
	<sec:authorize ifAnyGranted="ROLE_USER">
	<c:url value="/userInfo/home.do" var="userInfoUrl"/>
	<li><a href="${userInfoUrl}"><fmt:message key="header.url.userInfo"/></a></li>
	</sec:authorize>
	
	<sec:authorize ifAnyGranted="ROLE_ADMIN">
		<c:url value="/inventory/list.do" var="inventorylist"/>
		<li><a href="${inventorylist}"><fmt:message key="header.url.invenManager"/></a></li>
	</sec:authorize>
	<sec:authorize ifAnyGranted="ROLE_ADMIN">
	<c:url value="/userManager/index.do" var="userManagerUrl"/>
	<li><a href="${userManagerUrl}"><fmt:message key="header.url.userManager"/></a></li>
	</sec:authorize>
</ul>
<br/>
</div>

