class CasesController < ApplicationController
  def index
    @cases = Case.order(due_date: :desc)
  end

  def show
    @case = Case.find(params[:id])
  end

  def edit
  end

  def security
    @cases = Case.security
    render :index, locals: {section: 99}
  end
end
