class HighlightsController < ApplicationController
  # GET /highlights
  # GET /highlights.json
  def index
    @highlights = Highlight.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @highlights }
    end
  end

  # GET /highlights/1
  # GET /highlights/1.json
  def show
    @highlight = Highlight.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @highlight }
    end
  end

  # GET /highlights/new
  # GET /highlights/new.json
  def new
    @highlight = Highlight.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @highlight }
    end
  end

  # GET /highlights/1/edit
  def edit
    @highlight = Highlight.find(params[:id])
  end

  # POST /highlights
  # POST /highlights.json
  def create
    @highlight = Highlight.new(params[:highlight])

    respond_to do |format|
      if @highlight.save
        format.html { redirect_to @highlight, notice: 'Highlight was successfully created.' }
        format.json { render json: @highlight, status: :created, location: @highlight }
      else
        format.html { render action: "new" }
        format.json { render json: @highlight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /highlights/1
  # PUT /highlights/1.json
  def update
    @highlight = Highlight.find(params[:id])

    respond_to do |format|
      if @highlight.update_attributes(params[:highlight])
        format.html { redirect_to @highlight, notice: 'Highlight was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @highlight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /highlights/1
  # DELETE /highlights/1.json
  def destroy
    @highlight = Highlight.find(params[:id])
    @highlight.destroy

    respond_to do |format|
      format.html { redirect_to highlights_url }
      format.json { head :no_content }
    end
  end
end
