<div id="drawer" class="drawer">
	<table>
		<tr class="item">
			<td><img src="<?php echo _HOST; ?>assets/icon-book.png" title="Books"/></td>
			<td><a href='<?php echo _HOST; ?>'>Book index</a></td>
		</tr>
		<tr class="item">
			<td><img src="<?php echo _HOST; ?>assets/icon-book-held.png" title="View my held books"/></td>
			<td><a href='<?php echo _HOST; ?>books/held'>Held books</a></td>
		</tr>
		<tr class="item">
			<td><img src="<?php echo _HOST; ?>assets/icon-collect.png" title="Collections"/></td>
			<td><a href='<?php echo _HOST; ?>collections'>Collections</a></td>
		</tr>
	</table>
	<?php if (isset($_SESSION['User']) && $_SESSION['User']->employeeLevel >= User::USER_STAFF): ?>
	<div class="section">
		<div class="title">Administration</div>
		<table>
			<tr class="item">
				<td><img src="<?php echo _HOST; ?>assets/icon-book-checkin.png" title="Check books in"/></td>
				<td><a href='<?php echo _HOST; ?>books/checkin'>Check books in</a></td>
			</tr>
			<tr class="item">
				<td><img src="<?php echo _HOST; ?>assets/icon-book-checkout.png" title="Check books out"/></td>
				<td><a href='<?php echo _HOST; ?>books/checkout'>Check books out</a></td>
			</tr>
			<tr class="item">
				<td><img src="<?php echo _HOST; ?>assets/icon-book-list.png" title="List all books"/></td>
				<td><a href='<?php echo _HOST; ?>books/list'>View inventory</a></td>
			</tr>
			<tr class="item">
				<td><img src="<?php echo _HOST; ?>assets/icon-book-add.png" title="Add book"/></td>
				<td><a href='<?php echo _HOST; ?>books/add'>Add book</a></td>
			</tr>
			<tr class="item">
				<td><img src="<?php echo _HOST; ?>assets/icon-user-list.png" title="List all users"/></td>
				<td><a href='<?php echo _HOST; ?>users/list'>List users</a></td>
			</tr>
			<tr class="item">
				<td><img src="<?php echo _HOST; ?>assets/icon-user-add.png" title="Add new user"/></td>
				<td><a href='<?php echo _HOST; ?>users/add'>New user</a></td>
			</tr>
		</table>
	</div>
	<?php endif; ?>
</div>
