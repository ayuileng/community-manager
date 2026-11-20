class VisitSchedulesController < ApplicationController
  def index
    @visit_schedules = VisitSchedule.all
  end

  def new
    @visit_schedule = VisitSchedule.new
  end

  def create
    @visit_schedule = VisitSchedule.new(visit_schedule_params)
    if @visit_schedule.save
      redirect_to visit_schedules_path, notice: '走访规则已创建.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @visit_schedule = VisitSchedule.find(params[:id])
  end

  def update
    @visit_schedule = VisitSchedule.find(params[:id])
    if @visit_schedule.update(visit_schedule_params)
      redirect_to visit_schedules_path, notice: '走访规则已更新.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def visit_schedule_params
  params.require(:visit_schedule).permit(:name, :period_unit, :times_per_period,
                                         :remind_days_before, :description, :active)
  end
end
