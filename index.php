<?php
// include-Pfad setzen
set_include_path ( '.' );
define ( 'ROOT_PATH', "./", TRUE );
define ( 'INC_PATH', "./includes/", TRUE );

// Datenbank- & Config-Datei einbinden
require ( INC_PATH . "inc_db_login.php");

// Magic Quotes deaktivieren
set_magic_quotes_runtime ( FALSE );

//Klassen einbinden (DB Klasse wurde bereits eingebunden)
require(INC_PATH."class_fileaccess.php");
require(INC_PATH."class_template.php");
require(INC_PATH."class_mail_manager.php");
require(INC_PATH."class_user_mapper.php");
require(INC_PATH."class_payment_mapper.php");
require(INC_PATH."class_hash_mapper.php");

// Starte Session
session_start ();

// Datenbankverbindung konnte hergestellt werden
if ( $db !== FALSE ) {
    
    //Include Dateien einbinden
    require ( INC_PATH . "inc_functions.php" );


    // Allgemeine Funktionen aufrufen
    getGoTo ( $_GET['go'] );

    // Seiten-Template generieren
    $theTemplate = new Template ( "main.tpl" );
    
    $theTemplate->load ( "DOCTYPE" ); // Doctype laden
    $template['doc'] = (string) $theTemplate; // Typecasting, da sonst als Referenz zwischengespeichert

    // Content holen
    $template['content'] = getContent($settings['goto']);
    
    // Menü laden
    if ($_SESSION["login"] == "ok") {
        $theTemplate->load("MENU2");
    } else {
        $theTemplate->load("MENU1");   
    }
    $template['menu'] = (string) $theTemplate;

    // Body erzeugen
    $theTemplate->load ( "BODY" );
    $theTemplate->tag ( "content", $template['content'] );
    $theTemplate->tag ( "menu",  $template['menu'] );
    $template['body'] = (string) $theTemplate;
    
    // Haupt-Template laden
    $output = getMainTemplate ();
    $output = str_replace ( "{..body..}", $template['body'], $output );
    $output = str_replace ( "{..doctype..}", $template['doc'], $output );

    // Seite ausgeben
    echo $output;

    // DB-Objekt zerstören => Verbindung beenden
    unset ( $db );
}

// Keine Datenbankverbindung => Hinweis darauf
else {
    echo'<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>High Noon Kino Tübingen</title>
    </head>
    <body>
        <p>
            Leider gibt es zurzeit ein Problem mit unserem Server.<br>
            Bitte versuchen Sie es später noch einmal.
        </p>
        <p>
            Vielen Dank<br>
            Ihr Team vom High Noon Kino Tübingen
        </p>
    </body>
</html>';
}
?>
