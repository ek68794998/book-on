<?php

if (!defined('VALID_REQUEST')) {
	http_response_code(404);
	exit;
}

class Connection {
	private $db;

	/**
	 * Creates a new database connection instance.
	 *
	 * @param string $host The host string for the database.
	 * @param string $user The username to connect with.
	 * @param string $password The password for the given username.
	 * @param string $db The name of the database to connect to.
	 */
	public function __construct($host, $user, $password, $db) {
		try {
			$this->db = new PDO("mysql:host={$host};dbname={$db}", $user, $password, array(
				PDO::ATTR_PERSISTENT => true,
				PDO::ATTR_ERRMODE => PDO::ERRMODE_WARNING,
			));
		} catch (PDOException $pdoe) {
			// TODO Do something with exception
			var_dump($pdoe);
		}
	}

	/**
	 * Performs a query on the PDO object.
	 *
	 * @param string $queryString The executable query as a PDO-ready string.
	 * @param array $args The set of arguments for the query. Should have numeric indices if using '?' parameters, or keys prefixed by ':' if using named parameters.
	 */
	public function query($queryString, $args = array()) {
		$stmt = $this->db->prepare($queryString);

		if ($stmt->execute($args)) {
			if ($stmt->rowCount() > 0) {
				return $stmt->fetchAll();
			}
		}

		return array();
	}
}

?>
