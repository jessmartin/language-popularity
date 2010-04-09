class LanguagesController < ApplicationController

  def stack_overflow_questions
    respond_to do |format|
      format.js do 
        language = Language.find_by_id(params[:id])
        render :nothing => true && return unless language
        data = {:label => language.name, :data => language.stack_overflow_questions.map{ |s| [s.date.to_time.to_i * 1000, s.number_of_questions]}}
        render :json => data
      end
    end
  end
  
  def git_hub_ranks
    respond_to do |format|
      format.js do 
        language = Language.find_by_id(params[:id])
        render :nothing => true && return unless language
        data = {:label => language.name, :data => language.git_hub_ranks.map{ |s| [s.date.to_time.to_i * 1000, s.rank]}}
        render :json => data
      end
    end
  end
end