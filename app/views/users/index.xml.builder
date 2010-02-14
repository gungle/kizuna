xml.users(:type => "array") do
  xml.result("OK")
  @users.each do |user|
    xml.user do
      xml.id(user.id, :type => "integer")
      xml.family_id(user.family_id, :type => "integer")
      xml.full_name(user.full_name, :type => "string")
      xml.full_name_kana(user.full_name_kana, :type => "string")
      xml.address(user.address, :type => "string")
      xml.birthday(user.birthday, :type => "date")
      xml.age(user.age, :type => "integer")
      xml.blood(blood(user.blood), :type => "integer")
      xml.sex(sex(user.sex), :type => "integer")
      xml.tel(user.tel, :type => "string")
      xml.mail(user.mail, :type => "string")
      xml.job(user.job, :type => "string")
      xml.good_field(user.good_field, :type => "text")
      xml.medical_history(user.medical_history, :type => "text")
      xml.icon_path(user.icon_path, :type => "string")
      xml.created_at(user.created_at.strftime("%Y/%m/%d %H:%M:%S"), :type => "datetime")    
      xml.updated_at(user.updated_at.strftime("%Y/%m/%d %H:%M:%S"), :type => "datetime")        
    end
  end
end