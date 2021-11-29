json.extract! employee, :id, :full_name, :lib_id, :position, :birthdate, :joined_at, :education, :salary, :created_at, :updated_at
json.url employee_url(employee, format: :json)
