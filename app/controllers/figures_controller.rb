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
  
  post '/figures/:id' do 
    @figure = Figure.create(params[:figure])
    
    params[:titles].each do |title|
      @figure.titles << Title.find_or_create_by({"name" => title})
    end 
    
    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title][:name])
    end 
    
    params[:landmarks].each do |landmark|
      @figure.landmarks << Landmark.find_or_create_by({"name" => landmark})
    end 
    
    if !params[]
    
    redirect to :"figures/#{@figure.id}"
  end 
  
  get '/figures/:id/edit' do 
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end 
  
  patch '/figures/:id' do 
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    
    
end
