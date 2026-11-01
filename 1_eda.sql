-- Uppgift 1 - Grundläggande EDA
-- Tabell: myh_2025 (MYH Tabell 3, ansökningsomgång 2025, 1184 ansökningar)
-- En rad = en ansökan (unikt diarienummer)

SET SQLFORMAT ansiconsole

PROMPT
PROMPT a) Antal ansökningar per utbildningsområde, sorterat på flest ansökningar
SELECT
    utbildningsomrade,
    COUNT(*) AS antal_ansokningar
FROM myh_2025
GROUP BY utbildningsomrade
ORDER BY antal_ansokningar DESC;

PROMPT
PROMPT b) Antal BEVILJADE ansökningar per utbildningsområde
SELECT
    utbildningsomrade,
    COUNT(*) AS antal_beviljade
FROM myh_2025
WHERE beslut = 'Beviljad'
GROUP BY utbildningsomrade
ORDER BY antal_beviljade DESC;

PROMPT
PROMPT c) Antal AVSLAGNA ansökningar per utbildningsområde
SELECT
    utbildningsomrade,
    COUNT(*) AS antal_avslagna
FROM myh_2025
WHERE beslut = 'Avslag'
GROUP BY utbildningsomrade
ORDER BY antal_avslagna DESC;

PROMPT
PROMPT d) Antal BEVILJADE ansökningar per utbildningsnamn inom Data/IT
SELECT
    utbildningsnamn,
    COUNT(*) AS antal_beviljade
FROM myh_2025
WHERE utbildningsomrade = 'Data/IT'
  AND beslut = 'Beviljad'
GROUP BY utbildningsnamn
ORDER BY antal_beviljade DESC, utbildningsnamn;

PROMPT
PROMPT e) Antal AVSLAGNA ansökningar per utbildningsnamn inom Data/IT
SELECT
    utbildningsnamn,
    COUNT(*) AS antal_avslagna
FROM myh_2025
WHERE utbildningsomrade = 'Data/IT'
  AND beslut = 'Avslag'
GROUP BY utbildningsnamn
ORDER BY antal_avslagna DESC, utbildningsnamn;

PROMPT
PROMPT f) Antal BEVILJADE ansökningar per utbildningsanordnare och utbildningsnamn inom Data/IT
SELECT
    utbildningsanordnare,
    utbildningsnamn,
    COUNT(*) AS antal_beviljade
FROM myh_2025
WHERE utbildningsomrade = 'Data/IT'
  AND beslut = 'Beviljad'
GROUP BY utbildningsanordnare, utbildningsnamn
ORDER BY antal_beviljade DESC, utbildningsanordnare, utbildningsnamn;

PROMPT
PROMPT g) Topp 5 län efter antal beviljade ansökningar
PROMPT    ('Flera kommuner' är inget län, utan ansökningar i flera kommuner, så de räknas bort)
SELECT
    lan,
    COUNT(*) AS antal_beviljade
FROM myh_2025
WHERE beslut = 'Beviljad'
  AND lan <> 'Flera kommuner'
GROUP BY lan
ORDER BY antal_beviljade DESC
FETCH FIRST 5 ROWS ONLY;

PROMPT
PROMPT h) Andel distans och andel bundna utbildningar inom respektive utbildningsområde
SELECT
    utbildningsomrade,
    COUNT(*) AS antal,
    CONCAT(ROUND(COUNT(CASE WHEN studieform = 'Distans' THEN 1 END) * 100 / COUNT(*), 1), ' %') AS andel_distans,
    CONCAT(ROUND(COUNT(CASE WHEN studieform = 'Bunden'  THEN 1 END) * 100 / COUNT(*), 1), ' %') AS andel_bunden
FROM myh_2025
GROUP BY utbildningsomrade
ORDER BY utbildningsomrade;

PROMPT
PROMPT i) Antal utbildningar som innehåller ordet AI
PROMPT    (LIKE är skiftlägeskänsligt i Oracle, så 'Chain' räknas inte med)
SELECT
    COUNT(*) AS antal_ai_utbildningar
FROM myh_2025
WHERE utbildningsnamn LIKE '%AI%';

EXIT
