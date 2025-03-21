view: purchase_orders {
  sql_table_name: `@{gcp_project}.@{bq_dataset}.purchase_orders` ;;
  fields_hidden_by_default: yes
  drill_fields: [purchase_order_id]
  view_label: "Purchase Orders"

  dimension: purchase_order_id {
    hidden: no
    primary_key: yes
    type: number
    sql: ${TABLE}.purchase_order_id ;;
  }
  dimension: distribution_center_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.distribution_center_id ;;
  }
  dimension: product_id {
    hidden: yes
    type: number
    sql: ${TABLE}.product_id ;;
  }
  dimension_group: purchase_delivery {
    hidden: no
    type: time
    timeframes: [raw, date, week_of_year, quarter_of_year, year, month_name, month]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.purchase_delivery_date ;;
  }
  dimension_group: purchase_order {
    hidden: no
    type: time
    timeframes: [raw, date, week_of_year, quarter_of_year, year, month_name]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.purchase_order_date ;;
  }
  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }
  dimension: supplier_id {
    hidden: yes
    type: number
    sql: ${TABLE}.supplier_id ;;
  }

  measure: total_purchase_quantity {
    hidden: no
    type: sum
    sql: ${quantity} ;;
  }

  dimension: price {
    hidden: yes
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: cost {
    hidden: yes
    type: number
    sql: ${TABLE}.cost ;;
  }

  measure: total_purchase_order_sales {
    hidden: no
    value_format_name: usd
    type: sum
    sql: ${price} ;;
  }

  measure: total_purchase_order_costs {
    hidden: no
    value_format_name: usd
    type: sum
    sql: ${cost} ;;
  }

  measure: average_lead_time {
    label: "Average lead time in days"
    hidden: no
    value_format_name: decimal_2
    type: average
    sql: ${days_delivery_time} ;;
  }

  dimension_group: delivery_time {
    hidden: no
    type: duration
    intervals: [day]
    sql_start: ${purchase_order_date} ;;
    sql_end: ${purchase_delivery_date} ;;
  }



  measure: count {
    hidden: no
    label: "Total Purchase Orders"
    type: count
    drill_fields: [purchase_order_id, distribution_centers.distribution_center_id, distribution_centers.distribution_center_name]
  }
}
