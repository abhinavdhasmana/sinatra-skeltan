require 'spec_helper'

describe  HopprApp::Controllers::AppUser do	
  def app
    HopprApp::Controllers::AppUser
  end

    describe "post /*", :vcr do
      it "should return response and status code as recieved from hoppr services" do
        post '/login.json', 'mobile_number'=>'911111111111', 'password'=>'passwrd'
        last_response.status.should == 201
        last_response.body.nil?.should == false
        @session_id = JSON.parse(last_response.body)["session_id"]
      end

      it "should return 404 if a url is hit that is not white listed" do
        post '/something_fishy', 'mobile_number'=>'911111111111', 'password'=>'passwrd'
        last_response.status.should == 404  
      end

      it "should get the params for different content types" do
        
        params_hash={"user"=>{"username"=>"testuser","email"=>"test@test.com","password"=>"pass1","password_confirmation"=>"pass1"}}
        
        post '/login.json', params_hash
        last_request.params.empty?.should == false
        params_hash.should                == last_request.params
  
        json_string="{\"user\":{\"password_confirmation\":\"pass1\",\"username\":\"testuser\",\"password\":\"pass1\",\"email\":\"test@test.com\"}}"

        post '/login.json', JSON(json_string)
        last_request.params.empty?.should == false
        params_hash.should                == last_request.params
        
        post '/login.json', json_string, "content_type"=>"application/json"
        last_request.env["content_type"].should == "application/json"
        last_request.params.empty?.should == false
      end
      
    end

    describe "get /*", :vcr do
      it "should return response code and response status as returned by services" do
        get '/is_mobile_number_verified.json', 'session_id'=>'something-crappy'
        last_response.status.should == 401
      end

      it "should return 404 if dummy url is hit" do
        get '/blah'
        last_response.status.should == 404
      end
    end

    describe "put /anything" do
      it "should return 404 if put url is hit" do
        put '/anything'
        last_response.status.should == 404
      end

      it 'should check if the server is responding' do
        put '/ping'
        last_response.should be_ok
        last_response.body.should include "Hello world!"
      end
    end

    describe "put /anything" do
      it "should return 404 if delete url is hit" do
        delete '/anything'
        last_response.status.should == 404
      end

      it 'should check if the server is responding' do
        delete '/ping'
        last_response.should be_ok
        last_response.body.should include "Hello world!"
      end
    end

end
