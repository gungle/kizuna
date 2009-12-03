xml.maps(:type => "array") do
  xml.result("OK")
  @maps.each do |map|
    xml.map do
      xml.id(map.id, :type => "integer")
      xml.group_id(map.group_id, :type => "integer")
      xml.pos_title(map.pos_title, :type => "string")
      xml.pos_explain(map.pos_explain, :type => "text")
      xml.pos_kind(map.pos_kind, :type => "integer")
      xml.pos_lat(map.pos_lat, :type => "float")
      xml.pos_lon(map.pos_lon, :type => "float")
      xml.picture_path(map.picture_path, :type => "string")
      xml.created_at(map.created_at.strftime("%Y-%m-%dT%H:%M:%S"), :type => "datetime")    
      xml.updated_at(map.updated_at.strftime("%Y-%m-%dT%H:%M:%S"), :type => "datetime")        
    end
  end
end