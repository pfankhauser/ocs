{**
 * plugins/generic/listOfAttendees/content.tpl
 *
 * Copyright (c) 2013 Péter Fankhauser
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Display List of Attendees content
 *
 * $Id$
 *}
{assign var="pageTitleTranslated" value=$title}
{include file="common/header.tpl"}

<ul id="listOfAttendees">
{foreach from=$attendees item=attendee}
	<li>
		{$attendee->getFirstName()|escape} {$attendee->getMiddleName()|escape} {$attendee->getLastName()|escape}
		{if $attendee->getAffiliation()}<br />{$attendee->getAffiliation()|escape|nl2br}{/if}
		{if $attendee->getCountry()}<br />{assign var=countryCode value=$attendee->getCountry()}{assign var=country value=$countries.$countryCode}{$country|escape}{/if}
		{if $attendee->getUrl()}<br /><a href="{$attendee->getUrl()|escape:"quotes"}">Website</a>{/if}
		<div class="separator"></div>
	</li>
{/foreach}
</ul>

{include file="common/footer.tpl"}
