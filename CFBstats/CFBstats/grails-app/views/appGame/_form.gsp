<%@ page import="cfbstats.AppGame" %>



<div class="fieldcontain ${hasErrors(bean: appGameInstance, field: 'homeScore', 'error')} required">
	<label for="homeScore">
		<g:message code="appGame.homeScore.label" default="Home Score" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="homeScore" type="number" value="${appGameInstance.homeScore}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: appGameInstance, field: 'homeTeam', 'error')} required">
	<label for="homeTeam">
		<g:message code="appGame.homeTeam.label" default="Home Team" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="homeTeam" name="homeTeam.id" from="${cfbstats.AppTeam.list()}" optionKey="id" required="" value="${appGameInstance?.homeTeam?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: appGameInstance, field: 'visitingScore', 'error')} required">
	<label for="visitingScore">
		<g:message code="appGame.visitingScore.label" default="Visiting Score" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="visitingScore" type="number" value="${appGameInstance.visitingScore}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: appGameInstance, field: 'visitingTeam', 'error')} required">
	<label for="visitingTeam">
		<g:message code="appGame.visitingTeam.label" default="Visiting Team" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="visitingTeam" name="visitingTeam.id" from="${cfbstats.AppTeam.list()}" optionKey="id" required="" value="${appGameInstance?.visitingTeam?.id}" class="many-to-one"/>
</div>

