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

  # EDIT /cases/1/security
  def security
    if current_user.is_security_department?
      @case = Case.find(params[:case_id])
      render 'cases/security'
    else
      redirect_to :root
    end
  end
end
