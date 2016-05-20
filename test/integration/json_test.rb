require 'test_helper'

class JsonTest < ActionDispatch::IntegrationTest

  test "get_skins" do
    post "/en/get_skins.json", params:{locale: :en, id: 0, page: 1}, xhr: true
    post "/en/get_skins.json", params:{locale: :en, id: categories(:one).id, page: 1}, xhr: true
    assert_response :success 
  end    

  test "get_skin" do    
    post "/en/get_skin.json", params:{locale: :en, id: skins(:two).id}, xhr: true
    assert_response :success   
  end 

  test "get_locations" do    
    post "/en/get_locations.json", params:{locale: :en, id: locations(:one).id}, xhr: true
    assert_response :success   
  end 

  test "get_about_info" do   
    post "/en/get_about_info.json", params:{locale: :en, id: abouts(:one).id}, xhr: true
    assert_response :success   
  end 

  test "get_casting" do    
    post "/en/get_casting.json", params:{locale: :en, type: castings(:one).people_type}, xhr: true
    assert_response :success   
  end

end