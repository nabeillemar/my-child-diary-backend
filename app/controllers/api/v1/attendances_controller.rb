class Api::V1::AttendancesController < ApplicationController


  def index 
      attendances = Attendance.all 
      render json: AttendanceSerializer.new(attendances) 
  end

  def create 
     attendances = Attendance.new(attendances_params)
     if attendances.save
       render json: AttendanceSerializer.new(attendances), status: :accepted
       
     else
      render json: {errors: attendances.errors.full_messages} 
     end 
  end 


  def show
      attendances = Attendance.find_by(id: params[:id])
      render json: AttendanceSerializer.new(attendances)
  end

  def update 
      attendances = Attendance.find_by(id: params[:id])
      if attendances.update(attendances_params)
        render json: AttendanceSerializer.new(attendances), status: :accepted
      else
          render json: {errors: attendances.errors.full_messages}
      end 
  end 

  def destroy
      attendances = Attendance.find_by(id: params[:id])
      if attendances.destroy
        render json: { id: attendances.id }
      end
  end
  


private



  def attendances_params 
      params.require(:attendance).permit(:date, :check_in, :check_out, :lunch, :snack, :bathroom, :day_summary, :child_id)
  end 


end
