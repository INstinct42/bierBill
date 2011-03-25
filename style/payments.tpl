<!--section-start::ADD-->
<h3>Zahlung hinzufügen</h3>
<form action="?action=add" method="post">
    <label for="payee">Empänger:</label>
    <input id="payee" name="payee" type="text" size="25">
    <label for="amount">Betrag:</label>
    <input id="amount" name="amount" type="text" size="7">€
    <button name="add" value="1" class="pointer">Los</button><br>
    <label for="desc">Beschreibung:</label><br>
    <textarea id="desc" name="desc" type="text" rows="5" cols="55"></textarea>
</form>

<!--section-end::ADD-->

<!--section-start::ALL-->

<table width="100%"><tr valign="top"><td>
    <h3>Offene Beträge</h3>
    <table>
        <tr>
            <th>Opfer</th><th>Betrag (in €)</th>
        </tr>       
        <tr>
            <td>Thomas</td><td>33,01</td>
        </tr>       
        <tr>
            <td>Simon</td><td>12,42</td>
        </tr>        
        <tr>
            <td>Jonas</td><td>42,42</td>
        </tr>     
    </table>
</td><td>
    <h3>Schulden</h3>
    <table>
        <tr>
            <th>Gönner</th><th>Betrag (in €)</th>
        </tr>       
        <tr>
            <td>Hans</td><td style="color:red;">33,01</td>
        </tr>       
        <tr>
            <td>Jürgen</td><td style="color:red;">12,42</td>
        </tr>            
    </table>
</td></tr></table>

{..add..}


<table width="100%"><tr valign="top"><td>
    <h3>Eingang</h3>
    <table>
        <tr>
            <th>Geber</th><th>Betrag (in €)</th><th></th>
        </tr>       
        <tr>
            <td>Thomas</td><td>33,01</td><td><button>bestätigen</button></td>
        </tr>       
        <tr>
            <td>Simon</td><td>12,42</td><td><button>bestätigen</button></td>
        </tr>        
        <tr>
            <td>Jonas</td><td>42,42</td><td><button>bestätigen</button></td>
        </tr>     
    </table>
</td><td>
    <h3>Ausgang</h3>
    <table>
        <tr>
            <th>Empfänger</th><th>Betrag (in €)</th>
        </tr>       
        <tr>
            <td>Hans</td><td>33,01</td>
        </tr>       
        <tr>
            <td>Jürgen</td><td>12,42</td>
        </tr>            
    </table>
</td></tr></table>

<h3>Zahlungs-History</h3>
    <table>
        <tr>
            <th>Datum</th><th>von</th><th>an</th><th>Betrag (in €)</th><th>Status</th><th>Aktionen</th>
        </tr>       
        <tr>
            <td>01.01.2011</td><td>Thomas</td><td>Sie</td><td style="color:green;">33,01</td><td>unbestätigt</td><td><button>Jetzt bestätigen</button></td>
        </tr>       
        <tr>
            <td>01.01.2011</td><td>Ihnen</td><td>Hans</td><td style="color:red;">33,01</td><td>unbestätigt</td><td><button>Bestätigung anfordern</button></td>
        </tr>           
    </table>

<!--section-end::ALL-->
