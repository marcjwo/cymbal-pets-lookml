include: "/extensions/regions.view.lkml"
include: "/extensions/location.view.lkml"

view: distribution_centers {
  sql_table_name: `@{gcp_project}.@{bq_dataset}.distribution_centers` ;;
  fields_hidden_by_default: yes
  drill_fields: [distribution_center_id]
  extends: [regions,location]

  dimension: distribution_center_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.distribution_center_id ;;
  }
  dimension: address_city {
    hidden: no
    type: string
    sql: ${TABLE}.address_city ;;
  }
  dimension: address_state {
    hidden: no
    type: string
    sql: ${TABLE}.address_state ;;
    map_layer_name: us_states
  }
  dimension: distribution_center_name {
    hidden: no
    type: string
    sql: ${TABLE}.distribution_center_name ;;
  }
  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }
  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }
  measure: count {
    type: count
    drill_fields: [distribution_center_id, distribution_center_name, purchase_orders.count]
  }
}
