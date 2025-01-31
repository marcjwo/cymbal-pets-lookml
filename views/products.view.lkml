# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: products {
  hidden: yes
    join: products__nutritional_info__ingredients {
      view_label: "Products: Nutritional Info Ingredients"
      sql: LEFT JOIN UNNEST(${products.nutritional_info__ingredients}) as products__nutritional_info__ingredients ;;
      relationship: one_to_many
    }
}
view: products {
  sql_table_name: `gemini-looker-demo-dataset.cymbal_pets.products` ;;
  drill_fields: [product_id]
  fields_hidden_by_default: yes

  dimension: product_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.product_id ;;
  }
  dimension: average_rating {
    type: number
    sql: ${TABLE}.average_rating ;;
  }
  dimension: brand {
    hidden: no
    type: string
    sql: ${TABLE}.brand ;;
  }
  dimension: category {
    hidden: no
    type: string
    sql: ${TABLE}.category ;;
  }
  dimension: description {
    hidden: no
    type: string
    sql: ${TABLE}.description ;;
  }
  dimension: image_url {
    type: string
    sql: ${TABLE}.image_url ;;
  }
  dimension: inventory_level {
    type: number
    sql: ${TABLE}.inventory_level ;;
  }
  dimension: nutritional_info__calories_per_serving {
    hidden: no
    type: number
    sql: ${TABLE}.nutritional_info.calories_per_serving ;;
    group_label: "Nutritional Info"
    group_item_label: "Calories per Serving"
  }
  dimension: nutritional_info__calories_per_treat {
    hidden: no
    type: number
    sql: ${TABLE}.nutritional_info.calories_per_treat ;;
    group_label: "Nutritional Info"
    group_item_label: "Calories per Treat"
  }
  dimension: nutritional_info__fiber_content {
    hidden: no
    type: string
    sql: ${TABLE}.nutritional_info.fiber_content ;;
    group_label: "Nutritional Info"
    group_item_label: "Fiber Content"
  }
  dimension: nutritional_info__ingredients {
    hidden: no
    sql: ${TABLE}.nutritional_info.ingredients ;;
    group_label: "Nutritional Info"
    group_item_label: "Ingredients"
  }
  dimension: nutritional_info__protein_content {
    hidden: no
    type: string
    sql: ${TABLE}.nutritional_info.protein_content ;;
    group_label: "Nutritional Info"
    group_item_label: "Protein Content"
  }
  dimension: nutritional_info__vitamin_c_content {
    hidden: no
    type: string
    sql: ${TABLE}.nutritional_info.vitamin_c_content ;;
    group_label: "Nutritional Info"
    group_item_label: "Vitamin C Content"
  }
  dimension: price {
    hidden: no
    type: number
    sql: ${TABLE}.price ;;
  }
  dimension: product_name {
    hidden: no
    type: string
    sql: ${TABLE}.product_name ;;
  }
  dimension: subcategory {
    hidden: no
    type: string
    sql: ${TABLE}.subcategory ;;
  }
  dimension: supplier_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.supplier_id ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  product_id,
  product_name,
  suppliers.contact_name,
  suppliers.supplier_name,
  suppliers.supplier_id,
  order_items.count
  ]
  }

}

view: products__nutritional_info__ingredients {

  dimension: products__nutritional_info__ingredients {
    type: string
    sql: products__nutritional_info__ingredients ;;
  }
}
