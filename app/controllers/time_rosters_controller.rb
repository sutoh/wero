class TimeRostersController < ApplicationController
  # GET /time_rosters
  # GET /time_rosters.json
  def index
    @time_rosters = TimeRoster.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @time_rosters }
    end
  end

  # GET /time_rosters/1
  # GET /time_rosters/1.json
  def show
    @time_roster = TimeRoster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @time_roster }
    end
  end

  # GET /time_rosters/new
  # GET /time_rosters/new.json
  def new
    @time_roster = TimeRoster.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @time_roster }
    end
  end

  # GET /time_rosters/1/edit
  def edit
    @time_roster = TimeRoster.find(params[:id])
  end

  # POST /time_rosters
  # POST /time_rosters.json
  def create
    @time_roster = TimeRoster.new(params[:time_roster])

    respond_to do |format|
      if @time_roster.save
        format.html { redirect_to @time_roster, notice: 'Time roster was successfully created.' }
        format.json { render json: @time_roster, status: :created, location: @time_roster }
      else
        format.html { render action: "new" }
        format.json { render json: @time_roster.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /time_rosters/1
  # PUT /time_rosters/1.json
  def update
    @time_roster = TimeRoster.find(params[:id])

    respond_to do |format|
      if @time_roster.update_attributes(params[:time_roster])
        format.html { redirect_to @time_roster, notice: 'Time roster was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @time_roster.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_rosters/1
  # DELETE /time_rosters/1.json
  def destroy
    @time_roster = TimeRoster.find(params[:id])
    @time_roster.destroy

    respond_to do |format|
      format.html { redirect_to time_rosters_url }
      format.json { head :no_content }
    end
  end
end
