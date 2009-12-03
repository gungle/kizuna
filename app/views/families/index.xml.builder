xml.families(:type => "array") do
  xml.result("OK")
  @families.each do |family|
    xml.family do
      xml.id(family.id, :type => "integer")
      xml.group_id(family.group_id, :type => "integer")
      xml.family_name(family.family_name, :type => "string")
      xml.user_id(family.user_id, :type => "integer")
      xml.address(family.address, :type => "string")
      xml.tel(family.tel, :type => "string")
      xml.fax(family.fax, :type => "string")
      xml.home_lat(family.home_lat, :type => "float")
      xml.home_lon(family.home_lon, :type => "float")
      xml.icon_path(family.icon_path, :type => "string")
      xml.created_at(family.created_at.strftime("%Y-%m-%dT%H:%M:%S"), :type => "datetime")    
      xml.updated_at(family.updated_at.strftime("%Y-%m-%dT%H:%M:%S"), :type => "datetime")        
    end
  end
end