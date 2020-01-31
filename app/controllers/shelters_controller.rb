class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def new
  end

  def create
   shelter = Shelter.create({
     name: params[:name],
     address: params[:address],
     city: params[:city],
     state: params[:state],
     zip: params[:zip]
     })
   redirect_to '/shelters'
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    shelter = Shelter.find(params[:id])
    shelter.update({
                    name:     params[:name],
                    address:  params[:address],
                    city:     params[:city],
                    state:    params[:state],
                    zip:      params[:zip]
                   })
    redirect_to "/shelters/#{shelter.id}"
  end

  def destroy
    shelter = Shelter.find(params[:id])
    shelter.destroy
    redirect_to '/shelters'
  end

end
