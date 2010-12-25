<?php

// Login abfangen
if ( $_POST['login'] == 1 ) {
    login ( $_POST['user'], $_POST['pass'] );
}

// Logout abfangen
if ( $_GET['go'] == "logout" && $_POST['login'] != 1 ) {
    logout();
}


// Funktion die den Login Vorgang regelt
function login ( $login_name, $password ) {
    // DB-Klasse verf�gbar machen
    global $sql;

    // Benutzername und Passwort anpassen
    secureSQL ( $login_name );
    $password = md5 ( $password ); // Muss nicht gesichert werden, da ein MD5 Hash niemals sch�dlichen Code enth�lt
    
    // Nachschlagen ob es diese Kombination gibt
    $login_data = $sql->getData ( "users", "id", "WHERE `name` = '".$login_name."' AND `password` = '".$password."'", 1 );

    // Wenn ja => Session setzen
    if ( $sql->wasGetSuccessful ( $login_data  ) ) {
        $_SESSION["login"] = "ok";
        return TRUE;
    } else {
        logout();
        return FALSE;
    }
}


// Loggt einen User aus, bzw. l�scht alles was man so mit Sessions machen kann
function logout () {
    session_unset (); // Session-Variablen l�schen
    session_destroy (); // Session zerst�ren
    $_SESSION = array(); // Superglobale mit leerem Array �berschreiben
}
?>
