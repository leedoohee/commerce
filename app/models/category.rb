
class Category < ApplicationRecord
    @table_name = "categories"

    has_one :Category, class_name: "Category", foreign_key: 'parent_id'

    def self.create(params)
        category = self.new
        category.name = params[:name]
        category.parent_id = params[:parent_id]
        category.use_yn = params[:use_yn]
        category.register_id = current_user.name
        category.category_id = params[:category_id]
        category.create_at = Time.now
        category.save!
    end

    def self.find_by_id(category_id)
        return self.find_by(category_id: category_id)
    end

    def self.find_parent_name(parent_id)
        parent_category = self.find_by(category_id: parent_id)
        return parent_category == nil ? '미선택' : parent_category['name']
    end

    def self.update_by_id(params)
        category = self.find_by(category_id: params[:category_id])
        category.update(name: params[:name], use_yn: params[:use_yn], updater_id: current_user.name, update_at: Time.now)
    end

    def self.parent_list
        rows = self.where(parent_id: '').order(category_id: :asc)
        list = []

        rows.each do |category|
            category_json = category.as_json
            last_category = self.last_child_id(category_json['category_id']).as_json
            category_json['nextId'] = self.last_child_id(last_category['category_id']).as_json
            list.push(category_json)
        end

        return list
    end

    def self.last_child_id(parent_id)
        return '00' + (self.maximum(:category_id).to_i + 1).to_s
    end

    def self.next_parent_id
        category = Category.where(use_yn: 'Y').where("length(category_Id) = 3").order(category_id: :desc).limit(1).as_json
        nextId = category.length > 0 ? "00" + (category[0]['category_id'].to_i + 1).to_s : "001"
        return nextId
    end

    def self.update_by_id(params)
        category = self.find_by(category_id: params[:category_id])
        category.update(name: params[:name], use_yn: params[:use_yn], updater_id: current_user.name, update_at: Time.now)
    end

    def self.parent_list
        rows = self.where(parent_id: '').order(category_id: :asc)
        list = []

        rows.each do |category|
            category_json = category.as_json
            last_category = self.last_child_id(category_json['category_id']).as_json
            category_json['nextId'] = self.last_child_id(last_category['category_id']).as_json
            list.push(category_json)
        end

        return list
    end

    def self.total_list(params)
        code = params[:code]
        name = params[:name]
        use_yn = params[:use_yn]
        where_parent = ''
        where_code = ''
        where_name = ''
        where_use_yn = ''
        list = []

        if code == '' && name == ''
            where_parent = " and parent_id = ''"
        end

        if code != ''
            where_code = " and category_id = '#{code}'"
        end

        if name != ''
            where_name = " and name like '%#{name}%'"
        end

        if use_yn != ''
            where_use_yn = " and use_yn = '#{use_yn}'"
        end

        rows = self.where("1 = 1 #{where_code} #{where_name} #{where_use_yn} #{where_parent}").order(category_id: :asc)   
        
        rows.each do |category|
            category_json = category.as_json
            category_json['_children'] = self.children_of_list(category_json['category_id']).as_json
            list.push(category_json)
        end
        
        return list
    end

    def self.children_of_list(parent_id)
        return self.where(parent_id: parent_id).order(category_id: :asc)
    end
end