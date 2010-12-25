//--------------------------------
// START - Document Ready Functions => jQuery Funktionen die direkt nach dem Laden des DOM ausgef�hrt werden
//--------------------------------
$(document).ready(function(){

    //--------------------------------
    // JS aktiv / nicht aktiv behanldung
    //--------------------------------

    // CSS-Datei f�r Styles die nur bei nicht aktiviertem JS ben�tigt werden entfernen
    $("head > link#noscriptcss").remove();
    
    // Elemente verstecken, die bei aktiviertem JS nicht angezeigt werden sollen
    $(".jshidden").hide();
    
    
    //--------------------------------
    // Formular Validierung
    //--------------------------------
    
    // �bersetzung f�r die Formularauswertung angeben
    $.tools.validator.localize("de", {
        '*'            : 'Bitte tragen Sie einen g�ltigen Wert ein',
        ':email'      : 'Bitte tragen Sie eine g�ltige E-Mail-Adresse ein',
        ':number'     : 'Bitte tragen Sie eine Zahl ein',
        ':url'         : 'Bitte tragen Sie eine g�ltige URL ein',
        '[max]'         : 'Bitte tragen Sie einen Wert kleiner als $1 ein',
        '[min]'        : 'Bitte tragen Sie einen Wert gr��er als $1 ein',
        '[required]'    : 'Bitte f�llen Sie dieses Pflichtfeld aus'
    });

    // Die Formular-Validierung initialisieren
    $("#reservationform").validator({ lang: 'de' });


    //--------------------------------
    // Die Buchungsseite
    //--------------------------------

    // Klick-Funktion f�r die einzelnen Sitze hinzuf�gen
    $("#bookingform .screen_container label.seat").toggle(function() { // toggle ruft eine Funktion beim ersten, und die andere beim zweiten Klick auf, immer sch�n abwechselnd

        // 1. Klick => Sitz markieren
        $(this).addClass ( "selectedseat" ); // entsprechende Klasse hinzuf�gen
        $(this).find("input[type=checkbox]").attr("checked", "checked"); // verstecke Checkbox aktivieren
        updateNumOfSelection(); // Anzahl der geklickten Sitze aktualisieren
        calculatePrice(); // Preis aktualisieren
        
        // Mit einer Ajax-Anweisung den geklickten Sitz tempor�r f�r den Benutzer blockieren
        $.ajax({
           type: "POST",
           url: "ajax/block.php",
           data: ({user_id : $("#bookingform input[name=user_id]").val(), show_id : $("#bookingform input[name=the_show]").val(), seat: $(this).find("input[type=checkbox]").val()}),
           success: function(msg){
           }
         });
         
    }, function() {

        // 2. Klick => Auswahl wieder l�schen
        $(this).removeClass ( "selectedseat" ); // Klasse entfernen
        $(this).find ( "input[type=checkbox]" ).removeAttr ( "checked" ); // Checkbox unchecken
        updateNumOfSelection(); // Anzahl der geklickten Sitze aktualisieren
        calculatePrice(); // Preis aktualisieren

        // Mit einer Ajax-Anweisung die tempor�re Blockade aufheben
        $.ajax({
           type: "POST",
           url: "ajax/unblock.php",
           data: ({user_id : $("#bookingform input[name=user_id]").val(), show_id : $("#bookingform input[name=the_show]").val(), seat: $(this).find("input[type=checkbox]").val()}),
           success: function(msg){
           }
         });
         
    });
    
    // Zur�cksetzen Button
    $("#bookingform button[name=reset]").click(function() {
         $(".screen_container label.seat.selectedseat").each(function(index) { // Gehe jedes ausgew�hlte Element durch
            $(this).trigger("click"); // Einen Mausklick ausl�sen => zur�cksetzen
        });
    });
    
    // Checboxen verstecken, wenn JS aktiviert ist
    $(".screen_container label.seat input[type=checkbox]").hide();
    
    
    //--------------------------------
    // Verwaltung
    //--------------------------------

    // Vorstellung zur�cksetzen-Button
    $("#show_reset button[name=reset]").click(function() {
        return confirm ( "Soll die Vorstellung wirklich zur�ckgesetzt werde?" );
    });
    
});
//--------------------------------
// END - Document Ready Functions
//--------------------------------

// Den Preis kalkulieren
function calculatePrice() {
    var priceAll = numSelectedSeats () * 5; // Anzahl der Sitze * 5
    priceAll = priceAll.toFixed(2); // mit 2 Dezimalstellen anzeigen
    priceAll = str_replace ( ".", ",", priceAll.toString() ); // . durch , ersetzen wg. deutscher Zahlendarstellung

    $("#total").html(priceAll); // Inhalt im entsprechenden Element ausgeben
}

// Die Anzahl der ausgew�hlten Sitze darstellen
function updateNumOfSelection() {
    var numSelected = numSelectedSeats (); // Anzahl der Sitze laden
    $("#selectedseats span.alreadyselected").html(numSelected); // Inhalt im entsprechenden Element ausgeben
}

// Die Anzahl der ausgew�hlten Sitze berechnen
function numSelectedSeats () {
    return $(".screen_container label.seat input[type=checkbox]:checked").length;  // Naja, alle Elemente auf welche die Bedingung zu trifft und von diesem Array dann die L�nge => I love jQuery
}

// Funktion um etwas durch etwas anderes zu ersetzen
// Quelle: http://hendi.name/2006/04/08/str_replace-fur-javascript/
function str_replace ( search, replace, subject ) {
    return subject.split( search ).join( replace );
}