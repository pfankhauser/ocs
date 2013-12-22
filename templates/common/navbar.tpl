{**
 * navbar.tpl
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Navigation Bar
 *
 *}
<div id="navbar">
	<ul class="menu">
		<li><a href="{url context=$homeContext op="index"}">{translate key="navigation.home"}</a></li>
		<li><a href="{url page="about"}">{translate key="navigation.about"}</a></li>
		{if $isUserLoggedIn}
			<li><a href="{url page="user"}">{translate key="navigation.userHome"}</a></li>
		{else}
			<li><a href="{url page="login"}">{translate key="navigation.login"}</a></li>
			<li><a href="{url page="user" op="account"}">{translate key="navigation.account"}</a></li>
		{/if}{* $isUserLoggedIn *}

		{if $currentConference}
			{if $enableAnnouncements}
				<li><a href="{url page="announcement"}">{translate key="announcement.announcements"}</a></li>
			{/if}{* $enableAnnouncements *}

			{call_hook name="Templates::Common::Header::Navbar::CurrentConference"}
		{/if}{* $currentConference *}
		
		{if $schedConfShowCFP}<li><a href="{url page="schedConf" op="cfp"}">{translate key="schedConf.cfp"}</a></li>{/if}
		{if $schedConfPostTrackPolicies}<li><a href="{url page="schedConf" op="trackPolicies"}">{translate key="schedConf.trackPolicies"}</a></li>{/if}
		{if $schedConfShowProgram}<li><a href="{url page="schedConf" op="program"}">{translate key="schedConf.program"}</a></li>{/if}
		{if $schedConfPostPresentations}<li><a href="{url page="schedConf" op="presentations"}">{translate key="schedConf.presentations.short"}</a></li>{/if}
		{if $schedConfPostSchedule}<li><a href="{url page="schedConf" op="schedule"}">{translate key="schedConf.schedule"}</a></li>{/if}
		{if $schedConfPostPayment}<li><a href="{url page="schedConf" op="registration"}">{translate key="schedConf.registration"}</a></li>{/if}
		{if $schedConfPostAccommodation}<li><a href="{url page="schedConf" op="accommodation"}">{translate key="schedConf.accommodation"}</a></li>{/if}
		{if $schedConfPostSupporters}<li><a href="{url page="about" op="organizingTeam"}">{translate key="schedConf.supporters"}</a></li>{/if}
		{if $schedConfPostTimeline}<li><a href="{url page="schedConf" op="timeline"}">{translate key="schedConf.timeline"}</a></li>{/if}

		{foreach from=$navMenuItems item=navItem}
			{if $navItem.url != '' && $navItem.name != ''}
				<li><a href="{if $navItem.isAbsolute}{$navItem.url|escape}{else}{$navItem.url|escape}{/if}">{if $navItem.isLiteral}{$navItem.name|escape}{else}{translate key=$navItem.name}{/if}</a></li>
			{/if}
		{/foreach}
	</ul>
</div>
