{**
 * templates/trackDirector/submissionsArchives.tpl
 *
 * Copyright (c) 2000-2011 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Show track director's submission archive.
 *
 * $Id$
 *}
<div id="submissions">
<table width="100%" class="listing">
	<tr><td colspan="6" class="headseparator">&nbsp;</td></tr>
	<tr class="heading" valign="bottom">
		<td width="5%">{sort_search key="common.id" sort="id"}</td>
		<td width="15%">{sort_search key="submissions.submitted" sort="submitDate"}</td>
		<td width="5%">{sort_search key="submissions.track" sort="track"}</td>
		<td width="25%">{sort_search key="paper.authors" sort="authors"}</td>
		<td width="30%">{sort_search key="paper.title" sort="title"}</td>
		<td width="20%" align="right">{sort_search key="common.status" sort="status"}</td>
	</tr>
	<tr><td colspan="6" class="headseparator">&nbsp;</td></tr>

{iterate from=submissions item=submission}
	{assign var="paperId" value=$submission->getId()}
	<tr valign="top">
		<td>{$submission->getId()}</td>
		<td>{$submission->getDateSubmitted()|date_format:$dateFormatShort}</td>
		<td>{$submission->getTrackAbbrev()|escape}</td>
		<td>{$submission->getAuthorString(true)|truncate:40:"..."|escape}</td>
		<td><a href="{url op="submissionReview" path=$paperId}" class="action">{$submission->getLocalizedTitle()|strip_unsafe_html|truncate:60:"..."}</a></td>
		<td align="right">
			{assign var="status" value=$submission->getStatus()}
			{if $status == STATUS_ARCHIVED}
				{translate key="submissions.archived"}
			{elseif $status == STATUS_PUBLISHED}
				{translate key="submissions.published"}
			{elseif $status == STATUS_DECLINED}
				{translate key="submissions.declined"}
			{/if}
		</td>
	</tr>
	<tr>
		<td colspan="6" class="{if $submissions->eof()}end{/if}separator">&nbsp;</td>
	</tr>
{/iterate}
{if $submissions->wasEmpty()}
	<tr>
		<td colspan="6" class="nodata">{translate key="submissions.noSubmissions"}</td>
	</tr>
	<tr>
		<td colspan="6" class="endseparator">&nbsp;</td>
	</tr>
{else}
	<tr>
		<td colspan="3" align="left">{page_info iterator=$submissions}</td>
		<td colspan="3" align="right">{page_links anchor="submissions" name="submissions" iterator=$submissions searchField=$searchField searchMatch=$searchMatch search=$search track=$track sort=$sort sortDirection=$sortDirection}</td>
	</tr>
{/if}
</table>
</div>

