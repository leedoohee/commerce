require 'mysql2'

class Category < ApplicationRecord

    def insert(category_id, name, parent_id, use_yn)
        client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "1234", :database => "ecommerce")
        client.query("INSERT INTO categories (category_id, name, parent_id, use_yn) VALUES ('#{category_id}', '#{name}', '#{parent_id}', '#{use_yn}')")
    end

    def update()
        client = mysql2::Client.new
        client.query("UPDATE categories SET name = #{name}, parent_id = #{parent_id}, use_yn = #{use_yn} WHERE id = #{id}")
    end

    def delete()
        client = mysql2::Client.new
        client.query("DELETE FROM categories WHERE id = #{id}")
    end

    def nextCategoryId()
        client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "1234", :database => "ecommerce")
        sql = "select category_id from categories where use_yn = 'Y' and length(category_Id) = 3 order by id desc limit 1"
        result = client.query(sql).entries
        nextId = result.length > 0 ? "00" + (result[0]['category_id'].to_i + 1).to_s : "001"
        return nextId
    end

end
