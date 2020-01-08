class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do 
    @figures = Figure.all
    erb :'/figures/index'
  end 
  
  get '/figures/new' do 
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end 
  
  get '/figures/:id' do 
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end 
  
  post '/figures' do 
    @figure = Figure.create(params[:figure])
    
  
    
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
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/edit'
  end 
  
  patch '/figures/:id' do 
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    
    params[:figure][:title_ids].each do |title|
      @figure.titles << Title.find(title)
    end 
    
    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end 
    
    params[:figure][:landmark_ids].each do |landmark|
      @figure.landmarks << Landmark.find(landmark)
    end 
    
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end 
    
    @figure.save
    redirect to :"figures/#{@figure.id}"
  end 
    
end
