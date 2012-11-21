
<%@ page import="cfbstats.AppTeam" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'appTeam.label', default: 'AppTeam')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-appTeam" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-appTeam" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list appTeam">
			
				<g:if test="${appTeamInstance?.loses}">
				<li class="fieldcontain">
					<span id="loses-label" class="property-label"><g:message code="appTeam.loses.label" default="Loses" /></span>
					
						<span class="property-value" aria-labelledby="loses-label"><g:fieldValue bean="${appTeamInstance}" field="loses"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${appTeamInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="appTeam.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${appTeamInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${appTeamInstance?.totalPoints}">
				<li class="fieldcontain">
					<span id="totalPoints-label" class="property-label"><g:message code="appTeam.totalPoints.label" default="Total Points" /></span>
					
						<span class="property-value" aria-labelledby="totalPoints-label"><g:fieldValue bean="${appTeamInstance}" field="totalPoints"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${appTeamInstance?.wins}">
				<li class="fieldcontain">
					<span id="wins-label" class="property-label"><g:message code="appTeam.wins.label" default="Wins" /></span>
					
						<span class="property-value" aria-labelledby="wins-label"><g:fieldValue bean="${appTeamInstance}" field="wins"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${appTeamInstance?.id}" />
					<g:link class="edit" action="edit" id="${appTeamInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
