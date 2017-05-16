connection: "chicago_upd"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"


explore: crime_copy {
  persist_for: "24 hours"
}

explore: stations {}

explore: derived_test {}

explore: crime_per_year {
  persist_for: "24 hours"
}

explore: max_crime_community {
  persist_for: "24 hours"
}

explore: long_lat_crime {
  persist_for: "24 hours"
}
