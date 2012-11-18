class ProposalsController < ApplicationController
  def index
    @contest = Contest.find(params[:contest_id])
    
    respond_to do |format|
      format.html{ redirect_to @contest }
      format.json { render :json => @users }
    end
  end

  def edit
    self.not_found
  end

  def show
    @contest = Contest.find(params[:contest_id])
    @proposal = Proposal.find(params[:proposal_id])

    respond_to do |format|
      format.html{
        if @contest.nil? or @proposal.nil?
          self.not_found
        else
          render and return
        end
      }
      format.json { render :json => @users }
    end
  end
  
  def create
    @contest = Contest.find(params[:contest_id])
    @proposal = Proposal.new(params[:proposal])
    @proposal.contest = @contest
    @proposal.designer = current_user

    respond_to do |format|
      if @proposal.save
        format.html { redirect_to @contest, :notice => 'Proposal was successfully created.' }
        format.json { render :json => @proposal, :status => :created, :location => @proposal }
      else
        format.html { render :action => "new" }
        format.json { render :json => @proposal.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def new
    @contest = Contest.find(params[:contest_id])
    @proposal = Proposal.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @proposal }
    end
  end
  
  def destroy
    @contest = Contest.find(params[:contest_id])
    @proposal = Proposal.find(params[:id])
    @proposal.destroy

    respond_to do |format|
      format.html { redirect_to @contest, :notice => 'Proposal was successfully deleted.' }
      format.json { head :no_content }
    end
  end
end
