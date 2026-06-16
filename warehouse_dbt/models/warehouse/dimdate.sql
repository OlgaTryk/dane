WITH dates AS(
    SELECT generate_series(
        date '2025-1-1',
        date '2035-12-31',
        interval '1 day'
    )::date AS fulldate
)

SELECT
    TO_CHAR(fulldate, 'YYYYMMDD') AS datekey,
    fulldate,
    EXTRACT(day FROM fulldate) AS day,
    CASE
        WHEN CAST(EXTRACT(isodow FROM fulldate) AS int) = 1 THEN 'Poniedziałek'
        WHEN CAST(EXTRACT(isodow FROM fulldate) AS int) = 2 THEN 'Wtorek'
        WHEN CAST(EXTRACT(isodow FROM fulldate) AS int) = 3 THEN 'Środa'
        WHEN CAST(EXTRACT(isodow FROM fulldate) AS int) = 4 THEN 'Czwartek'
        WHEN CAST(EXTRACT(isodow FROM fulldate) AS int) = 5 THEN 'Piątek'
        WHEN CAST(EXTRACT(isodow FROM fulldate) AS int) = 6 THEN 'Sobota'
        ELSE 'Niedziela'
    END AS dayoftheweek,
    EXTRACT(month FROM fulldate) AS month,
    EXTRACT(quarter FROM fulldate) AS quarter,
    EXTRACT(year FROM fulldate) AS year,
    CASE
        WHEN EXTRACT(month FROM fulldate) IN (12, 1, 2) THEN 'Zima'
        WHEN EXTRACT(month FROM fulldate) IN (3, 4, 5) THEN 'Wiosna'
        WHEN EXTRACT(month FROM fulldate) IN (6, 7, 8) THEN 'Lato'
        ELSE 'Jesień'
    END AS season,
    EXTRACT(isodow FROM fulldate) IN (6, 7) AS isweekend
FROM dates