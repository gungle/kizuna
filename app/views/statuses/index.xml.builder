xml.statuses(:type => "array") do
  xml.result("OK")
  @statuses.each do |status|
    xml.status do
  	  xml.id(status.id, :type => "integer")
  	  xml.user_id(status.user_id, :type => "integer")
  	  xml.full_name(status.full_name, :type => "string")
  	  xml.full_name_kana(status.full_name_kana, :type => "string")
  	  xml.position(position(status.position), :type => "integer")
  	  xml.status(status(status.status), :type => "integer")
      xml.public_flag(status.public_flag, :type => "integer")
  	  xml.now_lat(status.now_lat, :type => "float")
  	  xml.now_lon(status.now_lon, :type => "float")
  	  xml.note(status.note, :type => "text")
      xml.icon_path(status.icon_path, :type => "text") 
  	  xml.created_at(status.created_at.strftime("%Y/%m/%d %H:%M:%S"), :type => "datetime")	  
  	  xml.updated_at(status.updated_at.strftime("%Y/%m/%d %H:%M:%S"), :type => "datetime")	  	  
    end
  end
end
