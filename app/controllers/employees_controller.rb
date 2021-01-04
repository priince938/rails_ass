class EmployeesController < ApplicationController
  #befor_action set_city to find the city in db befor do show edit update and destroy
  before_action :set_employee, only: [:show, :edit, :update, :destroy]


  # if user is not autenticated only show index and show method is use 
  before_action :authenticate_user!,except: [:index ,:show,:show_manager]


  #will paginate use to show now of row in per page 
  WillPaginate.per_page = 5



  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.page(params[:page]) #pagination on index of employee
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
   
    
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # route "/managers" to show all the managers
  def show_manager
    # to find all the employee which have manager
    @managers=Employee.where.not(manager_id:nil) 
    #to find all manager_id and paginate "and we change in config array/paginate "
    @managers=@managers.uniq {|obj| obj.manager_id }.paginate(page:params[:page],per_page:5) 
  end


  # route "/count" to count the employee in city
  def cityemp
    id=params[:city_id]
    @count=Employee.where(city_id:id).count #query to count employee in city
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def employee_params
      # add new param to pass image using carrier wave and remove_avatar is to pass checkbox value
      params.require(:employee).permit(:name, :city_id, :manager_id,:avatar,:remove_avatar) 
    end

    
    
end
