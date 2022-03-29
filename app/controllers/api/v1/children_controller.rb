class Api::V1::ChildrenController < ApplicationController

  def index #rendering all data of the childrens in the form of JSON 
      children = Child.all # we don't need to use instance varaibles anymore because of .....
      render json: ChildSerializer.new(children) #this adds the type, you have to add the attributes that you want to bring in #getting a data object that has an array, we have an attributes object that has an array, #we can restrict the data
  end

  def create #creating new childrens based on whatever children_params we get from our frontend
     children = Child.new(children_params)
     if children.save
       render json: ChildSerializer.new(children), status: :accepted
      #render json: children, status: :accepted # if the instances is saved then render the data json if it saved sucessfully, status allows us to communicate with the client side 
     else
      render json: {errors: children.errors.full_messages} #if the instance doesn't save we can send this to the front end to the client (user side) we can display the full messages , need to see what these status come from and what they mean
     end 
  end 


  def show
      children = Child.find_by(id: params[:id])
      render json: ChildSerializer.new(children)
  end

  def update 
      children = Child.find_by(id: params[:id])
      if children.update(children_params)
        render json: ChildSerializer.new(children), status: :accepted
      else
          render json: {errors: children.errors.full_messages}
      end 
  end 

  def destroy
      children = Child.find_by(id: params[:id])
      if children.destroy
        render json: { id: children.id }
      end
  end
  


private

  #def children_params # permit a parameter ... must be includes in the body of the POST or POST requests we will be making with JS fetch 
   #   params.require(:k_dramas).permit(:title, :release_year, :watched, :where_to_watch, :cover_photo, :my_rating, :comment, :category_id)
 # end 

  def children_params # permit a parameter ... must be includes in the body of the POST or POST requests we will be making with JS fetch 
      params.require(:child).permit(:child_name, :age, :allergies, :guardian_name, :home_address, :phone_number)
  end 

 
end
