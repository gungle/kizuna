class UsersController < ApplicationController
  
  
  # GET /users
  # GET /users.xml
  def index

    # 初期化
    @users = Array.new
    
    if ! params[:group_id].nil?

      # ログイン済みか、公開フラグがON. (WebAccess対策)
      if session[:public_flag].nil? || session[:public_flag] == 1
        # 該当のGroupIDのユーザ一覧を取得
        group = Group.find(params[:group_id])
  
        # グループ -> 家族 -> ユーザ 取得
        group.families.each do |fa|
          fa.users.each do |us|
            # 年齢を復帰 add by 2010.02.14
            us[:age] = 2010 - us[:birthday].strftime("%Y").to_i
            us[:address] = fa.address
            @users << us
          end
        end
        
      # 家族非公開。自分の家族情報のみ復帰
      else
        # 該当の家族を検索
        fa = Family.find(session[:family_id])
        fa.users.each do |us|
          # 年齢を復帰 add by 2010.02.14
          us[:age] = 2010 - us[:birthday].strftime("%Y").to_i
          us[:address] = fa.address
          @users << us
        end
        
      end
      
    elsif ! params[:family_id].nil?
      # 該当のFamilyIDのユーザ一覧を取得
      family = Family.find(params[:family_id])
        family.users.each do |us|
          # 年齢を復帰 add by 2010.02.14
          us[:age] = 2010 - us[:birthday].strftime("%Y").to_i
          us[:address] = family.address
          @users << us          
        end

    elsif ! params[:user_id].nil?
      # 該当のUserIDのユーザ一覧を取得
      user = User.find(params[:user_id])

      # 年齢を復帰 add by 2010.02.14
      user[:age] = 2010 - user[:birthday].strftime("%Y").to_i

      # ログイン済みか、公開フラグがON. (WebAccess対策)
      if session[:public_flag].nil? || session[:public_flag] == 1 || session[:family_id] == user[:family_id]
        address = user.family.address
        user[:address] = address
        @users << user
      
        # 家族非公開。自分の家族情報のみ復帰
      else
        respond_to do |format|
          format.xml { render :xml => '<users type="array"><results>NG</results><message>Access Deny.</message></users>' }
        end
        return 1
      end

    else
      # 全ユーザ一覧を取得
      all_users = User.find(:all)
      all_users.each do |user|
        address = user.family.address
        user[:address] = address
        @users << user
      end
      
    end
  
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :layout=>false}
    end
    
    # エラー処理
    rescue => ex
      respond_to do |format|
#      format.html # show.html.erb
      format.xml { render :xml => "<users type='array'><results>NG</results><message>#{ex.message}</message></users>" }
    end

  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end

  # エラー処理
  rescue => ex
    respond_to do |format|
#      format.html # show.html.erb
      format.xml { render :xml => '<ng action="show" />' }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new
    @user.family_id = params[:family_id]
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        flash[:notice] = 'User was successfully created.'
        format.html { redirect_to(@user) }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User was successfully updated.'
        format.html { redirect_to(@user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
