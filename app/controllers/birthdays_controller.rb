class BirthdaysController < ApplicationController
  
  def index
    @birthdays = Birthday.all
  end

  def new

  end

  def create
    @birthday = Unirest.post("http://localhost:3000/birthdays",
                        headers:{ "Accept" => "application/json" }, 
                        parameters:{first_name: params[:first_name], last_name: params[:last_name], gift: params[:gift] }).body
    render :show
  end

  def show

    @birthday = Birthday.find(params[:id])
  end

  def edit

  end
  
  def update
    @birthday = Unirest.patch("http://localhost:3000/birthdays/#{params[:id]}",
                        headers:{ "Accept" => "application/json" }, 
                        parameters:{first_name: params[:first_name], last_name: params[:last_name], gift: params[:gift] }).body
    render :show
  end

  def destroy
    message = Unirest.delete("http://localhost:3000/birthdays/")

  end

end
