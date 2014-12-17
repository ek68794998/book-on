<form class="bookCheck-form material-form" method="POST" action="<?php echo _HOST; ?>books/check<?php echo $viewBag['mode']; ?>" novalidate>
	<div id="blank-copy-field" style="display: none"><?php View::render('bookCopyEntry'); ?></div>
	<?php if ($viewBag['mode'] == 'in'): ?>
	<input type="hidden" name="cardNumber" value="0" />
	<?php else: ?>
	<div class="input-group">
		<input type="number" name="cardNumber" value="<?php echo isset($_POST['cardNumber']) ? htmlentities($_POST['cardNumber']) : ''; ?>" pattern="^[0-9]+$" placeholder="Card number" />
		<div class="input-status input-error"></div>
	</div>
	<?php endif; ?>
	<div class="form-fields"><?php echo isset($viewBag['fields']) ? $viewBag['fields'] : ''; ?></div>
	<div class="form-controls">
		<input type="button" value="Cancel" class="button-flat action-negative" />
		<input type="submit" value="Check <?php echo ucfirst($viewBag['mode']); ?>" class="button-flat action-primary" />
	</div>
	<input type="hidden" name="maxCopyIndex" value="0" />
</form>
