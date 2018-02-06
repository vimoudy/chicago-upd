view: max_crime_community {
  derived_table: {
    sql:
      SELECT MAX(foo.crime_copy_count) as Max_Crime, foo.crime_copy_community_area
        FROM(
          SELECT
            crime_copy.community_area AS crime_copy_community_area,
            COUNT(*) AS crime_copy_count
          FROM chicago_dataset.crime_copy  AS crime_copy
          WHERE
            {% condition max_crime_community.year %} crime_copy.year {% endcondition %} AND
            {% condition max_crime_community.crime_type %} lOWER(crime_copy.primary_type) {% endcondition %}
          GROUP BY 1
          ORDER BY 2 ASC) as foo
      GROUP BY 2
      ORDER BY 1 DESC
      LIMIT 1
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

  dimension: max_crime {
    type: number
    sql: ${TABLE}.Max_Crime ;;
  }

  dimension: crime_copy_community_area {
    type: number
    sql: ${TABLE}.crime_copy_community_area ;;
  }

  dimension: community_name {
    type: string
    case: {
      when: {
        sql: ${crime_copy_community_area} = 35;;
        label: "DOUGLAS"
      }
      when: {
        sql: ${crime_copy_community_area} = 36  ;;
        label: "OAKLAND"
      }      when: {
        sql: ${crime_copy_community_area} = 75;;
        label: "MORGAN PARK"
      }      when: {
        sql: ${crime_copy_community_area} = 67;;
        label: "WEST ENGLEWOOD"
      }      when: {
        sql: ${crime_copy_community_area} = 71;;
        label: "AUBURN GRESHAM"
      }      when: {
        sql: ${crime_copy_community_area} = 77;;
        label: "EDGEWATER"
      }      when: {
        sql: ${crime_copy_community_area} = 74;;
        label: "MOUNT GREENWOOD"
      }      when: {
        sql: ${crime_copy_community_area} = 73;;
        label: "WASHINGTON HEIGHTS"
      }      when: {
        sql: ${crime_copy_community_area} = 72;;
        label: "BEVERLY"
      }      when: {
        sql: ${crime_copy_community_area} = 70;;
        label: "ASHBURN"
      }      when: {
        sql: ${crime_copy_community_area} = 68;;
        label: "ENGLEWOOD"
      }      when: {
        sql: ${crime_copy_community_area} = 9;;
        label: "EDISON PARK"
      }      when: {
        sql: ${crime_copy_community_area} = 69;;
        label: "GREATER GRAND CROSSING"
      }      when: {
        sql: ${crime_copy_community_area} = 66;;
        label: "CHICAGO LAWN"
      }      when: {
        sql: ${crime_copy_community_area} = 65;;
        label: "WEST LAWN"
      }      when: {
        sql: ${crime_copy_community_area} = 64;;
        label: "CLEARING"
      }      when: {
        sql: ${crime_copy_community_area} = 63;;
        label: "GAGE PARK"
      }      when: {
        sql: ${crime_copy_community_area} = 62;;
        label: "WEST ELSDON"
      }      when: {
        sql: ${crime_copy_community_area} = 61;;
        label: "NEW CITY"
      }      when: {
        sql: ${crime_copy_community_area} = 60;;
        label: "BRIDGEPORT"
      }      when: {
        sql: ${crime_copy_community_area} = 58;;
        label: "BRIGHTON PARK"
      }      when: {
        sql: ${crime_copy_community_area} = 57;;
        label: "ARCHER HEIGHTS"
      }      when: {
        sql: ${crime_copy_community_area} = 55;;
        label: "HEGEWISCH"
      }      when: {
        sql: ${crime_copy_community_area} = 54;;
        label: "RIVERDALE"
      }      when: {
        sql: ${crime_copy_community_area} = 51;;
        label: "SOUTH DEERING"
      }      when: {
        sql: ${crime_copy_community_area} = 50;;
        label: "PULLMAN"
      }      when: {
        sql: ${crime_copy_community_area} = 5;;
        label: "NORTH CENTER"
      }      when: {
        sql: ${crime_copy_community_area} = 49;;
        label: "ROSELAND"
      }      when: {
        sql: ${crime_copy_community_area} = 59;;
        label: "MCKINLEY PARK"
      }      when: {
        sql: ${crime_copy_community_area} = 48;;
        label: "CALUMET HEIGHTS"
      }      when: {
        sql: ${crime_copy_community_area} = 47;;
        label: "BURNSIDE"
      }      when: {
        sql: ${crime_copy_community_area} = 44;;
        label: "CHATHAM"
      }      when: {
        sql: ${crime_copy_community_area} = 32;;
        label: "LOOP"
      }      when: {
        sql: ${crime_copy_community_area} = 34;;
        label: "ARMOUR SQUARE"
      }      when: {
        sql: ${crime_copy_community_area} = 31;;
        label: "LOWER WEST SIDE"
      }      when: {
        sql: ${crime_copy_community_area} = 45;;
        label: "AVALON PARK"
      }      when: {
        sql: ${crime_copy_community_area} = 30;;
        label: "SOUTH LAWNDALE"
      }      when: {
        sql: ${crime_copy_community_area} = 29;;
        label: "NORTH LAWNDALE"
      }      when: {
        sql: ${crime_copy_community_area} = 28;;
        label: "NEAR WEST SIDE"
      }      when: {
        sql: ${crime_copy_community_area} = 27;;
        label: "EAST GARFIELD PARK"
      }      when: {
        sql: ${crime_copy_community_area} = 26;;
        label: "WEST GARFIELD PARK"
      }      when: {
        sql: ${crime_copy_community_area} = 24;;
        label: "WEST TOWN"
      }      when: {
        sql: ${crime_copy_community_area} = 23;;
        label: "HUMBOLDT PARK"
      }      when: {
        sql: ${crime_copy_community_area} = 22;;
        label: "LOGAN SQUARE"
      }      when: {
        sql: ${crime_copy_community_area} = 21;;
        label: "AVONDALE"
      }      when: {
        sql: ${crime_copy_community_area} = 20;;
        label: "HERMOSA"
      }      when: {
        sql: ${crime_copy_community_area} = 2;;
        label: "WEST RIDGE"
      }      when: {
        sql: ${crime_copy_community_area} = 19;;
        label: "BELMONT CRAGIN"
      }      when: {
        sql: ${crime_copy_community_area} = 18;;
        label: "MONTCLARE"
      }      when: {
        sql: ${crime_copy_community_area} = 16;;
        label: "IRVING PARK"
      }      when: {
        sql: ${crime_copy_community_area} = 15;;
        label: "PORTAGE PARK"
      }      when: {
        sql: ${crime_copy_community_area} = 14;;
        label: "ALBANY PARK"
      }      when: {
        sql: ${crime_copy_community_area} = 41;;
        label: "HYDE PARK"
      }      when: {
        sql: ${crime_copy_community_area} = 40;;
        label: "WASHINGTON PARK"
      }      when: {
        sql: ${crime_copy_community_area} = 4;;
        label: "LINCOLN SQUARE"
      }      when: {
        sql: ${crime_copy_community_area} = 39;;
        label: "KENWOOD"
      }      when: {
        sql: ${crime_copy_community_area} = 38;;
        label: "GRAND BOULEVARD"
      }      when: {
        sql: ${crime_copy_community_area} = 37;;
        label: "FULLER PARK"
      }      when: {
        sql: ${crime_copy_community_area} = 8 ;;
        label: "NEAR NORTH SIDE"
      }
    }
  }

  measure: highest_crime {
    type: max
    sql: ${max_crime} ;;
  }

  set: detail {
    fields: [max_crime, crime_copy_community_area]
  }
}
