class Testresult < ApplicationRecord
	validates_presence_of :test_case_name, :feature_name, :test_result

	@time_zone = 'Asia/Ho_Chi_Minh'

	def self.get_distinct_feature_name
		# Testresult.find_by_sql ["select distinct feature_name from testresults where feature_name != ''"]
		Testresult.select(:feature_name).distinct.where("feature_name != ''")
	end

	def self.get_test_result_with_feature_name feature_name
		# Testresult.where("feature_name = '#{feature_name}'").group(:test_case_name)
		Testresult.select("DISTINCT ON (test_case_name) test_case_name,*").where("feature_name = '#{feature_name}'").order('test_case_name, created_at desc')
	end

	def self.get_test_case_number_with_feature_name feature_name
		Testresult.select(:test_case_name).distinct.where("feature_name = '#{feature_name}'").count
	end

	def self.get_test_case_run_count_with_feature feature_name
		Testresult.select(:test_case_name).where("feature_name = '#{feature_name}'").count
	end

	def self.get_failed_test_case
		Testresult.select("*").where("test_result = 'Failed'").order('created_at desc')
	end

	def self.get_failed_test_results_at_exact_date date
		date = date.in_time_zone(@time_zone)
		Testresult.select("DISTINCT ON (test_case_name) test_case_name,*").where("test_result = 'Failed' and (created_at AT TIME ZONE 'UTC' AT TIME ZONE '#{@time_zone}')::date = date '#{date}'").order('test_case_name, created_at desc')
	end

	def self.get_passed_test_results_with_time_range range
		Testresult.select("DISTINCT test_case_name").where("test_result = 'Passed' and (created_at AT TIME ZONE 'UTC' AT TIME ZONE '#{@time_zone}')::date > (current_date - #{range}) AT TIME ZONE 'UTC' AT TIME ZONE '#{@time_zone}' ")
	end

	def self.get_total_test_results_with_time_range range
		Testresult.select("DISTINCT test_case_name").where("(created_at AT TIME ZONE 'UTC' AT TIME ZONE '#{@time_zone}')::date > (current_date - #{range}) AT TIME ZONE 'UTC' AT TIME ZONE '#{@time_zone}'")
	end

	def self.get_test_result_with_exact_date date
		date = date.in_time_zone(@time_zone)
		Testresult.select("DISTINCT ON (test_case_name) test_case_name,*").where("(created_at AT TIME ZONE 'UTC' AT TIME ZONE '#{@time_zone}')::date = date '#{date}'").order('test_case_name, created_at desc')
	end
end
