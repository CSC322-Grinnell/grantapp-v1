class ProgramsController < ApplicationController
  def new
    @program = Program.new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
    @programs = Program.all
  end

  def show
  end
end
