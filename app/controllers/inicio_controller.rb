class InicioController < ApplicationController
  def index
    @programs = Program.all  
  end
end
