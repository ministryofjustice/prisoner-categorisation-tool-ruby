class CasesController < ApplicationController
  def index
    if current_user.is_security_department?
      @cases = Case.security
    elsif current_user.is_supervisor?
      @cases = Case.pending
    else
      @cases = Case.where.not(status: ['pending', 'referred', 'closed'])
    end
  end

  def closed
    @cases = Case.closed
  end

  (1..6).each do |n|
    define_method "section_#{n}" do
      @case = Case.find(params[:id])
    end
  end

  def edit
  end

  def update
    if params[:next_step].blank?
      redirect_to cases_path, notice: 'Completed'
    else
      redirect_to next_section
    end
  end

  def security
    if current_user.is_security_department?
      @case = Case.find(params[:case_id])
      render 'cases/security'
    else
      redirect_to :root
    end
  end

  private

  def next_section
    eval("section_#{params[:next_step]}_case_path")
  end
end
