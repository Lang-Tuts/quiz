class ExamsController < ApplicationController
  before_action :set_exam, only: [:show, :edit, :update, :destroy]

  # GET /exams
  # GET /exams.json
  def index
    @exams = Exam.where(:user_id => current_user.id )
  end

  # GET /exams/1
  # GET /exams/1.json
  def show
  end

  # GET /exams/new
  def new
    @exam = Exam.new
  end

  # GET /exams/1/edit
  def edit
  end
  
  def challenge
    @exams = Exam.where(:user_id => current_user.id )
    @students = User.all
  end
  def participate_challenge
    @exams = Examuser.where(:user_id => current_user.id).pluck(:exam_id)
    @exams = Exam.where(:id => @exams)
    @students = User.all
  end
  def challenge_users
    unless Examuser.find_by_user_id_and_exam_id(params[:user_id],params[:id])
        @exam_user = Examuser.new
        @exam_user.user_id = params[:user_id]
        @exam_user.exam_id = params[:id]
        @exam_user.save
    end
  end

  # POST /exams
  # POST /exams.json
  def create
    @exam = Exam.new(exam_params)
    @exam.user_id = current_user.id
    @exam.questions_count = @exam.questions_count > Question.count ? Question.count : @exam.questions_count
    @question_set = Question.pluck(:id).sample(@exam.questions_count)
    @exam.questionset = @question_set
    respond_to do |format|
      if @exam.save
        format.html { redirect_to @exam, notice: 'Exam was successfully created.' }
        format.json { render :show, status: :created, location: @exam }
      else
        format.html { render :new }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exams/1
  # PATCH/PUT /exams/1.json
  def update
    @exam.user_id = current_user.id
    respond_to do |format|
      if @exam.update(exam_params)
        format.html { redirect_to @exam, notice: 'Exam was successfully updated.' }
        format.json { render :show, status: :ok, location: @exam }
      else
        format.html { render :edit }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exams/1
  # DELETE /exams/1.json
  def destroy
    @exam.destroy
    respond_to do |format|
      format.html { redirect_to exams_url, notice: 'Exam was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam = Exam.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exam_params
      params.require(:exam).permit(:name,:count,:questions_count)
    end
end
