class ProposalsController < ApplicationController
  def index
    @contest = Contest.find_by_id(params[:contest_id])
    @proposals = Proposal.find_all_by_contest_id(params[:contest_id])
    
    respond_to do |format|
      format.html{
        if @contest.nil?
          self.not_found
        else
          render and return
        end
      }
      format.json { render :json => @users }
    end
  end

  def edit
  end

  def show
    @contest = Contest.find_by_id(params[:contest_id])
    @proposal = Proposal.find_by_id(params[:proposal_id])

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
    contest = Contest.find_by_id(params[:contest_id])
    @proposal = Proposal.new(params[:proposal])
    @proposal.contest_id = contest.id
    @proposal.designer_id = current_user.id

    respond_to do |format|
      if @proposal.save
        format.html { redirect_to @proposal, :notice => 'Proposal was successfully created.' }
        format.json { render :json => @proposal, :status => :created, :location => @proposal }
      else
        format.html # new.html.erb
        format.json { render :json => @proposal.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def new
    @contest = Contest.find_by_id(params[:contest_id])
    @proposal = Proposal.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @proposal }
    end
  end
end
