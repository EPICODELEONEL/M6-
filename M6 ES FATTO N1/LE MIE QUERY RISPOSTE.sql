/*--soluzione 1 domanda--*/

select avg(Superficie) as superficie_media, CodA, Indirizzo, Città
from alloggio
where Superficie > (select avg(Superficie) from alloggio)
group by CodA, Indirizzo, Città;

/*--soluzione 2 domanda--*/

SELECT dipendente.Did,dipendente.DNome,aereo.Autonomia
FROM dipendente
INNER JOIN aereo ON dipendente.Did = aereo.Aid
where `Autonomia`>5
GROUP BY `Did`,`DNome`,`Autonomia`;

/*--soluzione 3 domanda--*/
select fornitori.Codf,fornitori.NomeF,prodotti.NomeP
FROM fornitori
inner join prodotti on fornitori.Codf = prodotti.Codp
where Nomep in ('Maglietta','Giacca','Felpa')
group by Codf,NomeF,NomeP;