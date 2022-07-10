class CompaniesController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_company, only: [ :show, :edit, :update, :destroy ]

    def index
        @companies = Company.all
    end

    def show
    end

    def new
        @company = Company.new
    end 

    def create
        @company = Company.new(company_params)
        respond_to do |format|
            if @company.save
                format.html { redirect_to @company, notice: 'Company was successfully created.' }

            else 
                format.html { render :new }
            end
        end
    end

    def edit
    end

    def update
        respond_to do |format|
            if @company.update(company_params)
                format.html { redirect_to @company, notice: 'Company was successfully updated.' }
            else 
                format.html { render :edit }
            end
        end
    end

    def destroy
        @company.destroy
        redirect_to root_path, status: :see_other
    end

    private

    def set_company
        @company = Company.find(params[:id])
    end

    def company_params
        params.require(:company).permit(:title, :summary)
    end
end
