class Units::GenerateService
    def initialize(building)
        @building = building
    end

    def call
        raise ArgumentError, "每层单元数须在 1..99" unless (1..99).cover?(@building.units_per_floor)

        rows = []
        (1..@building.total_floor).each do |floor|
        next if @building.excluded_floor.include?(floor)   # 跳过排除层
        (1..@building.units_per_floor).each do |index|
            rows << {
            building_id: @building.id,
            unit_no: "#{@building.building_no}-#{floor * 100 + index}",
            floor: floor,
            unit_index: index,
            active: true,
            created_at: Time.current, updated_at: Time.current
            }
        end
        end

        ActiveRecord::Base.transaction do
        Unit.insert_all!(rows)
        end
    end
end