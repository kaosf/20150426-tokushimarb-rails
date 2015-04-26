class Following
  include Mongoid::Document
  #embedded_in :from_user
  #embedded_in :to_user
  belongs_to :from_user, class_name: "User", inverse_of: nil
  belongs_to :to_user, class_name: "User", inverse_of: nil
end
