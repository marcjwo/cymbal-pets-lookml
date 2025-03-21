# If necessary, uncomment the line below to include explore_source.
# include: "purchases.explore.lkml"

view: supplier_facts {
  view_label: "Suppliers"
  fields_hidden_by_default: yes
  derived_table: {
    explore_source: purchases {
      column: supplier_id { field: suppliers.supplier_id }
      column: supplier_name { field: suppliers.supplier_name }
      column: total_purchase_order_costs {}
      column: total_purchase_order_sales {}
      column: total_purchase_quantity {}
      column: count {}
      derived_column: supplier_total_purchased_rank {
        sql: RANK() OVER (ORDER BY total_purchase_order_costs DESC) ;;
      }
      derived_column: supplier_total_sold_rank {
        sql: RANK() OVER (ORDER BY total_purchase_order_sales DESC) ;;
      }
      derived_column: supplier_total_quantity_rank {
        sql: RANK() OVER (ORDER BY total_purchase_quantity DESC) ;;
      }
      derived_column: supplier_total_orders_rank {
        sql: RANK() OVER (ORDER BY count DESC) ;;
      }
    }
  }
  dimension: supplier_name {
    description: ""
  }
  dimension: supplier_id {
    description: ""
  }
  dimension: total_purchase_order_costs {
    label: "Purchase Orders Total Purchase Order Costs"
    description: ""
    value_format: "$#,##0.00"
    type: number
  }
  dimension: total_purchase_order_sales {
    label: "Purchase Orders Total Purchase Order Sales"
    description: ""
    value_format: "$#,##0.00"
    type: number
  }
  dimension: total_purchase_quantity {
    label: "Purchase Orders Total Purchase Quantity"
    description: ""
    type: number
  }
  dimension: count {
    label: "Purchase Orders Total Purchase Orders"
    description: ""
    type: number
  }
  dimension: supplier_total_purchased_rank {
    hidden: no
    label: "Total Purchased Rank"
    sql: ${TABLE}.supplier_total_purchased_rank ;;
  }
  dimension: supplier_total_sold_rank {
    hidden: no
    label: "Total Sold Rank"
    sql: ${TABLE}.supplier_total_sold_rank ;;
  }
  dimension: supplier_total_quantity_rank {
    hidden: no
    label: "Total Quantity Rank"
    sql: ${TABLE}.supplier_total_quantity_rank ;;
  }
  dimension: supplier_total_orders_rank {
    hidden: no
    label: "Total Orders Rank"
    sql: ${TABLE}.supplier_total_orders_rank ;;
  }
}
