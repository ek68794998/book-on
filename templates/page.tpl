<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html>
	<head>
		<title><?php echo $viewBag['title']; ?></title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<?php
			foreach ($viewBag['styles'] as $style) {
				echo '<link href="' . _HOST . 'styles/' . $style . '.css" rel="stylesheet" type="text/css"/>';
			}
		?>
	</head>
	<body>
		<?php Template::render('header'); ?>
		<?php echo $viewBag['body']; ?>
		<?php
			foreach ($viewBag['scripts'] as $script) {
				echo '<script type="text/javascript" src="' . _HOST . 'scripts/' . $script . '.js"></script>';
			}
		?>
	</body>
</html>