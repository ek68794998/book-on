<?php

if (!defined('VALID_REQUEST')) {
	http_response_code(404);
	exit;
}

$content = '';
$desiredIsbn = $_GET['isbn'];

$books = json_decode(apiCall(array(
		'mode' => 'read',
		'data' => 'viewBook',
		'isbn' => $desiredIsbn,
	)));

if ($books->success) {

	if (count($books->data) >= 1) {
		$content .= View::toString("bookView", array(
			'book' => $books->data[0],
		));
	} else {
		$content .= View::toString("error", array(
			'error' => "No such book found.",
		));
	}
} else {
	$content .= View::toString("error", array(
		'error' => "Unknown error.",
	));
}

print View::toString("page", array(
		'title' => 'Book-On',
		'styles' => array(),
		'scripts' => array(),
		'body' => $content,
	));

?>
