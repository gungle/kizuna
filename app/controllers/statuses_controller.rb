class StatusesController < ApplicationController
#  skip_before_filter :verify_authenticity_token
  
  # GET /statuses
  # GET /statuses.xml
  def index

    @statuses = Array.new
    
    if ! params[:group_id].nil?
      # 該当のGroupIDの状況一覧を取得
      group = Group.find(params[:group_id])
      # グループ -> 家族 -> ユーザ -> 状況 取得
      group.families.each do |fa|
        fa.users.each do |us|
          # 必要なその他の情報をハッシュに入れて渡す
          us.status[:full_name] = us.full_name           # 氏名
          us.status[:full_name_kana] = us.full_name_kana # 氏名(カナ)
          us.status[:icon_path] = us.icon_path           # iconパス。あとでURLに変換する ★

          @statuses << us.status
        end
      end

    elsif ! params[:family_id].nil?
      # 該当のFamilyIDの状況一覧を取得
      family = Family.find(params[:family_id])
      # 家族 -> ユーザ -> 状況 取得
      family.users.each do |us|
        # 必要なその他の情報をハッシュに入れて渡す
        us.status[:full_name] = us.full_name           # 氏名
        us.status[:full_name_kana] = us.full_name_kana # 氏名(カナ)
        us.status[:icon_path] = us.icon_path           # iconパス。あとでURLに変換する ★
        @statuses << us.status
      end

    elsif ! params[:user_id].nil?
      # 該当のFamilyIDの状況一覧を取得
      user = User.find(params[:user_id])
      # ユーザ -> 状況 取得
      # 必要なその他の情報をハッシュに入れて渡す
      user.status[:full_name] = user.full_name           # 氏名
      user.status[:full_name_kana] = user.full_name_kana # 氏名(カナ)
      user.status[:icon_path] = user.icon_path           # iconパス。あとでURLに変換する ★
      @statuses << user.status

    else
      # output error xml. 
    
    end

    # 出力
    respond_to do |format|
      format.html # index.html.erb
#      format.xml  { render :xml => @statuses }
      format.xml  { render :layout=>false}
      
    end
    
  # エラー処理
  rescue => ex
    respond_to do |format|
#      format.html # show.html.erb
      format.xml { render :xml => '<statuses type="array"><results>NG</results></statuses>' }
    end
  end

  # GET /statuses/1
  # GET /statuses/1.xml
  def show
    @status = Status.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @status }
    end

  # エラー処理
  rescue => ex
    respond_to do |format|
#      format.html # show.html.erb
      format.xml { render :xml => '<ng action="show" />' }
    end
  end

  # GET /statuses/new
  # GET /statuses/new.xml
  def new
    @status = Status.new
    @status.user_id = params[:user_id]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @status }
    end
  end

  # GET /statuses/1/edit
  def edit
    @status = Status.find(params[:id])
  end

  # POST /statuses
  # POST /statuses.xml
  def create
    @status = Status.new(params[:status])

    respond_to do |format|
      if @status.save
        flash[:notice] = 'Status was successfully created.'
        format.html { redirect_to(@status) }
        format.xml  { render :xml => @status, :status => :created, :location => @status }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /statuses/1
  # PUT /statuses/1.xml
  def update
    @status = Status.find_by_user_id(params[:id])
#    @status = Status.find(params[:id])
p params
p @status
    respond_to do |format|
      if @status.update_attributes(params[:status])
        flash[:notice] = 'Status was successfully updated.'
        format.html { redirect_to(@status) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @status.errors, :status => :unprocessable_entity }
      end
    end

  # エラー処理
  rescue => ex
    respond_to do |format|
#      format.html # show.html.erb
      format.xml { render :xml => '<ng action="update" />' }
    end
  end

  # DELETE /statuses/1
  # DELETE /statuses/1.xml
  def destroy
    @status = Status.find(params[:id])
    @status.destroy

    respond_to do |format|
      format.html { redirect_to(statuses_url) }
      format.xml  { head :ok }
    end
  end
end
