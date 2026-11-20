class BuildingsController < ApplicationController
  def index
    @buildings =  Building.where(user: current_user).order(:building_no)
  end

  def new
    @building = Building.new
  end

  def show
    @building = Building.find(params[:id])
    @units = @building.units.order(:floor, :unit_index)
  end

  def create
    @building = Building.new(building_params)
    @building.user = current_user

    if @building.save
      Units::GenerateService.new(@building).call
      redirect_to @building, notice: '楼栋创建成功'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @building = Building.find(params[:id])
    if @building.destroy
      redirect_to buildings_path, notice: '楼栋删除成功'
    else
      redirect_to buildings_path, alert: '楼栋删除失败：' + @building.errors.full_messages.to_sentence
    end
  end

  private

  def building_params
  permitted = params.require(:building).permit(
    :building_no, :total_floor, :units_per_floor, :excluded_floor, :remark
  )
  permitted[:excluded_floor] = permitted[:excluded_floor].to_s
                                 .split(",").map(&:strip)
                                 .reject(&:blank?).map(&:to_i)
  permitted
end
end
