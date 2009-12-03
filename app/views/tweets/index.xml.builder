xml.tweets(:type => "array") do
  xml.result("OK")
  @tweets.each do |tweet|
    xml.tweet do
      xml.id(tweet.id, :type => "integer")
      xml.group_id(tweet.group_id, :type => "integer")
      xml.parent_id(tweet.parent_id, :type => "integer")
      xml.user_id(tweet.user_id, :type => "integer")  
      xml.full_name(tweet.user.full_name, :type => "string")
      xml.icon_path(tweet.user.icon_path, :type => "string")      
      xml.tweet(tweet.tweet, :type => "text")
      xml.tweet_lat(tweet.tweet_lat, :type => "float")
      xml.tweet_lon(tweet.tweet_lon, :type => "float")
      xml.picture_path(tweet.picture_path, :type => "string")
      xml.created_at(tweet.created_at.strftime("%Y-%m-%dT%H:%M:%S"), :type => "datetime")    
      xml.updated_at(tweet.updated_at.strftime("%Y-%m-%dT%H:%M:%S"), :type => "datetime")        
    end
  end
end