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
    @category = Category.find_by_id(params[:category_id]).as_json
    @category['parent_name'] = Category.find_parent_name(@category['parent_id']).as_json
    @pCategories = Category.parent_list()
    render inertia: "categories/show", props: { category: @category, pCategories: @pCategories }
  end

  # GET /categories/new
  def new
    @pCategories = Category.parent_list()
    @nextId = Category.next_parent_id()
    @category = nil
    render inertia: "categories/show", props: { nextId: @nextId, pCategories: @pCategories, category: @category}
  end

  # GET /categories/1/edit
  def edit
    Category.update_by_id(params)

    respond_to do |format|
      format.json { render data: {}, status: :unprocessable_entity }
    end
  end

  def search
    @categories = Category.total_list(params)
    render json: @categories
  end

  # POST /categories or /categories.json
  def create
    category = Category.create(params)

    respond_to do |format|
      format.json { render data: {}, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    @category.update(params)

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
