class ProgramsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :not_applicant?, :except => [:index, :show]

  def new
    @program = Program.new
  end

  def create
    @program = Program.new(program_params)
    if @program.name == ""
      redirect_to new_program_path
      flash[:notice] = 'New program must have a name'
    else    
      if @program.save
        redirect_to @program, :notice => 'Successfully created a new program!'
      else
        flash[:notice] = 'Failed to create a new program.'
      end
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
    params.require(:program).permit(:name, :start_date, :end_date, :pending, :form_url, :info)
  end
  
  def not_applicant?
    if current_user.role != 'Applicant'
      true
    else
      redirect_to programs_path
    end
  end

end
