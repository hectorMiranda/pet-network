class CommentsController < ApplicationController
  before_action :find_pet

  def create
    @comment = @pet.comments.create(params[:comment].permit(:content))
    @comment.user_id = current_user.id
    @comment.save

    if @comment.save
      redirect_to pet_path(@pet)
    else
      render 'new'
    end

  end

  def destroy
  end


  private
  def find_pet
    @pet = Pet.friendly.find(params[:pet_id])
  end

  def find_comment
    @comment = @pet.comments.find(params[:id])
  end
end
