<div class="book-info">
	<h1 title="<?php echo htmlentities($viewBag['book']->title); ?>"><?php echo $viewBag['book']->title; ?></h1>
	<div class="info">by <?php
		$noComma = true;
		foreach ($viewBag['book']->authors as $a) {
			if (!$noComma) { echo ', '; } $noComma = false;
			echo "{$a->firstName} {$a->lastName} (Author)";
		}
	?></div>
	<div class="info"><?php echo $viewBag['book']->publisher; ?></div>
	<div class="cover"><img src="<?php echo _HOST; ?>assets/cover-missing.png" title="No cover image"/></div>
	<div class="data">
		<table>
			<tr>
				<td><img src="<?php echo _HOST; ?>assets/icon-buy.png" title="Price"/></td>
				<td><div><?php echo $viewBag['book']->copiesForSale; ?> copies at $<?php echo $viewBag['book']->salePrice; ?></div></td>
			</tr>
			<tr class="section-end">
				<td><img src="<?php echo _HOST; ?>assets/icon-rent.png" title="Rent"/></td>
				<td><div><?php echo $viewBag['book']->copiesForRent; ?> copies for rent</div></td>
			</tr>
			<tr>
				<td><img src="<?php echo _HOST; ?>assets/icon-edition.png" title="Edition"/></td>
				<td><div><?php echo String::ordinal($viewBag['book']->edition); ?> edition</div></td>
			</tr>
			<tr>
				<td><img src="<?php echo _HOST; ?>assets/icon-language.png" title="Language"/></td>
				<td><div><?php echo Locale::getLanguageName($viewBag['book']->language); ?></div></td>
			</tr>
			<tr>
				<td><img src="<?php echo _HOST; ?>assets/icon-isbn.png" title="ISBN"/></td>
				<td><div><?php echo $viewBag['book']->isbn; ?></div></td>
			</tr>
			<tr>
				<td><img src="<?php echo _HOST; ?>assets/icon-pages.png" title="Page count"/></td>
				<td><div><?php echo number_format($viewBag['book']->pageCount); ?> pages</div></td>
			</tr>
		</table>
	</div>
</div>
