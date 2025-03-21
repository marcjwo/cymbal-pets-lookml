view: pet_profiles {
  label: "Pet Profiles"
  sql_table_name: `gemini-looker-demo-dataset.cymbal_pets.pet_profiles` ;;
  fields_hidden_by_default: yes

  dimension: activity_level {
    hidden: no
    type: string
    sql: ${TABLE}.activity_level ;;
  }
  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }
  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }
  dimension: dietary_needs {
    type: string
    sql: ${TABLE}.dietary_needs ;;
  }
  dimension: pet_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.pet_id ;;
  }
  dimension: pet_name {
    hidden: no
    type: string
    sql: ${TABLE}.pet_name ;;
  }
  dimension: pet_type {
    hidden: no
    type: string
    sql: ${TABLE}.pet_type ;;
  }
  dimension: weight {
    type: number
    sql: ${TABLE}.weight ;;
  }
  measure: count {
    hidden: no
    type: count
    drill_fields: [pet_name]
  }
}
