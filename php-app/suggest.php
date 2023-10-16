<?php
require 'vendor/autoload.php';
require 'db.php';

use Prometheus\CollectorRegistry;
use Prometheus\Storage\APC;

$adapter = new APC();
$registry = new CollectorRegistry($adapter);

$counter = $registry->getOrRegisterCounter('loadtest', 'request_count', 'Counts number of requests', ['page']);
$counter->inc(['suggest']);

$swValue = $_GET['sw'];             // Value of the property (e.g., '16GB')

// Ensure to sanitize these inputs in a real application!

// Define the histogram
$histogram = $registry->registerHistogram('myapp', 'mysql_query_duration_seconds', 'Duration of MySQL queries', ['method'], [0.01, 0.05, 0.1, 0.5, 1, 2, 5]);

// Start measuring time
$start = microtime(true);

$stmt = $pdo->prepare("SELECT products.* 
FROM products 
    JOIN properties ON products.id = properties.product_id 
WHERE (products.name like ? or products.description like ?) ");
$stmt->execute(['%' . $swValue . '%', '%' . $swValue . '%']);
$results = $stmt->fetchAll();

// End measuring time
$duration = microtime(true) - $start;

// Record the duration into the histogram
$histogram->observe($duration, ['search_suggest']);

foreach ($results as $product) {
    echo $product['name'] . "<br>";
}
