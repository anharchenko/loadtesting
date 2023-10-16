<?php
require 'vendor/autoload.php';
require 'db.php';


use Prometheus\CollectorRegistry;
use Prometheus\Storage\APC;

$adapter = new APC();
$registry = new CollectorRegistry($adapter);

$counter = $registry->getOrRegisterCounter('loadtest', 'request_count', 'Counts number of requests', ['page']);
$counter->inc(['list']);

$propertyName = $_GET['property'];  // Name of the property (e.g., 'RAM')
$propertyValue = $_GET['value'];    // Value of the property (e.g., '16GB')
$swValue = $_GET['sw'];             // Value of the property (e.g., '16GB')

// Ensure to sanitize these inputs in a real application!

// Define the histogram
$histogram = $registry->registerHistogram('myapp', 'mysql_query_duration_seconds', 'Duration of MySQL queries', ['method'], [10, 30, 50, 100, 200, 500, 1000, 3000]);

// Start measuring time
$start = microtime(true);

$stmt = $pdo->prepare("SELECT products.* 
FROM products 
    JOIN properties ON products.id = properties.product_id 
WHERE properties.property_name = ? AND 
      properties.property_value = ? AND
      (products.name like ? or products.description like ?) ");
$stmt->execute([$propertyName, $propertyValue, '%' . $swValue . '%', '%' . $swValue . '%']);

$results = $stmt->fetchAll();
// End measuring time
$duration = microtime(true) - $start;

// Record the duration into the histogram
$histogram->observe($duration * 1000, ['search']);

echo '<h1>Listing</h1>';
foreach ($results as $product) {
    echo "Product Name: " . $product['name'] . "<br>";
    echo "Description: " . $product['description'] . "<br><br>";
}
