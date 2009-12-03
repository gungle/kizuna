class MapsController < ApplicationController
  # GET /maps
  # GET /maps.xml
  def index
    
    # 初期化
    @maps = Array.new

    if ! params[:group_id].nil?
      # 該当のGroupIDのマップ一覧を取得
      group = Group.find(params[:group_id])
      @maps = group.maps
      
    elsif ! params[:map_id].nil?
      # 該当のMapIDのマップ情報を取得
      @maps << Map.find(params[:map_id])
      
    else
      # 全マップ一覧を取得
      @maps = Map.find(:all)
    
    end
  
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :layout=>false}
#      format.xml  { render :xml => @maps }
    end

  # エラー処理
  rescue => ex
    respond_to do |format|
#      format.html # show.html.erb
      format.xml { render :xml => '<maps type="array"><results>NG</results></maps>' }
    end
    
  end

  # GET /maps/1
  # GET /maps/1.xml
  def show
    @map = Map.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @map }
    end
    
  # エラー処理
  rescue => ex
    respond_to do |format|
#      format.html # show.html.erb
      format.xml { render :xml => '<ng action="show" />' }
    end
  end

  # GET /maps/new
  # GET /maps/new.xml
  def new
    @map = Map.new
    @map.group_id = params[:group_id]
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @map }
    end
  end

  # GET /maps/1/edit
  def edit
    @map = Map.find(params[:id])
  end

  # POST /maps
  # POST /maps.xml
  def create
    @map = Map.new(params[:map])

    respond_to do |format|
      if @map.save
        flash[:notice] = 'Map was successfully created.'
        format.html { redirect_to(@map) }
        format.xml  { render :xml => @map, :status => :created, :location => @map }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @map.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /maps/1
  # PUT /maps/1.xml
  def update
    @map = Map.find(params[:id])

    respond_to do |format|
      if @map.update_attributes(params[:map])
        flash[:notice] = 'Map was successfully updated.'
        format.html { redirect_to(@map) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @map.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /maps/1
  # DELETE /maps/1.xml
  def destroy
    @map = Map.find(params[:id])
    @map.destroy

    respond_to do |format|
      format.html { redirect_to(maps_url) }
      format.xml  { head :ok }
    end
  end
end
