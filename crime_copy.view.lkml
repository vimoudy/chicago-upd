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
      minute,
      minute10,
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

  dimension: community_name {
    type: string
    case: {
      when: {
        sql: ${community_area} = 35;;
        label: "DOUGLAS"
      }
      when: {
        sql: ${community_area} = 36  ;;
        label: "OAKLAND"
      }      when: {
        sql: ${community_area} = 75;;
        label: "MORGAN PARK"
      }      when: {
        sql: ${community_area} = 67;;
        label: "WEST ENGLEWOOD"
      }      when: {
        sql: ${community_area} = 71;;
        label: "AUBURN GRESHAM"
      }      when: {
        sql: ${community_area} = 77;;
        label: "EDGEWATER"
      }      when: {
        sql: ${community_area} = 74;;
        label: "MOUNT GREENWOOD"
      }      when: {
        sql: ${community_area} = 73;;
        label: "WASHINGTON HEIGHTS"
      }      when: {
        sql: ${community_area} = 72;;
        label: "BEVERLY"
      }      when: {
        sql: ${community_area} = 70;;
        label: "ASHBURN"
      }      when: {
        sql: ${community_area} = 68;;
        label: "ENGLEWOOD"
      }      when: {
        sql: ${community_area} = 9;;
        label: "EDISON PARK"
      }      when: {
        sql: ${community_area} = 69;;
        label: "GREATER GRAND CROSSING"
      }      when: {
        sql: ${community_area} = 66;;
        label: "CHICAGO LAWN"
      }      when: {
        sql: ${community_area} = 65;;
        label: "WEST LAWN"
      }      when: {
        sql: ${community_area} = 64;;
        label: "CLEARING"
      }      when: {
        sql: ${community_area} = 63;;
        label: "GAGE PARK"
      }      when: {
        sql: ${community_area} = 62;;
        label: "WEST ELSDON"
      }      when: {
        sql: ${community_area} = 61;;
        label: "NEW CITY"
      }      when: {
        sql: ${community_area} = 60;;
        label: "BRIDGEPORT"
      }      when: {
        sql: ${community_area} = 58;;
        label: "BRIGHTON PARK"
      }      when: {
        sql: ${community_area} = 57;;
        label: "ARCHER HEIGHTS"
      }      when: {
        sql: ${community_area} = 55;;
        label: "HEGEWISCH"
      }      when: {
        sql: ${community_area} = 54;;
        label: "RIVERDALE"
      }      when: {
        sql: ${community_area} = 51;;
        label: "SOUTH DEERING"
      }      when: {
        sql: ${community_area} = 50;;
        label: "PULLMAN"
      }      when: {
        sql: ${community_area} = 5;;
        label: "NORTH CENTER"
      }      when: {
        sql: ${community_area} = 49;;
        label: "ROSELAND"
      }      when: {
        sql: ${community_area} = 59;;
        label: "MCKINLEY PARK"
      }      when: {
        sql: ${community_area} = 48;;
        label: "CALUMET HEIGHTS"
      }      when: {
        sql: ${community_area} = 47;;
        label: "BURNSIDE"
      }      when: {
        sql: ${community_area} = 44;;
        label: "CHATHAM"
      }      when: {
        sql: ${community_area} = 32;;
        label: "LOOP"
      }      when: {
        sql: ${community_area} = 34;;
        label: "ARMOUR SQUARE"
      }      when: {
        sql: ${community_area} = 31;;
        label: "LOWER WEST SIDE"
      }      when: {
        sql: ${community_area} = 45;;
        label: "AVALON PARK"
      }      when: {
        sql: ${community_area} = 30;;
        label: "SOUTH LAWNDALE"
      }      when: {
        sql: ${community_area} = 29;;
        label: "NORTH LAWNDALE"
      }      when: {
        sql: ${community_area} = 28;;
        label: "NEAR WEST SIDE"
      }      when: {
        sql: ${community_area} = 27;;
        label: "EAST GARFIELD PARK"
      }      when: {
        sql: ${community_area} = 26;;
        label: "WEST GARFIELD PARK"
      }      when: {
        sql: ${community_area} = 24;;
        label: "WEST TOWN"
      }      when: {
        sql: ${community_area} = 23;;
        label: "HUMBOLDT PARK"
      }      when: {
        sql: ${community_area} = 22;;
        label: "LOGAN SQUARE"
      }      when: {
        sql: ${community_area} = 21;;
        label: "AVONDALE"
      }      when: {
        sql: ${community_area} = 20;;
        label: "HERMOSA"
      }      when: {
        sql: ${community_area} = 2;;
        label: "WEST RIDGE"
      }      when: {
        sql: ${community_area} = 19;;
        label: "BELMONT CRAGIN"
      }      when: {
        sql: ${community_area} = 18;;
        label: "MONTCLARE"
      }      when: {
        sql: ${community_area} = 16;;
        label: "IRVING PARK"
      }      when: {
        sql: ${community_area} = 15;;
        label: "PORTAGE PARK"
      }      when: {
        sql: ${community_area} = 14;;
        label: "ALBANY PARK"
      }      when: {
        sql: ${community_area} = 41;;
        label: "HYDE PARK"
      }      when: {
        sql: ${community_area} = 40;;
        label: "WASHINGTON PARK"
      }      when: {
        sql: ${community_area} = 4;;
        label: "LINCOLN SQUARE"
      }      when: {
        sql: ${community_area} = 39;;
        label: "KENWOOD"
      }      when: {
        sql: ${community_area} = 38;;
        label: "GRAND BOULEVARD"
      }      when: {
        sql: ${community_area} = 37;;
        label: "FULLER PARK"
      }      when: {
        sql: ${community_area} = 8 ;;
        label: "NEAR NORTH SIDE"
      }       when: {
        sql: ${community_area} = 45 ;;
        label: "AVALON PARK"
      }       when: {
        sql: ${community_area} = 25 ;;
        label: "AUSTIN"
      }       when: {
        sql: ${community_area} = 56 ;;
        label: "GARFIELD RIDGE"
      }      when: {
        sql: ${community_area} = 76 ;;
        label: "OHARE"
      }       when: {
        sql: ${community_area} = 1 ;;
        label: "ROGERS PARK"
      }       when: {
        sql: ${community_area} = 13 ;;
        label: "NORTH PARK"
      }       when: {
        sql: ${community_area} = 3 ;;
        label: "UPTOWN"
      }       when: {
        sql: ${community_area} = 11 ;;
        label: "JEFFERSON PARK"
      }       when: {
        sql: ${community_area} = 12 ;;
        label: "FOREST GLEN"
      }       when: {
        sql: ${community_area} = 42 ;;
        label: "WOODLAWN"
      }       when: {
        sql: ${community_area} = 43 ;;
        label: "SOUTH SHORE"
      }
      when: {
        sql: ${community_area} = 6 ;;
        label: "LAKE VIEW"
      }
      when: {
        sql: ${community_area} = 7 ;;
        label: "LINCOLN PARK"
      }
      when: {
        sql: ${community_area} = 10 ;;
        label: "NORWOOD PARK"
      }
      when: {
        sql: ${community_area} = 17 ;;
        label: "DUNNING"
      }
      when: {
        sql: ${community_area} = 33 ;;
        label: "NORTH SOUTH SIDE"
      }
      when: {
        sql: ${community_area} = 46 ;;
        label: "SOUTH CHICAGO"
      }
      when: {
        sql: ${community_area} = 52 ;;
        label: "EAST SIDE"
      }
      when: {
        sql: ${community_area} = 53 ;;
        label: "WEST PULLMAN"
      }
    }
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: count_distinct {
    type: count_distinct
    sql: ${community_name} ;;
  }

  measure: monthly_average {
    type: number
    sql: (${count} / 12.00) ;;
    value_format_name: decimal_2
  }
}
