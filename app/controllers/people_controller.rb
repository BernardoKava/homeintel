class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  # GET /people
  # GET /people.json
  def index
    @people = Person.all.paginate(page: params[:page], :per_page => 5).order("created_at DESC")

    @people.each do |person|
      @full_name = person.name + " " + person.surname
      person.fullname = @full_name
      person.save
    end

  end

  # GET /people/1
  # GET /people/1.json
  def show
    @full_name = @person.name + " " + @person.surname
    @person.fullname = @full_name


    @person_number = (@person.id + 10000)
    @person.person_number = @person_number

    @person.save
  end

  # GET /people/new
  def new
    @person = Person.new
  end



  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:name, :surname, :fullname, :active,:dob,:pps_number,
                                     emails_attributes: [:id, :email,:user_id,:active, :_destroy],
                                     telephones_attributes:
                                         [:id, :phone, :user_id, :active, :_destroy],
                                     addresses_attributes:[:id,:address,:user_id,:active,:_destroy],
                                     qualifications_attributes:[:id, :active,:name,
                                                                :school,:from, :to, :grade, :user_id,:_destroy],
                                     employments_attributes:[:id, :company,:company_address,:company_telephone,:company_email,
                                                             :company_details,:position, :from, :to,
                                                             :terminationreason,:actve,:role,:user_id,:_destroy],
                                     employmentreferences_attributes:
                                     [:id,:referee_active, :employment_id,:referee_name,:referee_telephone,:referee_email,
                                      :referee_details,:user_id,
                                      :_destroy],
                                     comments_attributes:[:id, :commentary, :user_id, :_destroy])
    end
end
