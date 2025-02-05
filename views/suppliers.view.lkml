view: suppliers {
  sql_table_name: `@{gcp_project}.@{bq_dataset}.suppliers` ;;
  drill_fields: [supplier_id]

  dimension: supplier_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.supplier_id ;;
  }
  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }
  dimension: contact_name {
    type: string
    sql: ${TABLE}.contact_name ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }
  dimension: phone_number {
    type: string
    sql: ${TABLE}.phone_number ;;
  }
  dimension: supplier_name {
    type: string
    sql: ${TABLE}.supplier_name ;;
  }
  measure: count {
    type: count
    drill_fields: [supplier_id, contact_name, supplier_name, products.count]
  }
}
