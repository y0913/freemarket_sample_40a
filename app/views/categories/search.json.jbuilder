json.array! @children do |child|
  json.id child.id
  json.name child.name
end

json.array! @size do |size|
  json.size_id size.id
  json.size_name size.size
end
