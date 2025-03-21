# If necessary, uncomment the line below to include explore_source.
# include: "orders.explore.lkml"

view: product_facts {
  view_label: "Products"
  fields_hidden_by_default: yes
  derived_table: {
    datagroup_trigger: cymbal_pets_default_datagroup
    explore_source: order_items {
      column: product_name { field: products.product_name }
      column: product_id { field: products.product_id }
      column: total_sales {}
      derived_column: product_sold_rank {
        sql: RANK() OVER (ORDER BY total_sales DESC) ;;
      }
    }
  }
  dimension: product_name {
    description: ""
  }
  dimension: product_id {
    description: ""
  }
  dimension: total_sales {
    label: "Orders and Order Items Total Sales"
    description: ""
    value_format: "$#,##0.00"
    type: number
  }

  dimension: product_sold_rank {
    hidden: no
    label: "Total Product Sold Rank"
    description: "Product Sold Rank"
    sql: ${TABLE}.product_sold_rank ;;
  }
}
