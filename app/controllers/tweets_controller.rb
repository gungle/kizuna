class TweetsController < ApplicationController
  # GET /tweets
  # GET /tweets.xml
  def index
    
    # 初期化
    @tweets = Array.new
    
    if ! params[:group_id].nil? && ! params[:parent_id].nil?
      # 該当のGroupID、ParentIDのつぶやき一覧を取得
      @tweets = Tweet.find(:all, :conditions => ["group_id = ? and parent_id =?", params[:group_id], params[:parent_id]],
                           :order => "updated_at DESC",
                           :include => :user)
      
    elsif !params[:tweet_id].nil?
      @tweets << Tweet.find(params[:tweet_id])
      
    else
      # output error xml. 
      @tweets = Tweet.find(:all)
    
    end

    # 出力
    respond_to do |format|
      format.html # index.html.erb
#      format.xml  { render :xml => @tweets }
      format.xml  { render :layout=>false}
    end
    
  # エラー処理
  rescue => ex
    respond_to do |format|
#      format.html # show.html.erb
      format.xml { render :xml => '<tweets type="array"><results>NG</results></tweets>' }
    end    
  end

  # GET /tweets/1
  # GET /tweets/1.xml
  def show
    @tweet = Tweet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tweet }
    end
  end

  # GET /tweets/new
  # GET /tweets/new.xml
  def new
    @tweet = Tweet.new
    @tweet.user_id = params[:user_id]
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tweet }
    end
  end

  # GET /tweets/1/edit
  def edit
    @tweet = Tweet.find(params[:id])
  end

  # POST /tweets
  # POST /tweets.xml
  def create
    @tweet = Tweet.new(params[:tweet])

    respond_to do |format|
      if @tweet.save
        # 検索処理を速くするため、子行数を把握しておく
        if @tweet.parent_id != 0
          Tweet.update_all("children_cnt =children_cnt + 1",["id = ?", @tweet.parent_id])
        end

        flash[:notice] = 'Tweet was successfully created.'
        format.html { redirect_to(@tweet) }
        format.xml  { render :xml => @tweet, :status => :created, :location => @tweet }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tweet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tweets/1
  # PUT /tweets/1.xml
  def update
    @tweet = Tweet.find(params[:id])

    respond_to do |format|
      if @tweet.update_attributes(params[:tweet])
        flash[:notice] = 'Tweet was successfully updated.'
        format.html { redirect_to(@tweet) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tweet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.xml
  def destroy
    @tweet = Tweet.find(params[:id])

    # 検索処理を速くするため、子行数を把握しておく
    if @tweet.parent_id != 0
      Tweet.update_all("children_cnt =children_cnt - 1",["id = ?", @tweet.parent_id])
    end

    @tweet.destroy

    respond_to do |format|
      format.html { redirect_to(tweets_url) }
      format.xml  { head :ok }
    end
  end
end
