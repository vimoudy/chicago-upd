view: derived_test {
   derived_table: {
     sql:
      SELECT
        year,
        coldest_days,
        incidents_coldest,
        ROUND(incidents_coldest / coldest_days, 2) AS rate_coldest,
        middle_days,
        incidents_middle,
        ROUND(incidents_middle / middle_days, 2) AS rate_middle,
        hottest_days,
        incidents_hottest,
        ROUND(incidents_hottest / hottest_days, 2) AS rate_hottest
      FROM (
        SELECT
          w.year AS year,
          COUNTIF(rank <= 0.10) AS coldest_days,
          SUM(IF(rank <= 0.10, c.incidents, 0)) AS incidents_coldest,
          COUNTIF(rank > 0.10
            AND rank <= 90) AS middle_days,
          SUM(IF(rank > 0.10
              AND rank <= 90, c.incidents, 0)) AS incidents_middle,
          COUNTIF(rank > 0.90
            AND rank <= 90) AS hottest_days,
          SUM(IF(rank > 0.90, c.incidents, 0)) AS incidents_hottest
        FROM (
          SELECT
            TIMESTAMP_TRUNC(TIMESTAMP(CONCAT(year, '-', mo, '-', da)),
              DAY) AS date,
            year,
            PERCENT_RANK() OVER (PARTITION BY year ORDER BY AVG(temp)) AS rank,
            AVG(temp) AS temperature
          FROM
            `bigquery-public-data.noaa_gsod.gsod*` AS w
          JOIN
            `bigquery-public-data.noaa_gsod.stations` AS s
          ON
            w.stn = s.usaf
            AND s.name = "CHICAGO O'HARE INTERNATIONAL"
          WHERE
            w._TABLE_SUFFIX BETWEEN '2001'
            AND '2016'
          GROUP BY
            date,
            year ) AS w
        LEFT JOIN (
          SELECT
            TIMESTAMP_TRUNC(date,
              DAY) AS date,
            year,
            COUNT(1) AS incidents
          FROM
            `bigquery-public-data.chicago_crime.crime`
          WHERE
            primary_type IN ('BATTERY',
              'ASSAULT')
            AND year BETWEEN 2001
            AND 2016
          GROUP BY
            date,
            year ) AS c
        ON
          w.date = c.date
        GROUP BY
          year)
      ORDER BY
        year DESC
       ;;
  }

  dimension: year {
    type: string
    sql: ${TABLE}.year ;;
  }
}
