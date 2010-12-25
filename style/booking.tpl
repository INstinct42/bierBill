<!--section-start::BOOKING-->
<h3>Online-Reservierung</h3>
{..personal..}
<p>
    Sie wollen f�r die folgende Vorstellung Karten reservieren. Bitte w�hlen Sie Anzahl und Position der Pl�tze aus.
</p>
{..show_info..}
<p>&nbsp;</p>
<form id="bookingform" action="" method="post">
    <input type="hidden" name="user_hash" value="{..user_hash..}">
    <input type="hidden" name="user_id" value="{..user_id..}">
    <input type="hidden" name="the_show" value="{..show_id..}">
    <fieldset>
        {..screen..}
        <p></p>
        {..legend..}
        <p>&nbsp;</p>
        {..booking_info..}
   </fieldset>
</form>
<!--section-end::BOOKING-->

<!--section-start::PERSONAL-->
<p>
    Hallo <b>{..prename..} {..lastname..}</b>, E-Mail: {..email..}<br>
    <span class="small">(Falls Sie nicht diese Person sind oder Ihre E-Mail �ndern wollen, <a href="{..delete_url..}">klicken Sie bitte hier</a>.)</span>
</p>
<!--section-end::PERSONAL-->

<!--section-start::BOOKING_SHOW_INFO-->
<table class="contenttable booking">
    <tr>
        <th>Film</th>
        <th>Datum & Uhrzeit</th>
        <th>Kino</th>
    </tr>
    <tr>
        <td>{..movie_title..}</td>
        <td>{..show_date..}<br>{..show_time..} Uhr</td>
        <td>{..screen_name..}</td>
    </tr>
</table>
<!--section-end::BOOKING_SHOW_INFO-->

<!--section-start::BOOKING_INFO-->
<table class="contenttable booking">
    <tr id="selectedseats" class="nojshidden">
        <th colspan="3">Anzahl Karten: <span class="alreadyselected">0</span></th>
    </tr>
    <tr class="jshidden">
        <th colspan="3">Preise</th>
    </tr>
    <tr id="price">
        <th>Normal<br>5,00�</th>
        <th>Erm��igt<br>4,50�</th>
        <th>Kinder<br>4,00�</th>
    </tr>
    <tr class="nojshidden">
        <th colspan="3">
            Gesamt (vorl�ufig):<br><span id="total">0,00</span>�
        </th>
    </tr>
    <tr class="jshidden">
        <th colspan="3"  align="center">
            <p class="center">Der Gesamtbetrag wird bei Abholung berechnet</p>
        </th>
    </tr>
    <tr>
        <th colspan="3">
            <p class="center">
                <button class="pointer" type="submit" name="booknow" value="1">verbindliche Reservierung durchf�hren</button>
            </p>
            <p class="center jshidden">
                <button class="pointer" type="reset">zur�cksetzen</button>
            </p>
            <p class="center nojshidden">
                <button class="pointer" type="button" name="reset">zur�cksetzen</button>
            </p>
        </th>
    </tr>
</table>
<p class="small nojshidden">
    <b>Hinweis:</b> Der tats�chliche zu zahlende Betrag wird erst bei Abholung berechnet und h�ngt davon ab, wie sich Personen ausweisen k�nnen.
</p>
<!--section-end::BOOKING_INFO-->

<!--section-start::LEGEND-->
<table class="contenttable booking">
    <tr>
        <th rowspan="2" class="jshidden">
            <div class="legend seat blocked atleft" title="tempor�r gesperrt"></div>
            gesperrt
        </th>
        <th class="nojshidden">
            <div class="legend seat selectedseat atleft" title="ausgew�hlt"></div>
            ausgew�hlt
        </th>
        <th>
            <div class="legend seat atleft" title="frei"></div>
            frei
        </th>
        <th>
            <div class="legend seat sold atleft" title="verkauft"></div>
            verkauft
        </th>
    </tr>
    <tr>
        <th class="nojshidden">
            <div class="legend seat blocked atleft" title="tempor�r gesperrt"></div>
            gesperrt
        </th>
        <th>
            <div class="legend seat wheelchair atleft" title="Rollstuhlplatz (frei)"></div>
            Rollstuhlplatz
        </th>
        <th>
            <div class="legend seat reservation atleft" title="reserviert"></div>
            reserviert
        </th>
    </tr>
