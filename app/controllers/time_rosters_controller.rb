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
    @form_data = params[:time_roster]
    @work_date = @form_data["work_date(1i)"] + "-" + @form_data["work_date(2i)"] + "-" + @form_data["work_date(3i)"]
    @going_work_time = @form_data["going_work_time"]
    @quit_work_time = @form_data["quit_work_time"]
    
    if TimeRoster.exists?(['work_date like ?', "%#{@work_date}%"])
      redirect_to :controller => "time_rosters", :action => "index" 
      @time_roster = TimeRoster.find(:all, :conditions => {:work_date => @work_date})
      if @time_roster.update_attributes({:going_work_time => @going_work_time, :quit_work_time => @quit_work_time})  
        redirect_to :controller => "time_rosters", :action => "index" 
      end
    else
      @time_roster = TimeRoster.new(params[:time_roster])
      if @time_roster.save
        @timeroster_line = @time_roster.build_timeroster_line
        @timeroster_line.user = current_user
        if @timeroster_line.save
          redirect_to :controller => "timeroster_line", :action => "index"
        end
      end
    end



  end

  # PUT /time_rosters/1
  # PUT /time_rosters/1.json
  def update
    @time_roster = TimeRoster.find(params[:time_roster])

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
