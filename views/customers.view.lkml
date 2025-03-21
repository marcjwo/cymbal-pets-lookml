include: "/extensions/regions.view.lkml"

view: customers {
  label: "Customers"
  sql_table_name: `@{gcp_project}.@{bq_dataset}.customers` ;;
  drill_fields: [customer_id]
  extends: [regions]
  fields_hidden_by_default: yes

  dimension: customer_id {
    hidden: no
    primary_key: yes
    type: number
    sql: ${TABLE}.customer_id ;;
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

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: full_name {
    hidden: no
    type: string
    sql: CONCAT(${first_name},' ',${last_name}) ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }
  dimension: gender {
    hidden: no
    type: string
    sql: ${TABLE}.gender ;;
  }
  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }
  dimension: loyalty_member {
    hidden: no
    type: yesno
    sql: ${TABLE}.loyalty_member ;;
  }
  measure: count {
    hidden: no
    type: count
    drill_fields: [customer_id, last_name, first_name, orders.count]
  }
}
