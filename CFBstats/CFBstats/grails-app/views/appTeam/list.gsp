
<%@ page import="cfbstats.AppTeam" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'appTeam.label', default: 'AppTeam')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-appTeam" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-appTeam" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="loses" title="${message(code: 'appTeam.loses.label', default: 'Loses')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'appTeam.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="totalPoints" title="${message(code: 'appTeam.totalPoints.label', default: 'Total Points')}" />
					
						<g:sortableColumn property="wins" title="${message(code: 'appTeam.wins.label', default: 'Wins')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${appTeamInstanceList}" status="i" var="appTeamInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${appTeamInstance.id}">${fieldValue(bean: appTeamInstance, field: "loses")}</g:link></td>
					
						<td>${fieldValue(bean: appTeamInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: appTeamInstance, field: "totalPoints")}</td>
					
						<td>${fieldValue(bean: appTeamInstance, field: "wins")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${appTeamInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
