{**
 * header.tpl
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Paper View -- Header component.
 *
 * $Id$
 *}
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>{$paper->getFirstAuthor(true)|escape}</title>
	<meta http-equiv="Content-Type" content="text/html; charset={$defaultCharset|escape}" />
	<meta name="description" content="{$paper->getLocalizedTitle()|strip_tags|escape}" />
	{if $paper->getLocalizedSubject()}
		<meta name="keywords" content="{$paper->getLocalizedSubject()|escape}" />
	{/if}

	{include file="paper/dublincore.tpl"}
	{include file="paper/googlescholar.tpl"}

	<link rel="stylesheet" href="{$baseUrl}/lib/pkp/styles/common.css" type="text/css" />
	<link rel="stylesheet" href="{$baseUrl}/styles/common.css" type="text/css" />
	<link rel="stylesheet" href="{$baseUrl}/styles/paperView.css" type="text/css" />

	<!-- Base Jquery -->
	{if $allowCDN}<script src="http://www.google.com/jsapi"></script>
	<script>
		google.load("jquery", "1");
		google.load("jqueryui", "1");
	</script>
	{else}
	<script type="text/javascript" src="{$baseUrl}/lib/pkp/js/lib/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="{$baseUrl}/lib/pkp/js/lib/jquery/plugins/jqueryUi.min.js"></script>
	{/if}
	<!-- Add javascript required for font sizer -->
	<script type="text/javascript" src="{$baseUrl}/lib/pkp/js/jquery.cookie.js"></script>
	<script type="text/javascript" src="{$baseUrl}/lib/pkp/js/fontController.js" ></script>
	<script type="text/javascript">{literal}
		$(function(){
			fontSize("#sizer", "body", 9, 16, 32, "{/literal}{$baseUrl}{literal}"); // Initialize the font sizer
		});
	{/literal}</script>

	{foreach from=$stylesheets item=cssUrl}
		<link rel="stylesheet" href="{$cssUrl}" type="text/css" />
	{/foreach}

	<script type="text/javascript" src="{$baseUrl}/lib/pkp/js/general.js"></script>
	{$additionalHeadData}
</head>
<body>

<div id="container">

<div id="body">

<div id="main">

<h2>{$schedConf->getFullTitle()|escape}</h2>

{include file="common/navbar.tpl"}

<div id="breadcrumb">
	<a href="{url page="index"}" target="_parent">{translate key="navigation.home"}</a> &gt;
	<a href="{url schedConf=""}" target="_parent">{$conference->getConferenceTitle()|escape}</a> &gt;
	<a href="{url page="index"}" target="_parent">{$schedConf->getSchedConfTitle()|escape}</a> &gt;
	<a href="{url page="schedConf" op="presentations"}" target="_parent">{$track->getLocalizedTitle()|escape}</a> &gt;
	<a href="{url page="paper" op="view" path=$paperId|to_array:$galleyId}" class="current" target="_parent">{$paper->getFirstAuthor(true)|escape}</a>
</div>

<div id="content">
