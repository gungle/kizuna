class GroupsController < ApplicationController
  # GET /groups
  # GET /groups.xml
  def index
    
    # 初期化
    @groups = Array.new
    
    if ! params[:group_id].nil?
      # 該当のGroupIDのグループ情報を取得
      @groups << Group.find(params[:group_id])
      
    else    
      @groups = Group.find(:all)
    end

    respond_to do |format|
      format.html # index.html.erb
#      format.xml  { render :xml => @groups }
      format.xml  { render :layout=>false}
    end
    
  # エラー処理
  rescue => ex
    respond_to do |format|
#      format.html # show.html.erb
      format.xml { render :xml => '<groups type="array"><results>NG</results></groups>' }
    end
  end

  # GET /groups/1
  # GET /groups/1.xml
  def show
    @group = Group.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @group }
    end
    
  # エラー処理
  rescue => ex
    respond_to do |format|
#      format.html # show.html.erb
      format.xml { render :xml => '<ng action="show" />' }
    end
  end

  # GET /groups/new
  # GET /groups/new.xml
  def new
    @group = Group.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @group }
    end
  end

  # GET /groups/1/edit
  def edit
    @group = Group.find(params[:id])
  end

  # POST /groups
  # POST /groups.xml
  def create
    @group = Group.new(params[:group])

    respond_to do |format|
      if @group.save
        flash[:notice] = 'Group was successfully created.'
        format.html { redirect_to(@group) }
        format.xml  { render :xml => @group, :status => :created, :location => @group }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /groups/1
  # PUT /groups/1.xml
  def update
    @group = Group.find(params[:id])

    respond_to do |format|
      if @group.update_attributes(params[:group])
        flash[:notice] = 'Group was successfully updated.'
        format.html { redirect_to(@group) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.xml
  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    respond_to do |format|
      format.html { redirect_to(groups_url) }
      format.xml  { head :ok }
    end
  end
end