class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index'
  end

  get '/pets/new' do
    @owners = Owner.all
    erb :'/pets/new'
  end

  post '/pets' do
    @pets = Pets.all
    redirect to "/pets/#{@pet.id}"
  end

  get '/pets/:id' do
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  patch '/pets/:id' do
    # @pet = Pet.all.find_by_id(params[:id])
    # @pet.update(params[:pet]) # This updates the whole owner object, as opposed to one property at a time with @owner[:name]
    # @pet.save

    # @owners = Owner.all

    @owners = Owner.all

    @pet = Pet.new(params[:name])


    @owner.id << @pet.id


    redirect to "pets/#{@pet.id}"
  end
end
