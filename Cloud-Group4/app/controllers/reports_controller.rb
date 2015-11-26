class ReportsController < ApplicationController
	def index
    @reports =current_user.is_admin? ? Report.all : current_user.reports
    respond_to do |format|
      format.html
      format.xls
    end
  end
  def show
    @report = current_user.reports.find(params[:id])
  end
  def new
    @report = Report.new
    # @report = @report.build
  end
  
  def create
    @report = Report.new(report_params)
    @report.user_id = current_user.id
    if @report.save
      redirect_to reports_path
    else 
      render action: "new"
    end
  end
  def edit
    @report = current_user.reports.find(params[:id])  
  end
  
  def update
    @report = current_user.reports.find(params[:id])
    if @report.update_attributes(report_params)
      redirect_to report_path(@report)
    else 
      render action: "edit"
    end
  end
  
  def destroy
    @report = current_user.reports.find(params[:id])
    @report.destroy
    redirect_to reports_path
  end
  private
  def report_params
    params[:report].permit(:name, :bug_count, :test_result)
  end
end
