require 'mysql2'

class Display
    def categoryList()
        client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "1234", :database => "ecommerce")
        categories = client.query("select * from categories where use_yn = 'Y' and parent_id = '' order by id asc")
        categories.each do |category|
            children = client.query("select * from categories where use_yn = 'Y' and parent_id = '#{category['category_id']}'")
            children.each do |child|
                category['_children'] = [child]
            end
        end
        return categories.entries
    end

    def pCategoryList()
        client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "1234", :database => "ecommerce")
        pCategories = client.query("select category_id, name from categories where use_yn = 'Y' and length(category_Id) = 3 order by id asc")

        pCategories.each do |pCategory|
            sql = "select category_id from categories where use_yn = 'Y' and parent_id = '#{pCategory['category_id']}' order by category_id desc limit 1"
            result = client.query(sql).entries
            nextId = result.length > 0 ? pCategory['category_id'] + "00" + (result[0]['category_id'].to_i + 1).to_s : pCategory['category_id'] + "001"
            pCategory['nextId'] = nextId
        end

        return pCategories.entries
    end
end
