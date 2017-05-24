connection: "chicago_upd"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"


explore: crime_copy {
  persist_for: "24 hours"
  hidden: yes
}

explore: crime_per_year {
  persist_for: "24 hours"
  hidden: yes
}

explore: max_crime_community {
  persist_for: "24 hours"
  hidden: yes
}

explore: long_lat_crime {
  persist_for: "24 hours"
  hidden: yes
}

explore: community_crime_yearly {
  persist_for: "24 hours"
  hidden: yes
}

explore: month_crime_type {
  persist_for: "24 hours"
  hidden: yes
}

explore: community_dates {
  persist_for: "24 hours"
  hidden: yes
}
