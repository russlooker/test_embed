connection: "thelook"

include: "three_level_drill.dashboard.lookml"

explore: orders {
  hidden: yes
  join: users {
    type: left_outer
    relationship: many_to_one
    sql_on: ${orders.user_id} = ${users.id} ;;
  }
}

view: orders {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;

  }

  dimension_group: created {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      month_num,
      quarter,
      year,
      day_of_week_index,
      hour_of_day,
      minute5
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
    link: {
      label: "Level 3 Dash"
      url: "/dashboards/1251?Date%20Three={{ _filters['orders.created_date'] | url_encode }}&Email={{ _filters['users.first_name'] | url_encode }}"
    }
  }

  dimension: user_id {
    type: number
    # hidden: true
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
  }
}

view: users {
  sql_table_name: demo_db.users ;;


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
    link: {
      label: "Level 2 Dash"
      url: "/dashboards/51?Date%20Two={{ _filters['users.created_at_date'] | url_encode }}&First%20Name={{ _filters['users.first_name'] | url_encode }}"
    }
  }

  dimension: gender2 {
    type: string
    sql: ${TABLE}.gender ;;
    html: <a href="/dashboards/51?First%20Name={{ value }}">Drill to Dash</a> ;;
  }


  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension: zip {
    type: number
    sql: ${TABLE}.zip ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  set: detail {
    fields: [
      id,
      email,
      first_name,
      last_name,
      gender,
      created_at_time,
      zip,
      country,
      state,
      city,
      age
    ]
  }
}
