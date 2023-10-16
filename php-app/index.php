<?php
 require 'vendor/autoload.php';

 use Prometheus\CollectorRegistry;
 use Prometheus\Storage\APC;

 $adapter = new APC();
 $registry = new CollectorRegistry($adapter);

 $counter = $registry->getOrRegisterCounter('loadtest', 'request_count', 'Counts number of requests', ['page']);
 $counter->inc(['index']);
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Load Test Page</title>
</head>

<body>
    <h1>Agrrr, I'm under loadtest</h1>
</body>

</html>
