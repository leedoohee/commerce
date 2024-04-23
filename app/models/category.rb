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
        nextId = "00" + client.query("select category_id from categories where use_yn = 'Y' and length(category_Id) = 3 order by id desc limit 1").entries[0].values[1].to_i + 1
        
        return nextId
    end
end
