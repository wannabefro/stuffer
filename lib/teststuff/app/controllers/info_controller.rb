class InfoController < ApplicationController

def new
  @info = Info.new
end

def create
  @info = Info.new(params[:info])
end




end