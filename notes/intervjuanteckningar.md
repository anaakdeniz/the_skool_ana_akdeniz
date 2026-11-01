# Intervjuanteckningar – stakeholder-intervju (uppgift 2)

Intervju med domänexpert om MYH:s ansökningsomgång 2025, 21 oktober 2026.
Anteckningarna är sammanställda med hjälp av klasskamraters delade anteckningar
([Louise Beech](https://github.com/louisebeech91/the_skool_louise_beech/blob/main/notes/stakeholder_interview.md)).

## Utgångsläge för The Skool
- Nystartad utbildningsanordnare som vill börja med 2–3 utbildningar.
- Det kostar mycket att ansöka, så man vill "pricka rätt" och inte skicka många ansökningar.
- Det finns pengar och möjlighet att hyra lokal för platsbunden utbildning.
- Orten spelar ingen roll, The Skool är inte geografiskt bunden.

## Vad stakeholdern vill veta
- Vilka utbildningsområden som har hög respektive låg beviljandegrad.
- Data/IT har många ansökningar men många avslag – är andra områden bättre för en ny aktör?
- Om distans eller platsbunden utbildning oftare blir beviljad.
- SeQF 5 är vanligast – finns det luckor på högre nivåer?
- Kan man göra en utbildning mer attraktiv, till exempel genom att rikta den mot AI?
- Är privata anordnare eller kommuner bättre på vissa områden?
- Hur många omgångar och platser brukar beviljas per utbildning?

## Hur det kopplar till datan (Tabell 3)
| Fråga från intervjun | Kolumner i datan |
| --- | --- |
| Beviljandegrad per område | `utbildningsomrade`, `beslut` |
| Distans eller bunden | `studieform`, `beslut` |
| SeQF-nivå | `seqf_niva`, `beslut` |
| Privat eller kommun | `huvudmannatyp`, `beslut` |
| AI-inriktning | `utbildningsnamn`, `beslut` |
| Omgångar och platser | `beviljade_omgangar`, `beviljade_platser_totalt` |

Frågorna används i uppgift 3 (`3_datadrivna_beslut.sql`).
