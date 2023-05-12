/* la mia risposta domanda 1*/
SELECT studente.NomeStudente, concorsomaster.SettoreScientifico
FROM studente 
JOIN partecipaconcorsomaster ON partecipaconcorsomaster.MatricolaStudente = studente.Matricola
JOIN concorsomaster  ON partecipaconcorsomaster.CodiceMaster = concorsomaster.CodiceMaster
GROUP BY studente.Matricola
HAVING COUNT(partecipaconcorsomaster.CodiceMaster) = 3;

/* la mia risposta domanda 2*/

select concorsomaster.NumPostiDisponibili AS numeroconcorsimaster,concorsomaster.DataPubblicazione,dipartimento.NomeDipartimento,dipartimento.SettoreScientifico
FROM concorsomaster
inner join dipartimento on concorsomaster.CodiceDipartimento = dipartimento.CodiceDipartimento
where NumPostiDisponibili >7 and DataPubblicazione > '2021-12-31'
group by NumPostiDisponibili,SettoreScientifico,NomeDipartimento,DataPubblicazione;

/* la mia risposta domanda 3*/

SELECT studente.VotoLaurea, studente.NomeStudente, partecipaconcorsomaster.CodiceMaster, concorsomaster.DataPubblicazione
FROM studente
JOIN partecipaconcorsomaster ON partecipaconcorsomaster.MatricolaStudente = studente.Matricola
JOIN concorsomaster ON partecipaconcorsomaster.CodiceMaster = concorsomaster.CodiceMaster
WHERE studente.VotoLaurea > 100 AND YEAR(concorsomaster.DataPubblicazione) = 2021
GROUP BY studente.NomeStudente, studente.VotoLaurea, partecipaconcorsomaster.CodiceMaster, concorsomaster.DataPubblicazione;

