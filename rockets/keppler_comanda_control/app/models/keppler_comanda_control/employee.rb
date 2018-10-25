# frozen_string_literal: true

module KepplerComandaControl
  # Employee Model
  class Employee < ApplicationRecord
    include ActivityHistory
    include CloneRecord
    include Uploadable
    include Downloadable
    include Sortable
    include Searchable
    mount_uploader :photo, AttachmentUploader
    acts_as_list
    acts_as_paranoid

    def self.index_attributes
      %i[photo firstname lastname phone email]
    end

    def fullname
      "#{firstname} #{lastname}"
    end
  end
end
