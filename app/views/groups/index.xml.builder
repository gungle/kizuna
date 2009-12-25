xml.groups(:type => "array") do
  xml.result("OK")
  @groups.each do |group|
    xml.group do
      xml.id(group.id, :type => "integer")
      xml.group_name(group.group_name, :type => "string")
      xml.default_lat(group.default_lat, :type => "float")
      xml.default_lon(group.default_lon, :type => "float")
      xml.created_at(group.created_at.strftime("%Y/%m/%d %H:%M:%S"), :type => "datetime")    
      xml.updated_at(group.updated_at.strftime("%Y/%m/%d %H:%M:%S"), :type => "datetime")        
    end
  end
end