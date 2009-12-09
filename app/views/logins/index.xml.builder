xml.login do
  if @login.result == "OK"
    xml.result("OK")
    xml.user do
      xml.user_id(@login.id, :type => "integer")
      xml.group_id(@login.group_id, :type => "integer")
    end
  else
    xml.result("NG")    
  end
end