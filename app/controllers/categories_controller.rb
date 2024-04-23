
require 'json'

class CategoriesController < ApplicationController
  #before_action :set_category, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show, :new, :create, :edit, :update, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  # GET /categories or /categories.json
  def index
    @categories = Display.new.categoryList()
    render inertia: "categories/index", props: { categories: @categories }
  end

  # GET /categories/1 or /categories/1.json
  def show
    render inertia: "categories/show", props: {}
  end

  # GET /categories/new
  def new
    @pCategories = Display.new.pCategoryList()
    @nextId = Category.new.nextCategoryId()
    render inertia: "categories/show", props: { nextId: @nextId, pCategories: @pCategories }
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories or /categories.json
  def create
    @category = Category.new
    @category.insert(params[:category_id], params[:name], params[:parent_id], params[:use_yn])

    respond_to true
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
