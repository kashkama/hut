class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :create, :new, :edit, :update, :destroy]
  before_filter :must_login?, only: [:new, :edit, :destroy]
  # GET /reviews
  def index
    @reviews = Review.all
  end

  # GET /reviews/1
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  def create
    @review = @house.reviews.new(review_params)
    @review.user = current_user
    if @review.save
      redirect_to @house, notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /reviews/1
  def update
    if @review.update(review_params)
      redirect_to @house, notice: 'Review was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /reviews/1
  def destroy
    @review.destroy
    redirect_to @house, notice: 'Review was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @house = House.find(params[:house_id])
    end

    # Only allow a trusted parameter "white list" through.
    def review_params
      params.fetch(:review).permit(:comment)
    end
end
