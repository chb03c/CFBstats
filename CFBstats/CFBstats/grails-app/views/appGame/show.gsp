
<%@ page import="cfbstats.AppGame" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'appGame.label', default: 'AppGame')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-appGame" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-appGame" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list appGame">
			
				<g:if test="${appGameInstance?.homeScore}">
				<li class="fieldcontain">
					<span id="homeScore-label" class="property-label"><g:message code="appGame.homeScore.label" default="Home Score" /></span>
					
						<span class="property-value" aria-labelledby="homeScore-label"><g:fieldValue bean="${appGameInstance}" field="homeScore"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${appGameInstance?.homeTeam}">
				<li class="fieldcontain">
					<span id="homeTeam-label" class="property-label"><g:message code="appGame.homeTeam.label" default="Home Team" /></span>
					
						<span class="property-value" aria-labelledby="homeTeam-label"><g:link controller="appTeam" action="show" id="${appGameInstance?.homeTeam?.id}">${appGameInstance?.homeTeam?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${appGameInstance?.visitingScore}">
				<li class="fieldcontain">
					<span id="visitingScore-label" class="property-label"><g:message code="appGame.visitingScore.label" default="Visiting Score" /></span>
					
						<span class="property-value" aria-labelledby="visitingScore-label"><g:fieldValue bean="${appGameInstance}" field="visitingScore"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${appGameInstance?.visitingTeam}">
				<li class="fieldcontain">
					<span id="visitingTeam-label" class="property-label"><g:message code="appGame.visitingTeam.label" default="Visiting Team" /></span>
					
						<span class="property-value" aria-labelledby="visitingTeam-label"><g:link controller="appTeam" action="show" id="${appGameInstance?.visitingTeam?.id}">${appGameInstance?.visitingTeam?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${appGameInstance?.id}" />
					<g:link class="edit" action="edit" id="${appGameInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
