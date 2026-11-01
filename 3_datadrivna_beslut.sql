-- Uppgift 3 - Datadrivna beslut för The Skool
-- Frågorna bygger på stakeholder-intervjun (se notes/intervjuanteckningar.md).
-- The Skool är nystartad, vill söka 2-3 utbildningar och "pricka rätt",
-- eftersom varje ansökan kostar mycket.
-- Beviljandegrad = andel av ansökningarna som blev beviljade.

SET SQLFORMAT ansiconsole

PROMPT
PROMPT Fråga 1: Vilka utbildningsområden har högst beviljandegrad?
PROMPT Varför: Stakeholdern vill veta vilket område man ska rikta in sig mot.
PROMPT Data/IT får många ansökningar men många avslag, så andra områden kan vara säkrare.
SELECT
    utbildningsomrade,
    COUNT(*) AS antal_ansokningar,
    COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) AS antal_beviljade,
    CONCAT(ROUND(COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) * 100 / COUNT(*), 1), ' %') AS beviljandegrad
FROM myh_2025
GROUP BY utbildningsomrade
ORDER BY COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) / COUNT(*) DESC;

PROMPT
PROMPT Fråga 2: Har distans eller platsbunden utbildning högst beviljandegrad?
PROMPT Varför: The Skool kan hyra lokal för platsbunden utbildning. Om distans
PROMPT oftare får avslag är det ett argument för att satsa platsbundet.
SELECT
    studieform,
    COUNT(*) AS antal_ansokningar,
    COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) AS antal_beviljade,
    CONCAT(ROUND(COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) * 100 / COUNT(*), 1), ' %') AS beviljandegrad
FROM myh_2025
GROUP BY studieform
ORDER BY studieform;

PROMPT
PROMPT Fråga 3: Hur fördelar sig SeQF-nivåerna och vilken nivå har högst beviljandegrad?
PROMPT Varför: Nivå 5 verkar vanligast. Finns det en lucka på högre nivå (6)
PROMPT med mindre konkurrens och bra chans att bli beviljad?
SELECT
    NVL(TO_CHAR(seqf_niva), 'Ingen') AS seqf_niva,
    COUNT(*) AS antal_ansokningar,
    COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) AS antal_beviljade,
    CONCAT(ROUND(COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) * 100 / COUNT(*), 1), ' %') AS beviljandegrad
FROM myh_2025
GROUP BY NVL(TO_CHAR(seqf_niva), 'Ingen')
ORDER BY seqf_niva;

PROMPT
PROMPT Fråga 4: Lyckas privata anordnare eller kommuner bäst?
PROMPT Varför: The Skool är en privat aktör. Stakeholdern ville veta om privat
PROMPT eller kommun är bättre, så att The Skool vet vilka de konkurrerar med.
SELECT
    huvudmannatyp,
    COUNT(*) AS antal_ansokningar,
    COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) AS antal_beviljade,
    CONCAT(ROUND(COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) * 100 / COUNT(*), 1), ' %') AS beviljandegrad
FROM myh_2025
GROUP BY huvudmannatyp
ORDER BY antal_ansokningar DESC;

PROMPT
PROMPT Fråga 5: Blir Data/IT-utbildningar med AI i namnet oftare beviljade?
PROMPT Varför: Stakeholdern frågade om man kan göra en utbildning mer attraktiv,
PROMPT till exempel genom att styra en programmeringsutbildning mot AI.
SELECT
    CASE WHEN utbildningsnamn LIKE '%AI%' THEN 'AI i namnet' ELSE 'Utan AI' END AS typ,
    COUNT(*) AS antal_ansokningar,
    COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) AS antal_beviljade,
    CONCAT(ROUND(COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) * 100 / COUNT(*), 1), ' %') AS beviljandegrad
FROM myh_2025
WHERE utbildningsomrade = 'Data/IT'
GROUP BY CASE WHEN utbildningsnamn LIKE '%AI%' THEN 'AI i namnet' ELSE 'Utan AI' END;

EXIT
