json.extract! testresult, :id, :test_case_name, :feature_name, :test_result, :environment, :error_msg, :duration, :created_at, :updated_at
json.url testresult_url(testresult, format: :json)
