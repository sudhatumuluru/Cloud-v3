class Report < ActiveRecord::Base
	belongs_to :user
	mount_uploader :test_result, TestResultUploader
end
