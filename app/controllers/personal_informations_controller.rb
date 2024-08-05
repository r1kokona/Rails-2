class PersonalInformationsController < ApplicationController
    def index
        @personal_informations = PersonalInformation.all
    end
    def show
        @personal_information = PersonalInformation.find(params[:id])
    end
    def new
        @personal_information = PersonalInformation.new
    end
    def create
        @personal_information = PersonalInformation.new(personal_information_params)
        if @personal_information.save
            redirect_to @personal_information
        else
            render :new, status: :unprocessable_entity
        end
    end
    def update
        @personal_information = PersonalInformation.find([:id])
        if @personal_information.update(personal_information_params)
            redirect_to @personal_information
        else
            render :edit, status: :unprocessable_entity
        end
    end
    def destroy
        @personal_information = PersonalInformation.find([:id])
        @personal_information.destroy

        redirect_to root_path, status: :see_other
    end

    private
    def personal_information_params
        params.require(:personal_information).permit(:id)
    end
end
