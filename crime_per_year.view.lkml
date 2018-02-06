view: crime_per_year {
  derived_table: {
    sql:
      SELECT
        crime_copy.primary_type  AS crime_copy_primary_type,
        COUNT(*) AS crime_copy_count
      FROM chicago_dataset.crime_copy  AS crime_copy

      WHERE
        {% condition crime_per_year.year %} crime_copy.year {% endcondition %} AND
        {% condition crime_per_year.crime_type %} lOWER(crime_copy.primary_type) {% endcondition %}
      GROUP BY 1
      ORDER BY 1 DESC
      LIMIT 500
       ;;
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

  dimension: crime_copy_primary_type {
    type: string
    primary_key: yes
    sql: LOWER(${TABLE}.crime_copy_primary_type) ;;
  }

  dimension: crime_copy_count {
    type: number
    sql: ${TABLE}.crime_copy_count ;;
  }

  set: detail {
    fields: [crime_copy_primary_type, crime_copy_count]
  }

  measure: average_crime {
    type: sum
    sql: ${crime_copy_count} ;;
  }
}
