class Testresult < ApplicationRecord
	validates_presence_of :test_case_name, :feature_name, :test_result

	def self.get_distinct_feature_name
		Testresult.find_by_sql("select distinct feature_name from testresults where feature_name != ''")
	end

	def self.get_test_result_with_feature_name feature_name
		Testresult.find_by_sql("select * from testresults where feature_name = '#{feature_name}' group by test_case_name")
	end
end
