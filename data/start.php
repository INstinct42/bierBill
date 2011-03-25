<?php
// Template laden und ausgeben
$theTemplate = new Template ( "main.tpl" );
$theTemplate->load ( "START" );
$theTemplate->tag ( "movie", $random_movie );
echo $theTemplate;

?>
