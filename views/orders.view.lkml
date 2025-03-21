view: orders {
  sql_table_name: `@{gcp_project}.@{bq_dataset}.orders` ;;
  drill_fields: [order_id]
  fields_hidden_by_default: yes

  dimension: order_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.order_id ;;
  }
  dimension: customer_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.customer_id ;;
  }
  dimension_group: order {
    hidden: no
    type: time
    timeframes: [raw, day_of_year, date, week_of_year, quarter_of_year, year, month_name, month]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.order_date ;;
  }
  dimension: order_type {
    hidden: no
    type: string
    sql: ${TABLE}.order_type ;;
  }
  dimension: payment_method {
    hidden: no
    type: string
    sql: ${TABLE}.payment_method ;;
  }
  dimension: shipping_address_city {
    hidden: yes
    type: string
    sql: ${TABLE}.shipping_address_city ;;
  }
  dimension: store_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.store_id ;;
  }

  measure: total_orders {
    hidden: no
    type: count
    drill_fields: [detail*]
  }

  measure: average_orders {
    hidden: yes
    type: average
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  order_id,
  stores.store_id,
  stores.store_name,
  customers.last_name,
  customers.customer_id,
  customers.first_name,
  order_items.count
  ]
  }

}
