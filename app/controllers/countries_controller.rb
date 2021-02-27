class CountriesController < ApplicationController
  before_action :name

  def index
    @country = Country.all
  end

  def new
    @country = Country.newd
  end

  def create
    @country = Country.new(country_params)
    if @country.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    country = Country.find(params[:id])
    country.destroy
    redirect_to root_path
  end

  private

  def country_params
    params.require(:country).permit(:name)
  end

  def name
    @name = Country.all
  end
  

end
