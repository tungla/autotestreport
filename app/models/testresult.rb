class Testresult < ApplicationRecord
	validates_presence_of :test_case_name, :feature_name, :test_result

	def self.get_distinct_feature_name
		# Testresult.find_by_sql ["select distinct feature_name from testresults where feature_name != ''"]
		Testresult.select(:feature_name).distinct.where("feature_name != ''")
	end

	def self.get_test_result_with_feature_name feature_name
		# Testresult.where("feature_name = '#{feature_name}'").group(:test_case_name)
		Testresult.select("DISTINCT ON (test_case_name) test_case_name,*").where("feature_name = '#{feature_name}'")
	end

	def self.get_test_case_number_with_feature_name feature_name
		Testresult.select(:test_case_name).distinct.where("feature_name = '#{feature_name}'").count
	end

	def self.get_test_case_run_count_with_feature feature_name
		Testresult.select(:test_case_name).where("feature_name = '#{feature_name}'").count
	end
end
