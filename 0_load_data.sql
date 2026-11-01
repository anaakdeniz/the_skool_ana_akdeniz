-- Uppgift 0 e: ladda in MYH Tabell 3 (ansökningsomgång 2025) i Oracle
-- Datan: data/myh_2025.csv (Tabell 3, inforaderna överst borttagna,
-- kolumnnamn omdöpta till snake_case utan å/ä/ö)

DROP TABLE IF EXISTS myh_2025;

CREATE TABLE myh_2025 (
    utbildningsomrade          VARCHAR2(60 CHAR),
    sun5_inriktning            VARCHAR2(10 CHAR),
    sun5_inriktning_namn       VARCHAR2(120 CHAR),
    utbildningsnamn            VARCHAR2(150 CHAR),
    beslut                     VARCHAR2(20 CHAR),
    diarienummer               VARCHAR2(20 CHAR) PRIMARY KEY,
    flera_kommuner             VARCHAR2(5 CHAR),
    antal_kommuner             NUMBER,
    lan                        VARCHAR2(30 CHAR),
    kommun                     VARCHAR2(30 CHAR),
    yh_poang                   NUMBER,
    studieform                 VARCHAR2(20 CHAR),
    studietakt                 NUMBER,
    examenstyp                 VARCHAR2(50 CHAR),
    seqf_niva                  NUMBER,
    smalt_yrkesomrade          VARCHAR2(5 CHAR),
    utbildningsanordnare       VARCHAR2(120 CHAR),
    huvudmannatyp              VARCHAR2(20 CHAR),
    sokta_omgangar             NUMBER,
    beviljade_omgangar         NUMBER,
    sokta_platser_per_omgang   NUMBER,
    sokta_platser_totalt       NUMBER,
    beviljade_platser_omg1     NUMBER,
    beviljade_platser_omg2     NUMBER,
    beviljade_platser_omg3     NUMBER,
    beviljade_platser_omg4     NUMBER,
    beviljade_platser_omg5     NUMBER,
    beviljade_platser_totalt   NUMBER
);

LOAD myh_2025 data/myh_2025.csv

-- kontroll: ska bli 1184 rader
SELECT COUNT(*) AS antal_rader FROM myh_2025;

EXIT
