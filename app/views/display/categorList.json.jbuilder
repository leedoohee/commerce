json.array! @categories do |category|
 json.id category.id
 json.category_id category.category_id
 json.parent_id category.parent_id
 json.use_yn category.use_yn
end