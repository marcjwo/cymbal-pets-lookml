include: "/views/*.view"

explore: order_items {
  label: "(1) Orders, Products and Customers"
  view_label: "Orders and Order Items"
  join: orders {
    view_label: "Orders and Order Items"
    type: left_outer
    sql_on: ${orders.order_id} = ${order_items.order_id} ;;
    relationship: many_to_one
  }
  join: stores {
    type: left_outer
    sql_on: ${stores.store_id} = ${orders.store_id} ;;
    sql_where: ${stores.store_id} IS NOT NULL ;;
    relationship: many_to_one
  }
  join: products {
    view_label: "Products"
    type: left_outer
    sql_on: ${products.product_id} = ${order_items.product_id} ;;
    relationship: many_to_one
  }
  join: suppliers {
    type: left_outer
    sql_on: ${suppliers.supplier_id} = ${products.supplier_id} ;;
    relationship: many_to_one
  }
  join: customers {
    view_label: "Customers"
    type: left_outer
    sql_on: ${customers.customer_id} = ${orders.customer_id} ;;
    sql_where: ${customers.customer_id} IS NOT NULL ;;
    relationship: many_to_one
  }
}
