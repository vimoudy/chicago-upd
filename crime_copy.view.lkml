view: crime_copy {
  sql_table_name: chicago_dataset.crime_copy ;;

  dimension: arrest {
    type: yesno
    sql: ${TABLE}.arrest ;;
  }

  dimension: beat {
    type: number
    sql: ${TABLE}.beat ;;
  }

  dimension: block {
    type: string
    sql: ${TABLE}.block ;;
  }

  dimension: case_number {
    type: string
    sql: ${TABLE}.case_number ;;
  }

  dimension: community_area {
    type: number
    sql: ${TABLE}.community_area ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.date ;;convert_tz: no
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: district {
    type: number
    sql: ${TABLE}.district ;;
  }

  dimension: domestic {
    type: yesno
    sql: ${TABLE}.domestic ;;
  }

  dimension: fbi_code {
    type: string
    sql: ${TABLE}.fbi_code ;;
  }

  dimension: iucr {
    type: string
    sql: ${TABLE}.iucr ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: location_description {
    type: string
    sql: ${TABLE}.location_description ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: primary_type {
    type: string
    sql: LOWER(${TABLE}.primary_type) ;;
  }

  dimension: unique_key {
    type: number
    primary_key: yes
    sql: ${TABLE}.unique_key ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.updated_on ;;
  }

  dimension: ward {
    type: number
    sql: ${TABLE}.ward ;;
  }

  dimension: x_coordinate {
    type: number
    sql: ${TABLE}.x_coordinate ;;
  }

  dimension: y_coordinate {
    type: number
    sql: ${TABLE}.y_coordinate ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  dimension: crime_location {
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: monthly_average {
    type: number
    sql: (${count} / 12.00) ;;
    value_format_name: decimal_2
  }
}
