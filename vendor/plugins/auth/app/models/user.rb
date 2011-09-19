require "digest/sha1"
class User < ActiveRecord::Base
  set_table_name "auth_user"

  def self.app_label
    'auth'
  end

  def valid_password?(value)
    parts = self.password.split('$', 3)
    algorithm = parts[0]
    salt = parts[1]
    hsh = parts[2]
    if algorithm == 'sha1'
        hsh_check = Digest::SHA1.hexdigest(salt + value)
        if hsh === hsh_check
            return true
        end
    end
    false
  end
end
