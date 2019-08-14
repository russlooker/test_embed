- dashboard: level_1_dash
  title: Level 1 Dash
  layout: newspaper
  elements:
  - title: New Tile
    name: New Tile
    model: drill_embed_test
    explore: orders
    type: table
    fields:
    - users.gender
    - users.count
    sorts:
    - users.gender
    limit: 500
    listen:
      Date: users.created_at_date
      Name: users.first_name
    row: 0
    col: 0
    width: 8
    height: 6
  filters:
  - name: Date
    title: Date
    type: date_filter
    default_value: 7 years
    allow_multiple_values: true
    required: false
  - name: Name
    title: Name
    type: string_filter
    default_value: "%An%"
    allow_multiple_values: true
    required: false
