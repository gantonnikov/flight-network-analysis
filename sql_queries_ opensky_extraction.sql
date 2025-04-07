
--- check data --- 

DESCRIBE osky.flights_data4;


SELECT 
  year(from_unixtime(firstseen)) AS year,
  COUNT(*) AS num_flights
FROM osky.flights_data4
GROUP BY year(from_unixtime(firstseen))
ORDER BY year(from_unixtime(firstseen));



SELECT estdepartureairport AS airport, COUNT(*) AS departures
FROM osky.flights_data4
WHERE firstseen BETWEEN to_unixtime(TIMESTAMP '2019-09-09 00:00:00') 
                    AND to_unixtime(TIMESTAMP '2019-09-15 23:59:59')
AND estdepartureairport IN (
  'UUEE','UUDD','UUWW','ULLI','UKBB','UKKK','UMMS','LUKK',
  'EVRA','EYVI','EETN','EPWA','LKPR','LROP',
  'LTFM','OTHH','OMDB','UAAA','UGTB','UTTT',
  'LFPG','EDDF','EHAM','EGLL','EDDM'
)
GROUP BY estdepartureairport
ORDER BY departures DESC;



SELECT estdepartureairport AS airport, COUNT(*) AS departures
FROM osky.flights_data4
WHERE firstseen BETWEEN to_unixtime(TIMESTAMP '2024-09-09 00:00:00') 
                    AND to_unixtime(TIMESTAMP '2024-09-15 23:59:59')
AND estdepartureairport IN (
  'UUEE','UUDD','UUWW','ULLI','UKBB','UKKK','UMMS','LUKK',
  'EVRA','EYVI','EETN','EPWA','LKPR','LROP',
  'LTFM','OTHH','OMDB','UAAA','UGTB','UTTT',
  'LFPG','EDDF','EHAM','EGLL','EDDM'
)
GROUP BY estdepartureairport
ORDER BY departures DESC;



SELECT 
  estdepartureairport AS airport,
  COUNT(*) AS total_flights,
  SUM(CASE WHEN estarrivalairport IS NULL THEN 1 ELSE 0 END) AS arrival_nulls,
  SUM(CASE WHEN estarrivalairport IS NOT NULL THEN 1 ELSE 0 END) AS arrival_filled
FROM osky.flights_data4
WHERE firstseen BETWEEN to_unixtime(TIMESTAMP '2024-09-09 00:00:00') 
                    AND to_unixtime(TIMESTAMP '2024-09-15 23:59:59')
AND estdepartureairport IN (
  'UUEE','UUDD','UUWW','ULLI','UKBB','UKKK','UMMS','LUKK',
  'EVRA','EYVI','EETN','EPWA','LKPR','LROP',
  'LTFM','OTHH','OMDB','UAAA','UGTB','UTTT',
  'LFPG','EDDF','EHAM','EGLL','EDDM'
)
GROUP BY estdepartureairport
ORDER BY total_flights DESC;

--- download csv --- 

SELECT 
  estdepartureairport,
  estarrivalairport,
  COUNT(*) AS flights
FROM osky.flights_data4
WHERE firstseen BETWEEN to_unixtime(TIMESTAMP '2019-09-09 00:00:00') 
                    AND to_unixtime(TIMESTAMP '2019-09-15 23:59:59')
AND estdepartureairport IS NOT NULL
AND estarrivalairport IS NOT NULL
GROUP BY estdepartureairport, estarrivalairport;



SELECT 
  estdepartureairport,
  estarrivalairport,
  COUNT(*) AS flights
FROM osky.flights_data4
WHERE firstseen BETWEEN to_unixtime(TIMESTAMP '2024-09-09 00:00:00') 
                    AND to_unixtime(TIMESTAMP '2024-09-15 23:59:59')
AND estdepartureairport IS NOT NULL
AND estarrivalairport IS NOT NULL
GROUP BY estdepartureairport, estarrivalairport;



SELECT 
  estdepartureairport,
  estarrivalairport,
  COUNT(*) AS flights
FROM osky.flights_data4
WHERE firstseen BETWEEN to_unixtime(TIMESTAMP '2019-09-09 00:00:00') 
                    AND to_unixtime(TIMESTAMP '2019-09-15 23:59:59')
AND (
  (estdepartureairport IS NOT NULL AND estarrivalairport IS NULL) OR
  (estdepartureairport IS NULL AND estarrivalairport IS NOT NULL)
)
GROUP BY estdepartureairport, estarrivalairport;


SELECT 
  estdepartureairport,
  estarrivalairport,
  COUNT(*) AS flights
FROM osky.flights_data4
WHERE firstseen BETWEEN to_unixtime(TIMESTAMP '2024-09-09 00:00:00') 
                    AND to_unixtime(TIMESTAMP '2024-09-15 23:59:59')
AND (
  (estdepartureairport IS NOT NULL AND estarrivalairport IS NULL) OR
  (estdepartureairport IS NULL AND estarrivalairport IS NOT NULL)
)
GROUP BY estdepartureairport, estarrivalairport;