</table>
<p class="nojshidden"><b>Hinweis:</b> Ausgew�hlte Pl�tze werden 60 Sekunden f�r Sie vorreserviert. Nach Ablauf der Zeit stehen sie wieder f�r alle unsere Besucher zur Verf�gung.</p>
<!--section-end::LEGEND-->

<!--section-start::BOOKING_END-->
<h3>Online-Reservierung</h3>
<p>
    Hallo <b>{..prename..} {..lastname..}</b>, E-Mail: {..email..}
</p>
<p>
    Wir haben f�r Sie in der folgende Vorstellung <b>{..num_seats..}</b>&nbsp;Platz/Pl�tze reserviert:
</p>
{..show_info..}
<p>
    Die Nummern der reservierten Pl�tze lauten:
</p>
<p class="center">
    <b>{..seats..}</b>
</p>
<p>
    Geben Sie bei Abholung der reservierten Karten einfach Ihren vollst�ndigen Namen an.
</p>
<h3>Preis</h3>
<p class="center">
    <b>{..price..}</b><br>
    <span>(vorl�ufig, bei {..num_seats..}x Normal-Preis)</span>
</p>
<p class="small">
    <b>Hinweis:</b> Der tats�chliche zu zahlende Betrag wird erst bei Abholung berechnet und h�ngt davon ab, wie sich Personen ausweisen k�nnen.
</p>
<h3>Karten abholen</h3>
<p>
    Bitte beachten Sie, dass reservierte Karte 30 Minuten vor Beginn der Vorstellung abgeholt werden m�ssen. Andernfalls behalten wir uns vor die Reservierung zu stornieren und die Karten anderweitig zu vergeben.
</p>
<p>
    Geben Sie bei Abholung der reservierten Karten einfach Ihren vollst�ndigen Namen an.
</p>
<!--section-end::BOOKING_END-->


<!--section-start::BOOKING_ERROR-->
<h3>Es trat ein Fehler auf...</h3>
<p>
    Leider wurden soeben einige der von Ihnen gew�hlten Pl�tze anderweitig vergeben.
</p>
<p>
    Bitte f�hren Sie Ihre Reservierung erneut durch.
</p>
<p class="center">
    <a href="{..url..}">� zur�ck zur Online-Reservierung</a>
</p>
<p class="jshidden">
    <b>Tipp:</b> Aktivieren Sie die JavaScript-Funktion Ihres Browser, damit Ihnen nicht noch einmal Karten direkt vor der Nase weggeschnappt werden.
</p>
<p class="jshidden">
    Haben Sie die JavaScript-Funktion aktiviert, k�nnen wir gew�hlten Pl�tze kurzeitig f�r Sie blockieren.
</p>
<!--section-end::BOOKING_ERROR-->

<!--section-start::MAILFORM-->
<form id="reservationform" action="" method="post">

    <fieldset>
        <h3>Anmeldung</h3>

        <p>
            Um die Online-Reservierung nutzen zu k�nnen, m�ssen Sie sich mit Ihrem Namen und einer g�ltigen E-Mail-Adresse bei uns registrieren.
        </p>
        
        <p>
            Bitte geben Sie die folgenden Daten an, um mit Ihrer Reservierung fortzufahren:
        </p>
        
        <p>
            <label for="email">E-Mail-Adresse *</label>
            <input type="email" id="email" name="email" required="required" value="{..post_email..}">
        </p>
        <p>
            <label for="prename">Vorname *</label>
            <input type="text" id="prename" name="prename" pattern="[a-zA-Z ]{2,50}" maxlength="50" required="required" value="{..post_prename..}">
        </p>
        <p>
            <label for="lastname">Nachname *</label>
            <input type="text" id="lastname" name="lastname" pattern="[a-zA-Z ]{2,50}" maxlength="50" required="required" value="{..post_lasname..}">
        </p>
        <p class="small">
            * Pflichtfeld
        </p>

        <button class="pointer" type="submit" name="sended" value="1">weiter zur Online-Reservierung</button>
        <button class="pointer" type="reset">zur�cksetzen</button>
   </fieldset>

</form>
<!--section-end::MAILFORM-->