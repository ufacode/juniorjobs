# frozen_string_literal: true
class VacanciesController < ApplicationController
  before_action :set_vacancy, only: [:edit, :show]
  def new
    @vacancy = Vacancy.new
  end

  def index
    @vacancy = Vacancy.all
  end

  def create
    @vacancy = Vacancy.new(vacancy_params)
    if @vacancy.save
      redirect_to vacancy_path(@vacancy), notice: "You vacancy created successfully"
    else
      render 'new'
      end
  end

  def update
    if @vacancy.update_attributes(params[:id])
      redirect_to @vacancy
    else
      render 'edit'
    end
  end

  def edit
    
  end

  def show
    
  end

  private

  def set_vacancy
    @vacancy = Vacancy.find(params[:id])
  end

  def vacancy_params
    params.require(:vacancy).permit(:name, :kind, :description, :location, :remote, :company,
                                    :site, :phone)
    end
end
