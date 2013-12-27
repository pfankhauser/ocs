<?php

/**
 * @file ListOfAttendeesHandler.inc.php
 *
 * Copyright (c) 2013 Péter Fankhauser
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @package plugins.generic.listOfAttendees
 * @class ListOfAttendeesHandler
 *
 * Find the content and display the appropriate page
 *
 */

import('handler.Handler');

class ListOfAttendeesHandler extends Handler {
	function index( $args ) {
		Request::redirect(null, null, null, 'view', Request::getRequestedOp());
	}
	
	function view ($args) {
		if (count($args) > 0 ) {
			AppLocale::requireComponents(array(LOCALE_COMPONENT_PKP_COMMON, LOCALE_COMPONENT_APPLICATION_COMMON));			
			$conference =& Request::getConference();
			$conferenceId = $conference->getId();
			$path = $args[0];

			$listOfAttendeesPlugin =& PluginRegistry::getPlugin('generic', 'ListOfAttendeesPlugin');
			$templateMgr =& TemplateManager::getManager();

			$listOfAttendeesDAO =& DAORegistry::getDAO('ListOfAttendeesDAO');
			$listOfAttendees = $listOfAttendeesDAO->getListOfAttendees($conferenceId);

			if ( !$listOfAttendees ) {
				Request::redirect(null, null, 'index');
			}
			
			// and assign the template vars needed
			$templateMgr->assign('title', 'TITEL');
			$templateMgr->assign('content',  'INHALT');
			$templateMgr->display($listOfAttendeesPlugin->getTemplatePath().'content.tpl');
		}
	}
}

?>
