class LandmarksController < ApplicationController
  # add controller methods
  get '/landmarks' do 
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end 
  
  get '/landmarks/new' do 
    erb :'/landmarks/new'
  end 
  
  get '/landmarks/:id' do 
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end 
  
  post '/landmarks' do 
    @landmark = Landmark.find(params[:id])
    
    if !params[:figure][:name].empty?
      @landmark.titles << Title.create(params[:title])
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
    @landmark.update(params[:figure])
    
    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end 
    
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end 
    
    @landmark.save
    redirect to :"landmarks/#{@landmark.id}"
  end 
end
