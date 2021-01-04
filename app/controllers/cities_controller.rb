class CitiesController < ApplicationController
  #befor_action set_city to find the city in db befor do show edit update and destroy
  before_action :set_city, only: [:show,:edit,:update,:destroy] 
  # if user is not autenticated only show index and show method is use 
  before_action :authenticate_user!,except: [:index ,:show]
  
  #will paginate use to show now of row in per page 
  WillPaginate.per_page = 5
  def index
    @cities =City.page(params[:page]) #use of pagination in city 
    
  end
 
 
  def new
    @city = City.new
  end

  def create
    @city =City.new(city_params)
    respond_to do |format|
      if @city.save
        format.html { redirect_to @city ,notice: 'city created'}
      else 
        format.html { render :edit }
       
      end
    end
  end

  def show
  end

  def edit
  end
  def update
    respond_to do |format|
      if @city.update(city_params)
        format.html { redirect_to @city ,notice: 'city update'}
     
      else 
        format.html { render :edit }
      end
    end
  end
  def destroy 
    respond_to do |format|
      if @city.destroy
        format.html { redirect_to @city,notice: 'city destroy' }
    
    else 
      format.html { redirect_to @city ,notice: 'Error'}
    end
    end
  end
    
  

  private
    def city_params
      params.require(:city).permit(:name)
    end
    def set_city
      @city = City.find(params[:id])
    end
  

  
end
