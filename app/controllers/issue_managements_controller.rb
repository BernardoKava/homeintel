class IssueManagementsController < ApplicationController
  before_action :set_issue_management, only: [:show, :edit, :update, :destroy]

  # GET /issue_managements
  # GET /issue_managements.json
  def index
    @issue_managements = IssueManagement.all.paginate(page: params[:page], :per_page => 10).order("created_at DESC")
  end

  # GET /issue_managements/1
  # GET /issue_managements/1.json
  def show
    @ref = @issue_management.id
    @corrective_actions = CorrectiveAction.where(issue_management_id: @ref)
  end

  # GET /issue_managements/new
  def new
    @issue_management = IssueManagement.new
  end

  # GET /issue_managements/1/edit
  def edit
  end

  # POST /issue_managements
  # POST /issue_managements.json
  def create
    @issue_management = IssueManagement.new(issue_management_params)

    respond_to do |format|
      if @issue_management.save
        format.html { redirect_to @issue_management, notice: 'Issue management was successfully created.' }
        format.json { render :show, status: :created, location: @issue_management }
      else
        format.html { render :new }
        format.json { render json: @issue_management.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issue_managements/1
  # PATCH/PUT /issue_managements/1.json
  def update
    respond_to do |format|
      if @issue_management.update(issue_management_params)
        format.html { redirect_to @issue_management, notice: 'Issue management was successfully updated.' }
        format.json { render :show, status: :ok, location: @issue_management }
      else
        format.html { render :edit }
        format.json { render json: @issue_management.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issue_managements/1
  # DELETE /issue_managements/1.json
  def destroy
    @issue_management.destroy
    respond_to do |format|
      format.html { redirect_to issue_managements_url, notice: 'Issue management was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue_management
      @issue_management = IssueManagement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_management_params
      params.require(:issue_management).permit(:issue_title, :description, :completion_rate, :person_id,
                                               :completion_target_date, :completion_actual_date, corrective_actions_attributes:[:id,:title,
          :description, :target_completion_date, :actual_completion_date, :person_id, :user_id,:_destroy], comments_attributes:[:id, :commentary, :user_id, :_destroy])
    end
end
