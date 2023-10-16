<?php
require 'vendor/autoload.php';
require 'db.php';

use Prometheus\CollectorRegistry;
use Prometheus\Storage\APC;

$adapter = new APC();
$registry = new CollectorRegistry($adapter);

$counter = $registry->getOrRegisterCounter('loadtest', 'request_count', 'Counts number of requests', ['page']);
$counter->inc(['list']);

$pdo->beginTransaction();
for ($i = 0; $i <= 700000; $i++) {
    $stmt = $pdo->prepare("INSERT INTO products_db.properties SET product_id=1, property_name='slower', property_value='slower'");
    $stmt->execute();
}
$pdo->commit();
