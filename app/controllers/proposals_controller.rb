class ProposalsController < ApplicationController
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
