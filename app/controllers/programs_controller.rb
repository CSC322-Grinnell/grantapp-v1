class ProgramsController < ApplicationController
  def new
    @program = Program.new
  end

  def create
    @program = Program.new(program_params)
    
    if @program.save
      redirect_to @program, :notice => 'Successfully created a new program!'
    else
      flash[:notice] = 'Failed to create a new program.'
    end
  end

  def update
    @program = Program.find(params[:id])

    if @program.update_attributes(program_params)
      redirect_to @program, :notice => 'Successfully updated a new program!'
    else
      flash[:notice] = 'Failed to update a new program.'
    end
  end

  def edit
    @program = Program.find(params[:id])
  end

  def destroy
    @program = Program.find(params[:id])
    @program.destroy
  end

  def index
    @programs = Program.all
  end

  def show
    @program = Program.find(params[:id])
  end

  private 
  def program_params
    params.require(:program).permit(:name)
  end
end
