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
    
    params[:figure][:title_ids].each do |title|
      @figure.titles << Title.find({"id" => title})
    end 
    
    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end 
    
    params[:figure][:landmark_ids].each do |landmark|
      @figure.landmarks << Landmark.find({"id" => landmark})
    end 
    
    if !params[:landmark][:name].empty? && !params[:landmark][:year_completed].empty?
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
      @figure.titles << Title.find({"name" => title})
    end 
    
    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end 
    
    params[:figure][:landmark_ids].each do |landmark|
      @figure.landmarks << Landmark.find({"name" => landmark})
    end 
    
    if !params[:landmark][:name].empty? && !params[:landmark][:year_completed].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end 
    
    @figure.save
  end 
    
end
