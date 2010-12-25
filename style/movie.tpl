<!--section-start::MOVIE-->
<img src="{..img_url..}" alt="Filmplakat zu &quot;{..title..}&quot;" align="right">
<h3>{..title..}</h3>
<p class="small">
    von {..director..}<br>
    mit {..actors..}<br>
    L�nge: {..length..}, Jahr: {..year..}, in {..type..}<br>
    {..extra_charge..}
</p>
<p>
    {..text..}
</p>
<!--section-end::MOVIE-->

<!--section-start::MOVIE_MINI-->
<h3>{..title..}</h3>
<p class="small">
    von {..director..}<br>
    mit {..actors..}<br>
    L�nge: {..length..}, Jahr: {..year..}, in {..type..}<br>
    {..extra_charge..}
</p>
<!--section-end::MOVIE_MINI-->

<!--section-start::NO_MOVIES-->
<h3>Keine Filme gefunden</h3>
<p>
    Es konnten leider (noch) keine Film gefunden werden, die demn�chst im High Noon gezeigt werden.
</p>
<p>
    Bitte beachten Sie, dass �ber das kommende Programm h�ufig erst kurzfristig entschieden wird!
</p>
<!--section-end::NO_MOVIES-->

<!--section-start::NO_SHOWS-->
<h3>Keine Vorstellungen gefunden</h3>
<p>
    Es konnten leider keine Vorstellungen f�r den angegebenen Zeitraum gefunden werden.
</p>
<p>
    Bitte beachten Sie, dass das Programm f�r n�chste Woche immer erst ab Montag verf�gbar ist!
</p>
<!--section-end::NO_SHOWS-->



<!--section-start::TIMETABLE-->
<h4 class="timetable">Vorstellungen</h4>
{..show_weeks..}
<p>&nbsp;</p>
<!--section-end::TIMETABLE-->

<!--section-start::SHOW_WEEK-->
<h5 class="timetable">Woche vom {..start..} - {..end..}</h5>
<table class="contenttable timetable">
    <tr>
        <th>Do<br><span class="small">{..do_date..}</span></th>
        <th>Fr<br><span class="small">{..fr_date..}</span></th>
        <th>Sa<br><span class="small">{..sa_date..}</span></th>
        <th>So<br><span class="small">{..so_date..}</span></th>
        <th>Mo<br><span class="small">{..mo_date..}</span></th>
        <th>Di<br><span class="small">{..di_date..}</span></th>
        <th>Mi<br><span class="small">{..mi_date..}</span></th>
    </tr>
    <tr>
        <td>{..do_times..}</td>
        <td>{..fr_times..}</td>
        <td>{..sa_times..}</td>
        <td>{..so_times..}</td>
        <td>{..mo_times..}</td>
        <td>{..di_times..}</td>
        <td>{..mi_times..}</td>
    </tr>
</table>
<p></p>
<!--section-end::SHOW_WEEK-->

<!--section-start::SHOW--><a href="{..url..}">{..time..}&nbsp;Uhr</a><!--section-end::SHOW-->
<!--section-start::SHOW_OLD--><span class="old">{..time..}&nbsp;Uhr</span><!--section-end::SHOW_OLD-->
<!--section-start::SHOW_SEPARATOR--><br><!--section-end::SHOW_SEPARATOR-->