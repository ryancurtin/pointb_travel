class VacationsController < ApplicationController
  # GET /vacations
  # GET /vacations.json
  before_filter :logged_in?
  
  def logged_in?
    if current_user.nil?
      redirect_to root_url, :notice => "You need to be logged in to access that page"
    end
  end
  
  def index
    @vacations = Vacation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vacations }
    end
  end

  # GET /vacations/1
  # GET /vacations/1.json
  def show
    @vacation = Vacation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vacation }
    end
  end

  # GET /vacations/new
  # GET /vacations/new.json
  def new
    @vacation = Vacation.new
    3.times { @vacation.highlights.build }
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vacation }
    end
  end

  # GET /vacations/1/edit
  def edit
    @vacation = Vacation.find(params[:id])
  end

  # POST /vacations
  # POST /vacations.json
  def create
    @vacation = Vacation.new(params[:vacation])
    @vacation.user_id = current_user.id
    respond_to do |format|
      if @vacation.save
        format.html { redirect_to @vacation, notice: 'Vacation was successfully created.' }
        format.json { render json: @vacation, status: :created, location: @vacation }
      else
        format.html { render action: "new" }
        format.json { render json: @vacation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vacations/1
  # PUT /vacations/1.json
  def update
    @vacation = Vacation.find(params[:id])

    respond_to do |format|
      if @vacation.update_attributes(params[:vacation])
        format.html { redirect_to @vacation, notice: 'Vacation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vacation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vacations/1
  # DELETE /vacations/1.json
  def destroy
    @vacation = Vacation.find(params[:id])
    @vacation.destroy

    respond_to do |format|
      format.html { redirect_to vacations_url }
      format.json { head :no_content }
    end
  end
end
