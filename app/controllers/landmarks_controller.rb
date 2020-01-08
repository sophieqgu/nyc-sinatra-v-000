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
    
    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end 
   
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end 
    
    @figure.save
    
    redirect to :"figures/#{@figure.id}"
  end 
  
  get '/figures/:id/edit' do 
    @landmark = Landmark.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/edit'
  end 
  
  patch '/figures/:id' do 
    @landmark = Landmark.find(params[:id])
    @figure.update(params[:figure])
    
    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end 
    
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end 
    
    @figure.save
    redirect to :"figures/#{@figure.id}"
  end 
end
