view: community_crime_yearly {
  derived_table: {
    sql:
      SELECT
        crime_copy.community_area AS community_area,
        crime_copy.primary_type  AS crime_copy_primary_type,
        COUNT(*) AS crime_copy_count
      FROM chicago_dataset.crime_copy  AS crime_copy
      WHERE
        {% condition community_crime_yearly.year %} crime_copy.year {% endcondition %} AND
        {% condition community_crime_yearly.crime_type %} lOWER(crime_copy.primary_type) {% endcondition %}
      GROUP BY 1, 2
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

  dimension: community_area {
    type: number
    sql: ${TABLE}.community_area ;;
  }

  dimension: crime_copy_primary_type {
    type: string
    primary_key: yes
    sql: ${TABLE}.crime_copy_primary_type ;;
  }

  measure: sum_crime_count {
    type: sum
    sql: ${crime_copy_count} ;;
  }

  measure: average_crime_rate {
    type: number
    sql: ${sum_crime_count} / 12.00 ;;
    value_format_name: decimal_2
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
        label: "BRIGHTcommunity_areaON PARK"
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
    }
  }

  dimension: crime_copy_count {
    type: number
    sql: ${TABLE}.crime_copy_count ;;
  }

  set: detail {
    fields: [community_area, crime_copy_primary_type, crime_copy_count]
  }
}
