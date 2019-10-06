class PetsController < ApplicationController

  # Pet(id: integer, name: string, owner_id: integer)

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index'
  end

  get '/pets/new' do
    @owners = Owner.all
    erb :'/pets/new'
  end

  post '/pets' do
    # params = {"pet"=>{":name"=>"Prince"}, "owner"=>{":name"=>""}
    @pet = Pet.create(params[:pet])
    # @pet = Pet.create(params["pet"][":name"])

    if !params["owner"]["name"].empty?
      @pet.owner = Owner.create(name: params["owner"]["name"])
    end

    @pet.save

    redirect to "/pets/#{@pet.id}"
  end

  post '/pets' do
    @pets = Pet.all
    redirect to "/pets/:id"
  end

  get '/pets/:id/edit' do
    # @pet = Pet.all.find_by_id(params[:id])
    # puts params {"id"=>"1"}
    @pet = Pet.all.find(params[:id])
    @owners = Owner.all
    # puts params <Pet id: 1, name: "Maddy", owner_id: 1>
    erb :'/pets/edit'
  end

  get '/pets/:id' do
    # @pet = Pet.find_by_id(params[:id])
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  patch '/pets/:id' do
    # @pet = Pet.all.find_by_id(params[:id])
    # @pet.update(params[:pet]) # This updates the whole owner object, as opposed to one property at a time with @owner[:name]
    # @pet.save

    # @owners = Owner.all

    # @pet = Pet.all.find_by_id(params[:id])
    # @pet.update(params[:pet])

    # puts params {"_method"=>"patch", "pet"=>{"name"=>"gigi", "owner_id"=>"1"}, "owner"=>{"name"=>""}, "id"=>":id"}

    @pet = Pet.find_by_id(params[:id])
    # @pet = Pet.find_by(id: 1)
    @pet.update(params[:pet])

    if !params["owner"]["name"].empty?
      @pet.owner = Owner.create(params["owner"])
    end

    @pet.save

    # @owner = Owner.all.find_by_id(params[owner][id])
    #
    # @owner.pet_id << @pet.id

    redirect to "/pets/#{@pet.id}"
  end
end
