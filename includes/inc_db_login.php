<?php
// Datenbank Login Variablen
$dbc['host'] = "localhost"; // Server
$dbc['user'] = "ibill"; // Benutzer
$dbc['pass'] = "ibill"; // Passwort
$dbc['data'] = "ibill"; // Datenbank
$dbc['pref'] = ""; // Tabellen-Pr�fix (erlaubt mehrere Scripte in einer DB, die sonst evtl. gleiche Tabellennamen h�tten)


// DB Verbindung herstellen
require ( INC_PATH . "class_sql.php" ); // Verbindungs-Klasse einbinden
$sql = new SQL ( $dbc['host'], $dbc['data'], $dbc['user'], $dbc['pass'], $dbc['pref'] ); // Objekt erzeugen => Verbindung herstellen
$db = $sql->getRes();

// Wenn Verbindung hergestellt
if ( $db !== FALSE ) {

    // Allgemeine Einstellung laden
    #$settings = $sql->getData ( "settings", "*", "WHERE `id` = 1", 1 );
    
    // Pr�fix und Datenbankname in Settings speichern
    $settings['pref'] = $dbc['pref'];
    $settings['data'] = $dbc['data'];
}

// DB-Verbindungsdaten wg. Sicherheit unsetten
unset ( $dbc );
?>
