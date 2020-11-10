class MenteesController < ApplicationController
  before_action :set_mentee, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index,:show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /mentees
  # GET /mentees.json
  def index
    @mentees = Mentee.all
  end

  # GET /mentees/1
  # GET /mentees/1.json
  def show
  end

  # GET /mentees/new
  def new
    #@mentee = Mentee.new
    @mentee=current_user.mentees.build
  end

  # GET /mentees/1/edit
  def edit
  end

  # POST /mentees
  # POST /mentees.json
  def create
    #@mentee = Mentee.new(mentee_params)
    @mentee=current_user.mentees.build(mentee_params)
    respond_to do |format|
      if @mentee.save
        format.html { redirect_to @mentee, notice: 'Mentee was successfully created.' }
        format.json { render :show, status: :created, location: @mentee }
      else
        format.html { render :new }
        format.json { render json: @mentee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mentees/1
  # PATCH/PUT /mentees/1.json
  def update
    respond_to do |format|
      if @mentee.update(mentee_params)
        format.html { redirect_to @mentee, notice: 'Mentee was successfully updated.' }
        format.json { render :show, status: :ok, location: @mentee }
      else
        format.html { render :edit }
        format.json { render json: @mentee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mentees/1
  # DELETE /mentees/1.json
  def destroy
    @mentee.destroy
    respond_to do |format|
      format.html { redirect_to mentees_url, notice: 'Mentee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def correct_user
    @mentee =current_user.mentees.find_by(id: params[:id])
    redirect_to mentees_path, notice: "Not autherized" if @mentee.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mentee
      @mentee = Mentee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mentee_params
      params.require(:mentee).permit(:name, :vtu, :dept, :marks, :user_id)
    end
end
