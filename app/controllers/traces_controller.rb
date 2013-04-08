class TracesControllor < ApplicationController
  
  def index 
    @trace = Trace.new(params[:trace]) if params[:trace].present?
  end
  
end