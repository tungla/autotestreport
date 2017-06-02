class TestresultcommentsController < ApplicationController
  before_action :set_testresultcomment, only: [:show, :edit, :update, :destroy]

  # GET /testresultcomments
  # GET /testresultcomments.json
  def index
    @testresultcomments = Testresultcomment.all
  end

  # GET /testresultcomments/1
  # GET /testresultcomments/1.json
  def show
  end

  # GET /testresultcomments/new
  def new
    @testresultcomment = Testresultcomment.new
  end

  # GET /testresultcomments/1/edit
  def edit
  end

  # POST /testresultcomments
  # POST /testresultcomments.json
  def create
    @testresultcomment = Testresultcomment.new(testresultcomment_params)

    respond_to do |format|
      if @testresultcomment.save
        format.html { redirect_to @testresultcomment, notice: 'Testresultcomment was successfully created.' }
        format.json { render :show, status: :created, location: @testresultcomment }
      else
        format.html { render :new }
        format.json { render json: @testresultcomment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /testresultcomments/1
  # PATCH/PUT /testresultcomments/1.json
  def update
    respond_to do |format|
      if @testresultcomment.update(testresultcomment_params)
        format.html { redirect_to @testresultcomment, notice: 'Testresultcomment was successfully updated.' }
        format.json { render :show, status: :ok, location: @testresultcomment }
      else
        format.html { render :edit }
        format.json { render json: @testresultcomment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /testresultcomments/1
  # DELETE /testresultcomments/1.json
  def destroy
    @testresultcomment.destroy
    respond_to do |format|
      format.html { redirect_to testresultcomments_url, notice: 'Testresultcomment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_testresultcomment
      @testresultcomment = Testresultcomment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def testresultcomment_params
      params.fetch(:testresultcomment, {})
    end
end
