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

  def security
    @cases = Case.security
    render :index, locals: {section: 99}
  end
end
