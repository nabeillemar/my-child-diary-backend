class AttendanceSerializer
    include FastJsonapi::ObjectSerializer
    attributes :date, :check_in, :check_out, :lunch, :snack, :bathroom, :day_summary, :child_id, :child
  end
  