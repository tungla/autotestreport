class TestresultsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_testresult, only: [:show, :edit, :update, :destroy]

  # GET /testresults
  # GET /testresults.json
  def index
    @failed_cases = Testresult.get_failed_test_case.paginate(:page => params[:failed_page], :per_page => 5)
    @feature_names = Testresult.get_distinct_feature_name.paginate(:page => params[:feature_page], :per_page => 5)
    # @feature_names = Testresult.paginate(:page => params[:page], :per_page => 5)
    @number_of_testcase = []
    @feature_names.each do |feature_name|
      @number_of_testcase = @number_of_testcase.push(Testresult.get_test_case_number_with_feature_name(feature_name.feature_name))
    end
    @run_count_testcase = []
    @feature_names.each do |feature_name|
      @run_count_testcase = @run_count_testcase.push(Testresult.get_test_case_run_count_with_feature(feature_name.feature_name))
    end
  end

  # GET /testresults/1
  # GET /testresults/1.json
  def show
    @testresults = Testresult.get_test_result_with_feature_name(params[:feature_name])
  end

  # GET /testresults/new
  def new
    @testresult = Testresult.new
  end

  # GET /testresults/1/edit
  def edit
  end

  # POST /testresults
  # POST /testresults.json
  def create
    @testresult = Testresult.new(testresult_params)

    respond_to do |format|
      if @testresult.save
        format.html { redirect_to @testresult, notice: 'Testresult was successfully created.' }
        format.json { render :show, status: :created, location: @testresult }
      else
        format.html { render :new }
        format.json { render json: @testresult.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /testresults/1
  # PATCH/PUT /testresults/1.json
  def update
    respond_to do |format|
      if @testresult.update(testresult_params)
        format.html { redirect_to @testresult, notice: 'Testresult was successfully updated.' }
        format.json { render :show, status: :ok, location: @testresult }
      else
        format.html { render :edit }
        format.json { render json: @testresult.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /testresults/1
  # DELETE /testresults/1.json
  def destroy
    @testresult.destroy
    respond_to do |format|
      format.html { redirect_to testresults_url, notice: 'Testresult was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_testresult

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def testresult_params
      params.permit(:test_case_name, :feature_name, :test_result, :environment, :error_msg, :duration)
    end
end
