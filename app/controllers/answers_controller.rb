class AnswersController < ApplicationController

  def create
    @answer = Answer.new(section_params)
    puts params
    respond_to do |format|
      if @answer.save
        format.html { redirect_to @section, notice: 'Section was successfully created.' }
        format.json { render :show, status: :created, location: @section }
      else
        format.html { render :new }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

private
# Use callbacks to share common setup or constraints between actions.
  def set_section
    @section = Section.find(params[:id])
  end

  def set_case
    @case = Case.find(params[:case_id])
  end

  def serialize_data
  end
end
