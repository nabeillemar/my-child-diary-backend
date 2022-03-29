class Api::V1::AttendancesController < ApplicationController


  def index #rendering all data of the attendancess in the form of JSON 
      attendances = Attendance.all # we don't need to use instance varaibles anymore because of .....
      render json: AttendanceSerializer.new(attendances) #this adds the type, you have to add the attributes that you want to bring in #getting a data object that has an array, we have an attributes object that has an array, #we can restrict the data
  end

  def create #creating new attendancess based on whatever attendances_params we get from our frontend
     attendances = Attendance.new(attendances_params)
     if attendances.save
       render json: AttendanceSerializer.new(attendances), status: :accepted
      #render json: attendances, status: :accepted # if the instances is saved then render the data json if it saved sucessfully, status allows us to communicate with the client side 
     else
      render json: {errors: attendances.errors.full_messages} #if the instance doesn't save we can send this to the front end to the client (user side) we can display the full messages , need to see what these status come from and what they mean
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

  #def attendances_params # permit a parameter ... must be includes in the body of the POST or POST requests we will be making with JS fetch 
   #   params.require(:k_dramas).permit(:title, :release_year, :watched, :where_to_watch, :cover_photo, :my_rating, :comment, :category_id)
 # end 

  def attendances_params # permit a parameter ... must be includes in the body of the POST or POST requests we will be making with JS fetch 
      params.require(:attendance).permit(:date, :check_in, :check_out, :lunch, :snack, :bathroom, :day_summary, :child_id)
  end 


end
