class Api::V1::ChildrenController < ApplicationController

  def index 
      children = Child.all 
      render json: ChildSerializer.new(children) 
  end

  def create 
     children = Child.new(children_params)
     if children.save
       render json: ChildSerializer.new(children), status: :accepted
       
     else
      render json: {errors: children.errors.full_messages} 
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


  def children_params 
      params.require(:child).permit(:child_name, :age, :allergies, :guardian_name, :home_address, :phone_number)
  end 

 
end
