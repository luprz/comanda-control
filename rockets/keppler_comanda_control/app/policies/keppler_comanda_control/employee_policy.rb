module KepplerComandaControl
  # Policy for Employee model
  class EmployeePolicy < ControllerPolicy
    attr_reader :user, :objects

    def initialize(user, objects)
      @user = user
      @objects = objects
    end
  end
end