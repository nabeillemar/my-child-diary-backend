class ChildSerializer
    include FastJsonapi::ObjectSerializer
    attributes :child_name, :age, :allergies, :guardian_name, :home_address, :phone_number
  end
  