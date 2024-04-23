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
        pCategories = client.query("select * from categories where use_yn = 'Y' and length(category_Id) = 3 order by id asc")

        return pCategories.entries
    end
end
