class CategoriesController < ApplicationController
  
  #before_action :set_category, only: %i[ show edit update destroy ]

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  # GET /categories or /categories.json
  def index
    render inertia: "categories/index", props: {}
  end

  # GET /categories/1 or /categories/1.json
  def show
    render inertia: "categories/show", props: {}
  end

  # GET /categories/new
  def new
    @pCategories = pCategories()
    @nextId = nextCategoryId()

    render inertia: "categories/show", props: { nextId: @nextId, pCategories: @pCategories }
  end

  # GET /categories/1/edit
  def edit
  end

  def search
    code = params[:code]
    name = params[:name]
    use_yn = params[:use_yn]

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

    @result = []
    @categories = Category.where("1 = 1 #{where_code} #{where_name} #{where_use_yn} #{where_parent}").order(id: :asc)
    @categories.each do |category|
        tmp_category = category.as_json
        children = Category.where(use_yn: 'Y').where(parent_id: category.category_id).order(category_id: :asc)
        children.each do |child|
            tmp_child = child.as_json
            if tmp_category['_children'] != nil
                tmp_category['_children'].push(tmp_child)
            else
                tmp_category['_children'] = [tmp_child]
            end
        end
        @result.push(tmp_category)
    end

    render json: @result
  end

  # POST /categories or /categories.json
  def create
    
    category = Category.new
    category.name = params[:name]
    category.parent_id = params[:parent_id]
    category.use_yn = params[:use_yn]
    category.register_id = 'dooheelee'
    category.category_id = params[:category_id]
    category.create_at = Time.now
    category.save!

    respond_to do |format|
      format.json { render data: {}, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to category_url(@category), notice: "Category was successfully updated." }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category.destroy!

    respond_to do |format|
      format.html { redirect_to categories_url, notice: "Category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def pCategories
      result = []
      p_categories = Category.where(use_yn: 'Y').where("parent_id = ''").order(id: :asc)
      p_categories.each do |p_category|
          tmp_p_category = p_category.as_json
          child = Category.where(use_yn: 'Y').where(parent_id: p_category.category_id).order(category_id: :desc).limit(1).as_json
          if child.length > 0
            nextId = nextChildId(child[0]['category_id'], p_category.category_id)
            tmp_p_category['nextId'] = nextId
          end
          result.push(tmp_p_category)
      end
    
      return result
    end

    def nextChildId(category_id, parent_id)
      current_id = category_id
      lastDepthNum = current_id.partition(parent_id).last
      nextId = parent_id + "00" + (lastDepthNum.to_i + 1).to_s
      return nextId
    end

    def nextCategoryId()
        category = Category.where(use_yn: 'Y').where("length(category_Id) = 3").order(id: :desc).limit(1).as_json
        nextId = category.length > 0 ? "00" + (category[0]['category_id'].to_i + 1).to_s : "001"
        return nextId
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.permit(:category_id, :name, :parent_id, :use_yn)
    end

    def render_not_found_response
      render json: { error: "category Not Found" }, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
      render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
