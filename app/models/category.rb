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
end
