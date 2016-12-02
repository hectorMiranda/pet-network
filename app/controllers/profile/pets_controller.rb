module Profile
  class PetsController < ProfileController

    def index
      @pets = Pet.most_recent
    end

    def show
      @pet = Pet.friendly.find(params[:id])
    end
  end
end
