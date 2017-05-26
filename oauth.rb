class OauthUser < ActiveRecord::Base
 
 #################################### Twitter_OAUTH ####################################
  
 def self.twitter_details(token,secret)
   
      twitter_account = TwitterOAuth::Client.new(
        consumer_key: "Acess_key", 
        consumer_secret: "Secret_key",
        token: token,    
        secret: secret
      )

      twitter_profile = twitter_account.info
      begin
        website = twitter_profile["entities"]["url"]["urls"][0]["expanded_url"]
      rescue
      end
      formatted_account_info = Hash.new
      formatted_account_info["provider"] = 'twitter'
      formatted_account_info["uid"] =  twitter_profile["id"]
      formatted_account_info["name"] = twitter_profile["name"]
      formatted_account_info["description"] = twitter_profile["description"]
      formatted_account_info["access_token"] = token
      formatted_account_info["access_secret"] = secret
      formatted_account_info["image_url"] = twitter_profile["profile_image_url"]
      formatted_account_info["twitter_profile"] = "http://www.twitter.com/#{twitter_profile['screen_name']}"
          
    return formatted_account_info   
    
 end

end