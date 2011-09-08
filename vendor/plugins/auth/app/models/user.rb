require "digest/sha1"
class User < ActiveRecord::Base
  set_table_name "auth_user"
  
  app_label = 'auth'
  
  acts_as_authentic do |c|
    c.logged_in_timeout 30.minutes
    c.validate_email_field = false    
    c.crypto_provider = Authlogic::CryptoProviders::Sha1
    c.login_field = 'username'
  end
  
  def valid_password?(value)
    #puts '#####################'
    #puts self.inspect
    parts = self.password.split('$', 3)
    #puts parts.inspect
    algorithm = parts[0]
    salt = parts[1]
    hsh = parts[2]
    if algorithm == 'sha1'
        hsh_check = Digest::SHA1.hexdigest(salt + value)
        #puts hsh
        if hsh === hsh_check
            return true
        end
    end
    false
  end
end
