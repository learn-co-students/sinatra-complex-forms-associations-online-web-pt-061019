class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index'
  end

  get '/pets/new' do
    @owners = Owner.all
    #binding.pry
    erb :'/pets/new'
  end
end

  post '/pets' do
    @pet = Pet.create(name: params[:pet_name])
    if !params[:owner_name].empty?
      @pet.owner = Owner.create(name: params[:owner_name])
      @pet.save
    else
      @pet.owner = Owner.find_by(id: params[:owner_id])
      @pet.save
    end
    #binding.pry
      redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id/edit' do
    @pet = Pet.find_by(params[:id])
    @owner = Owner.find_by(params[:owner_id])
    erb :'/pets/edit'
  end

  get '/pets/:id' do
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  patch '/pets/:id' do
    @owner = Owner.find(params[:id])
    @owner.update(params[:owner_id])
    @owner.save
    redirect to "pets/#{@pet.id}"
  end
end
