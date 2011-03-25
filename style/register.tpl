<!--section-start::NEW_USER-->
<h3>Neuen Benutzer anlegen</h3>
<p>
    Um an der Online-Abrechnung mit iBill teilnehmen zu k�nnen, ben�tigen Sie ein Benutzerkonto. Bitte geben Sie dazu ihren realen Namen und ihre g�ltige E-Mail-Adresse an. Au�erdem ben�tigen Sie zum Login einen Benutzernamen und ein Passwort, die Sie frei w�hlen k�nnen.
</p>
{..error..}
<form id="newuser" action="register.html" method="post">
    <fieldset>
        <h4>Ihr Name:</h4>
        <input type="text" name="new_real_name" pattern=".{3,255}" maxlength="255" list="funnynames" required>
        <span class="small">[min. 3, max. 255 Zeichen]</span>
        
        <h4>Ihr E-Mail-Adresse:</h4>
        <input type="email" name="new_mail" maxlength="255" required>
        <span class="small">[g�ltige E-Mail-Adresse]</span>
    
        <h4>Benutzername:</h4>
        <input type="text" name="new_name" pattern=".{3,100}" maxlength="100" required>
        <span class="small">[min. 3, max. 100 Zeichen]</span>
        
        <h4>Passwort:</h4>
        <input type="password" name="new_pass" pattern=".{6,100}" maxlength="100" required>
        <span class="small">[min. 6, max. 100 Zeichen]</span>
       
        <h4>Passwort wiederholen:</h4>
        <input type="password" name="wdh_pass" pattern=".{6,100}" maxlength="100" required>
        <span class="small">[min. 6, max. 100 Zeichen]</span>
        
        <datalist id="funnynames">
            <option>Jonas</option>
            <option>Thomas</option>
            <option>Moritz</option>
            <option>Simon</option>
        </datalist>
        <p>
            <button class="pointer" type="submit" name="register_send" value="1">Registrierung durchf�hren</button>
        </p>
   </fieldset>
</form>
<!--section-end::NEW_USER-->

<!--section-start::ERROR_USER-->
<h3 class="error_h">Es trat ein Fehler auf...</h3>
<p>
    Der angegebene Benutzername existiert bereits. Bitte w�hlen Sie einen anderen Benutzernamen.
</p>
<!--section-end::ERROR_USER-->

<!--section-start::ERROR_PASS-->
<h3 class="error_h">Es trat ein Fehler auf...</h3>
<p>
    Die angegebenen Passw�rter sind nicht gleich. Bitte geben Sie ihr gew�nschtes Passwort zweimal exakt gleich ein.
</p>
<!--section-end::ERROR_PASS-->

<!--section-start::ERROR_DATA-->
<h3 class="error_h">Es trat ein Fehler auf...</h3>
<p>
    Beim �berpr�fen der angegebenen Daten trat ein Fehler auf. Bitte �berpr�fen Sie, ob Sie ihren realen Namen und eine g�ltige E-Mail-Adresse eingegeben haben. Kontrollieren Sie auch, ob alle eingegebenen Daten den jeweiligen Bedinungen entsprechen.
</p>
<!--section-end::ERROR_DATA-->
