class LandmarksController < ApplicationController
  # add controller methods
  get '/landmarks' do 
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end 
  
  get '/landmarks/new' do 
    @figures = Figure.all
    erb :'/landmarks/new'
  end 
  
  get '/landmarks/:id' do 
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end 
  
  post '/landmarks' do 
    @landmark = Landmark.find(params[:id])
    
    if !params[:figure][:name].empty?
      @landmark.figure = Figure.create(params[:figure])
    end 
   
    @landmark.save
    
    redirect to :"landmarks/#{@landmark.id}"
  end 
  
  get '/figures/:id/edit' do 
    @landmark = Landmark.find(params[:id])
    erb :'/figures/edit'
  end 
  
  patch '/figures/:id' do 
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])
    
    if !params[:figure][:name].empty?
      @landmark.figure = Figure.create(params[:figure])
    end 
    
    @landmark.save
    
    redirect to :"landmarks/#{@landmark.id}"
  end 
end
