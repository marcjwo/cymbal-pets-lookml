include: "/extensions/regions.view.lkml"
include: "/extensions/location.view.lkml"

view: suppliers {
  sql_table_name: `@{gcp_project}.@{bq_dataset}.suppliers` ;;
  fields_hidden_by_default: yes
  drill_fields: [supplier_id]
  extends: [regions, location]

  dimension: supplier_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.supplier_id ;;
  }
  dimension: supplier_name {
    hidden: no
    type: string
    sql: ${TABLE}.supplier_name ;;
  }
  dimension: contact_name {
    type: string
    sql: ${TABLE}.contact_name ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
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

  dimension: phone_number {
    type: string
    sql: ${TABLE}.phone_number ;;
  }
  dimension: latitude {
    type: string
    sql: ${TABLE}.latitude ;;
  }
  dimension: longitude {
    type: string
    sql: ${TABLE}.longitude ;;
  }
  measure: count {
    type: count
    drill_fields: [supplier_id, contact_name, supplier_name, products.count]
  }
}
