class UsersController < ApplicationController
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @user }
    end
  end

  def edit
    @user = current_user
    
    respond_to do |format|
      format.html # edit.html.erb
      format.json { render :json => @user }
    end
  end

  def create
    @user = User.new(params[:user])
    
    @user_session = UserSession.new
    @user_session.username = @user.username
    @user_session.password = @user.password

    respond_to do |format|
      if @user.save and @user_session.save
        format.html { redirect_to root_url, :notice => "Successfully registered. Welcome, #{current_user.username}!" }
        format.json { render :json => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @user = current_user

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to root_url, :notice => 'User profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to root_url, :notice => 'User profile was successfully deleted.' }
      format.json { head :no_content }
    end
  end
end
