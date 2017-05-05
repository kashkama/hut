class RegionsController < ApplicationController
  before_action :set_region, only: [:show, :edit, :update, :destroy]
  before_filter :must_login?, only: [:new, :edit, :destroy]

  def index
    @regions = Region.all
  end

  def show

  end

  def new
    @region = Region.new
  end

  def create
    @region = Region.new(region_params)
    if @region.save
      redirect_to root_path, notice: 'region successfully created!!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @region.update(region_params)
      redirect_to root_path, notice: 'region was updated'
    else
      render :edit
    end
  end

  def destroy
    @region.destroy
    redirect_to root_path, notice: "destroyed successfully"
  end

  private

  def set_region
    @region = Region.find(params[:id])
  end

  def region_params
    params.require(:region).permit(:name, :image)
  end
end
