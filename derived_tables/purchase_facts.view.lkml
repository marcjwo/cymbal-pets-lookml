# If necessary, uncomment the line below to include explore_source.
# include: "purchases.explore.lkml"

view: purchase_facts {
  view_label: "Products"
  fields_hidden_by_default: yes
  derived_table: {
    datagroup_trigger: cymbal_pets_default_datagroup
    explore_source: purchases {
      column: product_name { field: products.product_name }
      column: product_id { field: products.product_id }
      column: total_purchase_order_costs {}
      derived_column: products_purchased_rank {
        sql: RANK() OVER (ORDER BY total_purchase_order_costs DESC) ;;
      }
    }
  }
  dimension: product_name {
    description: ""
  }
  dimension: product_id {
    description: ""
  }
  dimension: total_purchase_order_costs {
    label: "Purchase Orders Total Purchase Order Costs"
    description: ""
    value_format: "$#,##0.00"
    type: number
  }
  dimension: products_purchased_rank {
    hidden: no
    label: "Product Purchased Rank"
    sql: ${TABLE}.products_purchased_rank ;;
  }
}
