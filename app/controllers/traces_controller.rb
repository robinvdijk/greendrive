class TracesControllor < ApplicationController
  def index 
    @trace = Trace.new(params[:trace]) if params[:trace].present?
  end
  
  def show
    @trace = Trace.find(params[:licence_plate])
  end
end