class CasesController < ApplicationController
  def index
    @cases = Case.order(due_date: :desc)
  end

  def show
  end

  def edit
  end
end
