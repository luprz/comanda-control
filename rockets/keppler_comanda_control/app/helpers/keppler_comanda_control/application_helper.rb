module KepplerComandaControl
  module ApplicationHelper
    def all_tables
      KepplerComandaControl::Table.all
    end

    def find_table(hash)
      KepplerComandaControl::Table.where(hash)
    end
  end
end
