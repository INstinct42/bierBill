<?php

// Wenn der Benutzer eingeloggt ist
if ( $_SESSION["login"] == "ok" ) {
    
   echo "admin";
// Sonst Weiterleitung zur Login-Seite
} else {
    include ( ROOT_PATH."data/login.php");
}

// Dynamische Titel erweiterung setzen
$settings['title_ext'] = "Verwaltung";
?>
