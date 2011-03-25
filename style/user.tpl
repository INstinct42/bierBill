<!--section-start::LOGIN-->
<h2>Verwaltung</h2>
<p>
    Bitte geben Sie Ihre Zugangsdaten ein.
</p>
{..error..}
<form action="login.html" method="post">
    <fieldset>
        <h4>Benutzername</h4>
        <input type="text" name="user" maxlength="50">
        
        <h4>Passwort</h4>
        <input type="password" name="pass" maxlength="50">
        
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
    <a href="login.html">zurück zum Login</a>
</p>
<!--section-end::LOGOUT-->
