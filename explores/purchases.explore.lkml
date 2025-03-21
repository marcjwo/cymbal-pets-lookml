include: "/views/*.view"
include: "/derived_tables/*.view"

explore: purchases {
  label: "(2) Suppliers and Purchase Orders"
  from: purchase_orders

  join: distribution_centers {
    type: left_outer
    relationship: one_to_one
    sql_on: ${distribution_centers.distribution_center_id} = ${purchases.distribution_center_id} ;;
  }

  join: products {
    type: left_outer
    relationship: one_to_one
    sql_on: ${products.product_id} = ${purchases.product_id} ;;
  }

  join: suppliers {
    type: left_outer
    relationship: one_to_one
    sql_on: ${suppliers.supplier_id} = ${purchases.supplier_id} ;;
  }
  join: purchase_facts {
    type: left_outer
    sql_on: ${products.product_id} = ${purchase_facts.product_id} ;;
    relationship: one_to_one
  }
  join: supplier_facts {
    type: left_outer
    sql_on: ${products.supplier_id} = ${supplier_facts.supplier_id} ;;
    relationship: many_to_one
  }
}
