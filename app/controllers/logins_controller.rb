class LoginsController < ApplicationController
  
  # GET /logins
  # GET /logins.xml
  def index
 
    if !params[:login].nil? && !params[:password].nil?    
       @login = User.find_by_login_and_password(params[:login], params[:password])
       if !@login.nil?
         # 該当ユーザあり
         @login[:result] = "OK"
         fmly = Family.find(:first, @login[:family_id])
         @login[:group_id] = fmly[:group_id]
       else
         # 該当ユーザなし
         @login = User.new
         @login[:result] = "NG"
       end
    
    end 

    respond_to do |format|
      format.html # index.html.erb
#      format.xml  { render :xml => @logins }
      format.xml  { render :layout=>false}
    end
  end

#  # GET /logins/1
#  # GET /logins/1.xml
#  def show
#    @logins = Logins.find(params[:id])
#
#    respond_to do |format|
#      format.html # show.html.erb
#      format.xml  { render :xml => @logins }
#    end
#  end
#
#  # GET /logins/new
#  # GET /logins/new.xml
#  def new
#    @logins = Logins.new
#
#    respond_to do |format|
#      format.html # new.html.erb
#      format.xml  { render :xml => @logins }
#    end
#  end
#
#  # GET /logins/1/edit
#  def edit
#    @logins = Logins.find(params[:id])
#  end
#
#  # POST /logins
#  # POST /logins.xml
#  def create
#    @logins = Logins.new(params[:logins])
#
#    respond_to do |format|
#      if @logins.save
#        flash[:notice] = 'Logins was successfully created.'
#        format.html { redirect_to(@logins) }
#        format.xml  { render :xml => @logins, :status => :created, :location => @logins }
#      else
#        format.html { render :action => "new" }
#        format.xml  { render :xml => @logins.errors, :status => :unprocessable_entity }
#      end
#    end
#  end
#
#  # PUT /logins/1
#  # PUT /logins/1.xml
#  def update
#    @logins = Logins.find(params[:id])
#
#    respond_to do |format|
#      if @logins.update_attributes(params[:logins])
#        flash[:notice] = 'Logins was successfully updated.'
#        format.html { redirect_to(@logins) }
#        format.xml  { head :ok }
#      else
#        format.html { render :action => "edit" }
#        format.xml  { render :xml => @logins.errors, :status => :unprocessable_entity }
#      end
#    end
#  end
#
#  # DELETE /logins/1
#  # DELETE /logins/1.xml
#  def destroy
#    @logins = Logins.find(params[:id])
#    @logins.destroy
#
#    respond_to do |format|
#      format.html { redirect_to(logins_url) }
#      format.xml  { head :ok }
#    end
#  end
end
