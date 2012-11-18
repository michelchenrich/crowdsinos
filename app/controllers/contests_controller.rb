class ContestsController < ApplicationController
  # GET /contests
  # GET /contests.json
  def index
    if current_user.instance_of? Contractor
      @contests = Contest.find_all_by_contractor_id(current_user.id)
    else
      @contests = Contest.all
    end
    
    @contests = @contests.sort! do |a,b| 
      if a.is_open?
        if not b.is_open?
          -1
        elsif a.end < b.end
          -1
        else
          1
        end
      else
        1
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @contests }
    end
  end

  # GET /contests/1
  # GET /contests/1.json
  def show
    @contest = Contest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @contest }
    end
  end

  # GET /contests/new
  # GET /contests/new.json
  def new
    @contest = Contest.new

    respond_to do |format|
      format.html {
        if current_user.instance_of? Contractor
          format.html
        elsif current_user.instance_of? Designer
          self.unauthorized
        end
      }
      format.json { render :json => @contest }
    end
  end

  # GET /contests/1/edit
  def edit
    @contest = Contest.find(params[:id])
    
    respond_to do |format|
      format.html {
        if current_user.instance_of? Contractor
          format.html
        elsif current_user.instance_of? Designer
          self.unauthorized
        end
      }
      format.json { head :no_content }
    end
  end

  # POST /contests
  # POST /contests.json
  def create
    @contest = Contest.new(params[:contest])
    @contest.contractor_id = current_user.id
   
    respond_to do |format|
      if @contest.save
        format.html { redirect_to @contest, :notice => 'Contest was successfully created.' }
        format.json { render :json => @contest, :status => :created, :location => @contest }
      else
        format.html { render :action => "new" }
        format.json { render :json => @contest.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contests/1
  # PUT /contests/1.json
  def update
    @contest = Contest.find(params[:id])

    respond_to do |format|
      if @contest.update_attributes(params[:contest])
        format.html { redirect_to @contest, :notice => 'Contest was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @contest.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contests/1
  # DELETE /contests/1.json
  def destroy
    @contest = Contest.find(params[:id])
    @contest.destroy

    respond_to do |format|
      format.html { redirect_to contests_url, :notice => 'Contest was successfully deleted.' }
      format.json { head :no_content }
    end
  end
  
  def set_winner
    @contest = Contest.find(params[:contest_id])
    @contest.winning_proposal = Proposal.find(params[:proposal_id])
    @contest.save

    respond_to do |format|
      format.html { redirect_to :action => "index", :notice => 'Proposal was successfully set as winner.' }
      format.json { head :no_content }
    end
  end
end
