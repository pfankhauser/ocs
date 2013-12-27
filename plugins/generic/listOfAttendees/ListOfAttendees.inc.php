<?php

/**
 * @file ListOfAttendees.inc.php
 *
 * Copyright (c) 2013 Péter Fankhauser
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @package plugins.generic.listOfAttendees
 * @class ListOfAttendees
 * 
 */

class ListOfAttendees extends DataObject {
	//
	// Get methods
	//

	/**
	 * Get conference id 
	 * @return string
	 */
	function getConferenceId(){
		return $this->getData('conferenceId');
	}
		
	/**
	 * Get page title 
	 * @param locale
	 * @return string
	 */
	function getTitle($locale) {
		return $this->getData('title', $locale);
	}
		
}

?>
