<%@ page import="cfbstats.AppTeam" %>



<div class="fieldcontain ${hasErrors(bean: appTeamInstance, field: 'loses', 'error')} required">
	<label for="loses">
		<g:message code="appTeam.loses.label" default="Loses" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="loses" type="number" value="${appTeamInstance.loses}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: appTeamInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="appTeam.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${appTeamInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: appTeamInstance, field: 'totalPoints', 'error')} required">
	<label for="totalPoints">
		<g:message code="appTeam.totalPoints.label" default="Total Points" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalPoints" type="number" value="${appTeamInstance.totalPoints}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: appTeamInstance, field: 'wins', 'error')} required">
	<label for="wins">
		<g:message code="appTeam.wins.label" default="Wins" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="wins" type="number" value="${appTeamInstance.wins}" required=""/>
</div>

