<?php
require 'vendor/autoload.php';

use Prometheus\CollectorRegistry;
use Prometheus\Storage\APC;
use Prometheus\RenderTextFormat;

$adapter = new APC();
$registry = new CollectorRegistry($adapter);

$renderer = new RenderTextFormat();
$result = $renderer->render($registry->getMetricFamilySamples());

header('Content-Type: ' . RenderTextFormat::MIME_TYPE);
echo $result;
