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
    @case = Case.find(params[:id])
    set_answers
    @answers.serialized_answers = serialize_answers

    if @answers.save
      if params[:next_step].blank?
        redirect_to cases_path, notice: 'Completed'
      else
        redirect_to next_section
      end
    else
      render current_section
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

  def section_params
    answers = params.clone
    answers.except(:id, :action, :controller, :utf8, :_method, :authenticity_token, :next_step, :commit)
  end

  def serialize_answers
    section_params.to_json
  end

  def current_section
    params[:next_step].to_i - 1
  end

  def set_answers
    @answers = Answer.find_by(case_id: params[:id], section_id: current_section)
    if @answers.nil?
      @answers = Answer.new(case_id: params[:id], section_id: current_section)
    end
  end

  def next_section
    eval("section_#{params[:next_step]}_case_path")
  end

  def current_section
    if params[:next_step].blank?
      :section_6
    else
      "section_#{params[:next_step].to_i - 1}".to_sym
    end
  end
end
