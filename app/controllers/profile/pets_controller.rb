module Profile
  class PetsController < ProfileController

    def index
      @pets = Pet.most_recent.paginate(:page => params[:page], per_page: 3)

    end

    def show
      @pet = Pet.friendly.find(params[:id])
    end
  end
end
