class CasesController < ApplicationController
  def index
    @cases = Case.order(due_date: :desc)
  end

  def closed
    @cases = Case.order(due_date: :desc).closed
  end

  (1..6).each do |n|
    define_method "section_#{n}" do
      @case = Case.find(params[:id])
    end
  end

  def edit
  end

  # EDIT /cases/1/security
  def security
    @case = Case.find(params[:case_id])
    render 'cases/security'
  end
end
