# frozen_string_literal: true

module KepplerComandaControl
  # Order Model
  class Order < ApplicationRecord
    include ActivityHistory
    include CloneRecord
    include Uploadable
    include Downloadable
    include Sortable
    include Searchable
    acts_as_list
    acts_as_paranoid

    def self.index_attributes
      %i[]
    end
  end
end
