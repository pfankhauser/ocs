<?php
/**
 * @file ListOfAttendeesDAO.inc.php
 *
 * Copyright (c) 2013 Péter Fankhauser
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @package plugins.generic.listOfAttendees
 * @class ListOfAttendeesDAO
 *
 * Operations for retrieving list of attendees.
 *
 */
import('db.DAO');

class ListOfAttendeesDAO extends DAO {

	function &getListOfAttendees($conferenceId) {
		$result =& $this->retrieve(
			'SELECT * FROM users WHERE user_id IN (SELECT user_id FROM registrations WHERE sched_conf_id = ?)', $conferenceId
		);

		$returner = new DAOResultFactory($result, $this, '_returnUserFromRow');
		return $returner;
	}

}
?>
