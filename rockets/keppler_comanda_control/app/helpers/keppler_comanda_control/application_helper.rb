module KepplerComandaControl
  module ApplicationHelper
    def all_tables
      KepplerComandaControl::Table.all
    end

    def find_table(hash)
      KepplerComandaControl::Table.where(hash).first
    end

    def all_waiters
      KepplerComandaControl::Employee.all
    end

    def new_order(hash={})
      KepplerComandaControl::Order.new(hash)
    end
  end
end
