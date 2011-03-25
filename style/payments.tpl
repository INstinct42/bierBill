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

<!--section-start::HISTORY-->
<h3>Zahlungs-History</h3>
<table width="100%">
    <tr class="left">
        <th>Datum</th><th>von</th><th>an</th><th>Betrag</th><th>Status</th><th>Aktionen</th>
    </tr>
    {..lines..}           
</table>
<!--section-end::HISTORY-->
<!--section-start::HISTORY_LINE-->   
    <tr>
        <td>{..date..}</td><td>{..from..}</td><td>{..to..}</td><td class="right" style="color:green;">{..amount..}&nbsp;€</td><td>{..state..}</td><td>{..actions..}</td>
    </tr>
<!--section-end::HISTORY_LINE-->

<!--section-start::INCOMING-->
<h3>Neu erhaltene Zahlungen</h3>
<table width="100%">
    <tr class="left">
        <th>Datum</th><th>Geber</th><th>Betrag</th><th>Aktionen</th>
    </tr>
    {..lines..}           
</table>
<!--section-end::INCOMING-->
<!--section-start::INCOMING_LINE-->   
    <tr>
        <td>{..date..}</td><td>{..from..}</td><td class="right" style="color:green;">{..amount..}&nbsp;€</td><td>{..actions..}</td>
    </tr>
<!--section-end::INCOMING_LINE-->

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
{..incoming..}
{..history..}

<!--section-end::ALL-->
