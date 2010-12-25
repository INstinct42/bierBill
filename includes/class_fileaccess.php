<?php
// Klasse zum flexiblen Datei-Zugriff (kann bei Bedarf erweitert werden f�r FTP-Zugriff, etc.)

// Quelle:
// Basiert auf Code aus dem Projekt "Frogsystem 2 [http://www.frogsystem.de/]"
// Urspr�nglicher Hauptautor: Moritz "Sweil" Kornher, Co-Autor: "Satans Kr�melmonster" (Pseudonym)
// f�r das Kino-Projekt minimal �berarbeitet und angepasst von Moritz Kornher
// haupts�chlich �berfl��iges Zeug rausgemschissen und Kommentare hinzugef�gt

class Fileaccess
{
    // Klassen-Variablen
    private $file               = null; // Datei oder Ordner auf den eine Aktion ausgef�hrt werden soll
    private $folder             = FALSE; // Wenn "Datei" ein Ordner ist

    // Konstruktor
    public function  __construct( $file ) {
        $this->setFile( $file );
    }
    
    // Setter f�r Datei/Ordner
    private function setFile ( $file ) {
        if ( is_link ( $file ) ) { // Systemlink unter Linux
            $this->setFile ( readlink ( $file ) ); // Mit richtiger Datei neu aufrufen
        } elseif ( file_exists ( $file ) ) { // Nur wenn die Datei auch existiert
            $this->file = $file;
            if ( is_dir ( $file ) ) { // Ist ein Ordner
                $this->folder = $TRUE;
            }
        } else {
            $this->__destruct ();
        }
    }

    // ersetzt file_get_contents
    public function getData ( $flags = 0, $context = null, $offset = -1, $maxlen = -1 ) {
        // FALSE bei Ordner
        if ( $this->folder ) {
            return FALSE;
        }

        if ( $maxlen == -1 ) { // Workaround, da -1 nicht der richtige Standard-Wert ist (siehe PHP-Doku)
            return file_get_contents ( $this->file, $flags, $context, $offset );
        } else {
            return file_get_contents ( $this->file, $flags, $context, $offset, $maxlen );
        }
    }
}

?>