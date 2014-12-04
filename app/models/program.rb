class Program < ActiveRecord::Base
  has_many :users
  mount_uploader :form, FormUploader

end
