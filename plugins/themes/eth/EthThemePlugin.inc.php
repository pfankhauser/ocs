<?php

/**
 * @file EthThemePlugin.inc.php
 *
 * Copyright (c) 2013 Peter Fankhauser
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class EthThemePlugin
 * @ingroup plugins_themes_eth
 *
 * @brief "ETH" theme plugin
 */

//$Id$

import('classes.plugins.ThemePlugin');

class EthThemePlugin extends ThemePlugin {
	/**
	 * Get the name of this plugin. The name must be unique within
	 * its category.
	 * @return String name of plugin
	 */
	function getName() {
		return 'EthThemePlugin';
	}

	function getDisplayName() {
		return 'ETH Theme';
	}

	function getDescription() {
		return 'Dynamic Walking 2014';
	}

	function getStylesheetFilename() {
		return 'eth.css';
	}
	function getLocaleFilename($locale) {
		return null; // No locale data
	}
}

?>
