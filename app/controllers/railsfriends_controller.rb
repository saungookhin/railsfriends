class RailsfriendsController < ApplicationController
  before_action :set_railsfriend, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /railsfriends or /railsfriends.json
  def index
    @railsfriends = Railsfriend.all
  end

  # GET /railsfriends/1 or /railsfriends/1.json
  def show
  end

  # GET /railsfriends/new
  def new
   # @railsfriend = Railsfriend.new
    @railsfriend = current_user.railsfriends.build
    
  end

  # GET /railsfriends/1/edit
  def edit
  end

  # POST /railsfriends or /railsfriends.json
  def create
    #@railsfriend = Railsfriend.new(railsfriend_params)
     @railsfriend = current_user.railsfriends.build(railsfriend_params)

    respond_to do |format|
      if @railsfriend.save
        format.html { redirect_to @railsfriend, notice: "Railsfriend was successfully created." }
        format.json { render :show, status: :created, location: @railsfriend }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @railsfriend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /railsfriends/1 or /railsfriends/1.json
  def update
    respond_to do |format|
      if @railsfriend.update(railsfriend_params)
        format.html { redirect_to @railsfriend, notice: "Railsfriend was successfully updated." }
        format.json { render :show, status: :ok, location: @railsfriend }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @railsfriend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /railsfriends/1 or /railsfriends/1.json
  def destroy
    @railsfriend.destroy
    respond_to do |format|
      format.html { redirect_to railsfriends_url, notice: "Railsfriend was successfully destroyed." }
      format.json { head :no_content }
    end 
  end

  def correct_user

     @railsfriend = current_user.railsfriends.find_by(id: params[:id])
     redirect_to railsfriends_path, notice: "Not Authorized to Edit This Friend" if @railsfriend.nil?
   end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_railsfriend
      @railsfriend = Railsfriend.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def railsfriend_params
      params.require(:railsfriend).permit(:first_name, :last_name, :email, :phone, :twitter, :user_id)
    end
end
