class SubsController < ApplicationController
  before_action :require_user, except: [:index, :show]
  before_action :require_user_owns_subs, only: [:edit, :update]



  def new
    @sub = Sub.new



  end

  def create



      @sub = current_user.subs.new(sub_params)
      @sub.moderator_id = current_user.id

    if @sub.save
      redirect_to subs_url
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end

  end

  def index
    @sub = Sub.all

  end

  def show
    @sub = Sub.find(params[:id])

  end


  def edit
    @sub = Sub.find(params[:id])

  end

  def update
    @sub = Sub.find(params[:id])
    if @sub.update_attributes(sub_params)
      redirect_to @sub
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end

  end














  private
  def require_user_owns_subs
    return if current_user.subs.find_by(id: params[:id])
    render json: 'forbidden', status: :forbidden
  end

  def sub_params
    params.require(:sub).permit(:name, :description)
  end


end
