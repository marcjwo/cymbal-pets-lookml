view: stores {
  sql_table_name: `gemini-looker-demo-dataset.cymbal_pets.stores` ;;
  drill_fields: [store_id]

  dimension: store_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.store_id ;;
  }
  dimension: latitude {
    group_label: "Location"
    type: number
    sql: ${TABLE}.latitude ;;
  }
  dimension: longitude {
    group_label: "Location"
    type: number
    sql: ${TABLE}.longitude ;;
  }
  dimension: location {
    group_label: "Location"
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
  }
  dimension: city_state {
    group_label: "Location"
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: manager_id {
    type: number
    sql: ${TABLE}.manager_id ;;
  }
  dimension: opening_hours__friday {
    type: string
    sql: ${TABLE}.opening_hours.Friday ;;
    group_label: "Opening Hours"
    group_item_label: "Friday"
  }
  dimension: opening_hours__monday {
    type: string
    sql: ${TABLE}.opening_hours.Monday ;;
    group_label: "Opening Hours"
    group_item_label: "Monday"
  }
  dimension: opening_hours__saturday {
    type: string
    sql: ${TABLE}.opening_hours.Saturday ;;
    group_label: "Opening Hours"
    group_item_label: "Saturday"
  }
  dimension: opening_hours__sunday {
    type: string
    sql: ${TABLE}.opening_hours.Sunday ;;
    group_label: "Opening Hours"
    group_item_label: "Sunday"
  }
  dimension: opening_hours__thursday {
    type: string
    sql: ${TABLE}.opening_hours.Thursday ;;
    group_label: "Opening Hours"
    group_item_label: "Thursday"
  }
  dimension: opening_hours__tuesday {
    type: string
    sql: ${TABLE}.opening_hours.Tuesday ;;
    group_label: "Opening Hours"
    group_item_label: "Tuesday"
  }
  dimension: opening_hours__wednesday {
    type: string
    sql: ${TABLE}.opening_hours.Wednesday ;;
    group_label: "Opening Hours"
    group_item_label: "Wednesday"
  }
  dimension: store_name {
    type: string
    sql: ${TABLE}.store_name ;;
  }
  measure: count {
    type: count
    drill_fields: [store_id, store_name, orders.count]
  }
}
