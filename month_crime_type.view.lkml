view: month_crime_type {
  derived_table: {
    sql: SELECT
        FORMAT_TIMESTAMP('%Y-%m', crime_copy.date ) AS crime_copy_date_month,
        COUNT(*) AS crime_copy_count
      FROM chicago_dataset.crime_copy  AS crime_copy
      WHERE
        {% condition month_crime_type.year %} crime_copy.year {% endcondition %} AND
        {% condition month_crime_type.crime_type %} lOWER(crime_copy.primary_type) {% endcondition %}
      GROUP BY 1
      ORDER BY 1 ASC
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

  dimension: crime_copy_date_month {
    type: string
    sql: ${TABLE}.crime_copy_date_month ;;
  }

  dimension: crime_copy_count {
    type: number
    sql: ${TABLE}.crime_copy_count ;;
  }

  measure: median {
    type: median
    sql: ${crime_copy_count} ;;
  }
  measure: max_month {
    type: number
    sql: MAX(${crime_copy_count}) ;;
  }
  set: detail {
    fields: [crime_copy_date_month, crime_copy_count]
  }
}
