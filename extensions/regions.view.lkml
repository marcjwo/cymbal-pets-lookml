view: regions {
  extension: required

  dimension: address_region {
    hidden: no
    type: string
    sql: CASE
    WHEN ${address_state} IN ('Washington', 'Oregon', 'Idaho', 'Montana', 'Wyoming', 'North Dakota', 'South Dakota', 'Nebraska', 'Minnesota', 'Iowa', 'Wisconsin', 'Illinois', 'Michigan', 'Indiana', 'Ohio', 'Pennsylvania', 'New York', 'New Jersey', 'Connecticut', 'Rhode Island', 'Massachusetts', 'Vermont', 'New Hampshire', 'Maine') THEN 'North'
    WHEN ${address_state} IN ('Pennsylvania', 'New York', 'New Jersey', 'Delaware', 'Maryland', 'Virginia', 'West Virginia', 'North Carolina', 'South Carolina', 'Georgia', 'Florida') THEN 'East'
    WHEN ${address_state} IN ('Texas', 'Oklahoma', 'Arkansas', 'Louisiana', 'Mississippi', 'Alabama', 'Tennessee', 'Kentucky') THEN 'South'
    WHEN ${address_state} IN ('California', 'Nevada', 'Utah', 'Arizona', 'Colorado', 'New Mexico') THEN 'West'
    ELSE 'Unknown'
END;;
  }
}
