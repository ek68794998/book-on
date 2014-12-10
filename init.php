<?php

if (!defined('VALID_REQUEST')) {
	http_response_code(404);
	exit;
}

define('_ROOT', rtrim(realpath(dirname(__FILE__)), '/') . '/');
define('_HOST', (!empty($_SERVER['HTTPS']) ? 'https' : 'http') . '://' . $_SERVER['HTTP_HOST'] . '/' . rtrim(substr(realpath(dirname($_SERVER['SCRIPT_FILENAME'])), strlen($_SERVER['DOCUMENT_ROOT'])), '/') . '/');

global $CONFIG, $DB;

require(_ROOT . 'config.php');
require(_ROOT . 'util/string.php');
require(_ROOT . 'util/locale.php');
require(_ROOT . 'util/database.php');
require(_ROOT . 'util/view.php');
require(_ROOT . 'models/author.php');
require(_ROOT . 'models/book.php');
require(_ROOT . 'models/user.php');

$DB = new Connection($CONFIG['db-host'], $CONFIG['db-user'], $CONFIG['db-pass'], $CONFIG['db-name']);

session_start();

?>
