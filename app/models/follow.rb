class Follow < ApplicationRecord

  before_create do
    throw(:abort) if you_need_to_halt
  end

	belongs_to :user, optional: true # deprecated => `required: true`
	belongs_to :business, optional: true # deprecated => `required: true`
end
