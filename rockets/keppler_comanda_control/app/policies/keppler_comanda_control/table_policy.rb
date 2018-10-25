module KepplerComandaControl
  # Policy for Table model
  class TablePolicy < ControllerPolicy
    attr_reader :user, :objects

    def initialize(user, objects)
      @user = user
      @objects = objects
    end
  end
end