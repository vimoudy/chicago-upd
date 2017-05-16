view: long_lat_crime {
  derived_table: {
    sql: SELECT
        crime_copy.date AS date,
        crime_copy.latitude AS latitude,
        crime_copy.longitude AS longitude,
        COUNT(*) AS crime_copy_count
      FROM chicago_dataset.crime_copy  AS crime_copy
      WHERE
        {% condition long_lat_crime.year %} crime_copy.year {% endcondition %} AND
        {% condition long_lat_crime.crime_type %} lOWER(crime_copy.primary_type) {% endcondition %} AND
        {% condition long_lat_crime.hood %} crime_copy.community_area {% endcondition %}
      GROUP BY 1, 2, 3
      ORDER BY 4 ASC
       ;;
  }

  filter: hood {
    type: number
  }

  filter: year {
    type: number
  }

  filter: crime_type {
    type: string
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.date ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: crime_copy_count {
    type: number
    sql: ${TABLE}.crime_copy_count ;;
  }

  dimension: location {
    type: location
    sql_latitude: ${TABLE}.latitude ;;
    sql_longitude: ${TABLE}.longitude ;;
  }

  measure: sum_count {
    type: sum
    sql: ${crime_copy_count} ;;
  }

  set: detail {
    fields: [latitude, longitude, crime_copy_count, location]
  }
}
