module Users 
  class PetsController < UserController
    before_action :set_pet, only: [:show, :edit, :update, :destroy]

    # GET /pets
    # GET /pets.json
    def index
      @pets = current_user.pets.most_recent
    end

    def show
    end

    def new
      @pet = current_user.pets.new
    end

    def edit
    end

    def create
      @pet = current_user.pets.new(pet_params)

      respond_to do |format|
        if @pet.save
          format.html { redirect_to users_pets_path(@pet), notice: 'Pet was successfully created.' }
          format.json { render :show, status: :created, location: @pet }
        else
          format.html { render :new }
          format.json { render json: @pet.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @pet.update(pet_params)
          format.html { redirect_to users_pets_path(@pet), notice: 'Pet was successfully updated.' }
          format.json { render :show, status: :ok, location: @pet }
        else
          format.html { render :edit }
          format.json { render json: @pet.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @pet.destroy
      respond_to do |format|
        format.html { redirect_to users_pets_url, notice: 'Pet was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      def set_pet
        @pet = current_user.pets.friendly.find(params[:id])
      end

      def pet_params
        params.require(:pet).permit(:name, :breed, :sex, :age, :image_url)
      end
    end
end
