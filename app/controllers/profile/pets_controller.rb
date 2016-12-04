module Profile
  class PetsController < ProfileController

    def index
      @pets = Pet.most_recent
      @pets = @pets.breed(params[:breed]) if params[:breed].present?
      @pets = @pets.sex(params[:sex]) if params[:sex].present?
      @pets = @pets.age(params[:age]) if params[:age].present?
      @pets = @pets.paginate(:page => params[:page], per_page: 3)
    end

    def show
      @pet = Pet.friendly.find(params[:id])
      @comments = Comment.where(pet_id:  @pet)
    end

  end
end
