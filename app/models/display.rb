require 'mysql2'

class Display
    def categoryList(code, name, use_yn)
        client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "1234", :database => "ecommerce")

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

        sql = "select * from categories where 1 = 1 #{where_code} #{where_name} #{where_use_yn} #{where_parent} order by id asc"

        categories = client.query(sql)
        categories.each do |category|
            children = client.query("select * from categories where use_yn = 'Y' and parent_id = '#{category['category_id']}'")
            children.each do |child|
                if category['_children'] 
                    category['_children'].push(child)
                else
                    category['_children'] = [child]
                end
            end
        end

        return categories.entries
    end

    def pCategoryList()
        client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "1234", :database => "ecommerce")
        pCategories = client.query("select category_id, name from categories where use_yn = 'Y' and length(category_Id) = 3 order by id asc")

        pCategories.each do |pCategory|
            sql = "select category_id from categories where use_yn = 'Y' and parent_id = '#{pCategory['category_id']}' order by category_id asc"
            result = client.query(sql).entries
            nextId = nextChildId(result[0]['category_id'], pCategory['category_id'])
            pCategory['nextId'] = nextId
        end

        return pCategories.entries
    end

private
    def nextChildId(category_id, parent_id)
        current_id = category_id
        lastDepthNum = current_id.partition(parent_id).last
        nextId = parent_id + "00" + (lastDepthNum.to_i + 1).to_s
        
        return nextId
    end
    
end
