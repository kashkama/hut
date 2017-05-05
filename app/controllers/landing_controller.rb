class LandingController < ApplicationController
  def index
    @regions = Region.all
  end
end
