
<%@ page import="cfbstats.AppGame" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'appGame.label', default: 'AppGame')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-appGame" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-appGame" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="homeScore" title="${message(code: 'appGame.homeScore.label', default: 'Home Score')}" />
					
						<th><g:message code="appGame.homeTeam.label" default="Home Team" /></th>
					
						<g:sortableColumn property="visitingScore" title="${message(code: 'appGame.visitingScore.label', default: 'Visiting Score')}" />
					
						<th><g:message code="appGame.visitingTeam.label" default="Visiting Team" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${appGameInstanceList}" status="i" var="appGameInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${appGameInstance.id}">${fieldValue(bean: appGameInstance, field: "homeScore")}</g:link></td>
					
						<td>${fieldValue(bean: appGameInstance, field: "homeTeam")}</td>
					
						<td>${fieldValue(bean: appGameInstance, field: "visitingScore")}</td>
					
						<td>${fieldValue(bean: appGameInstance, field: "visitingTeam")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${appGameInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
