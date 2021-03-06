class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.page(params[:page])
  end

  def search
    adapter = ActiveRecord::Base.connection.adapter_name
  
    case adapter
    when 'Mysql2'
      @users = User.where("MATCH (name, email) AGAINST ('#{params[:q]}' COLLATE utf8_general_ci IN BOOLEAN MODE)")
      # @users = User.where("MATCH (name, email) AGAINST (lower('#{params[:q].to_s.downcase}'))")
    when 'PostgreSQL' 
      @users = User.where('name ILIKE ? OR email ILIKE ?', "%#{params[:q]}%", "%#{params[:q]}%")
    else
      @users = User.where('name LIKE ? OR email LIKE ?', "%#{params[:q]}%", "%#{params[:q]}%")
    end

    respond_to do |format|
      format.json { render json: @users.map { |p| { id: p.id, name: "#{p.name} - #{p.email}" } } }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :cpf)
    end
end
