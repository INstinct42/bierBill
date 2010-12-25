<!--section-start::SELECT_SHOW-->
<h2>Verwaltung</h2>
<a href="{..last..}" class="atleft">� vorherige Woche anzeigen</a>
<a href="{..next..}" class="atright">n�chste Woche anzeigen �</a>
<br clear="right">
<p class="center">
    <a href="?go=admin">� aktuelle Woche anzeigen �</a><br>
</p>
<h5>Woche {..number..} vom {..start..} - {..end..}</h5>
{..movies..}
<p class="right">
    <a href="?go=logout">Logout</a>
</p>
<!--section-end::SELECT_SHOW-->

<!--section-start::SHOW-->
<h2>Verwaltung</h2>
<p class="right"><a href="{..url..}">zur�ck zur Wochen�bersicht</a></p>
<p>
    Hier k�nnen Sie die Verk�ufe und Reservierungen der folgenden Vorstellung einsehen und l�schen.
</p>
{..message..}
{..show_info..}
{..reset..}
{..reservations..}
{..sales..}
<!--section-end::SHOW-->

<!--section-start::SHOW_SALES-->
<h3>Verk�ufe</h3>
<table class="contenttable">
    <tr>
        <th>Name</th>
        <th>E-Mail</th>
        <th>Anzahl</th>
        <th>Preis</th>
        <th>Pl�tze</th>
        <th>L�schen</th>
    </tr>
    {..bookings..}
</table>
<!--section-end::SHOW_SALES-->

<!--section-start::SHOW_RESERVATIONS-->
<h3>Reservierungen</h3>
<table class="contenttable">
    <tr>
        <th>Name</th>
        <th>E-Mail</th>
        <th>Anzahl</th>
        <th>Preis</th>
        <th>Pl�tze</th>
        <th>L�schen</th>
    </tr>
    {..bookings..}
</table>
<!--section-end::SHOW_RESERVATIONS-->

<!--section-start::BOOKING-->
    <tr>
        <td>{..lastname..}, {..prename..}</td>
        <td>{..email..}</td>
        <td>{..num_seats..}</td>
        <td>{..price..}</td>
        <td>{..seats..}</td>
        <td>
            <a href="{..delete_url..}" class="img">
                <img src="style/icons/delete.gif" alt="l�schen" title="l�schen">
            </a>
        </td>
    </tr>
<!--section-end::BOOKING-->

<!--section-start::RESET-->
<h3>Vorstellung zur�cksetzen</h3>
<p>
    Hier k�nnen Sie die Vorstellung komplett zur�cksetzen. Achtung: Dabei werden alle Reservierungen und Verk�ufe unwiderruflich gel�scht!
</p>
<form id="show_reset" action="?go=admin&id={..show_id..}" method="post">
    <fieldset>
        <p class="center">
            <button class="pointer" type="submit" name="reset" value="1">Vorstellung zur�cksetzen</button>
        </p>
    </fieldset>
</form>
<!--section-end::RESET-->

<!--section-start::MESSAGE-->
<h3>{..title..}</h3>
<p>
    {..text..}
</p>
<!--section-end::MESSAGE-->

<!--section-start::LOGIN-->
<h2>Verwaltung</h2>
<p>
    Bitte geben Sie Ihre Zugangsdaten ein.
</p>
{..error..}
<form action="?go=admin" method="post">
    <fieldset>
        <h4>Benutzername</h4>
        <input type="text" name="admin_name" maxlength="50">
        
        <h4>Passwort</h4>
        <input type="password" name="admin_pw" maxlength="50">
        
        <p>
            <button class="pointer" type="submit" name="login" value="1">Login</button>
        </p>
   </fieldset>
</form>
<!--section-end::LOGIN-->

<!--section-start::LOGIN_ERROR-->
<h3>Es trat ein Fehler auf...</h3>
<p>
    Der Benutzer existiert nicht oder das Passwort ist falsch. Versuchen Sie es erneut.
</p>
<!--section-end::LOGIN_ERROR-->

<!--section-start::LOGOUT-->
<h2>Verwaltung</h2>
<p>
    Sie sind nun wieder ausgeloggt.
</p>
<p>
    <a href="?go=admin">zur�ck zum Login</a>
</p>
<!--section-end::LOGOUT-->