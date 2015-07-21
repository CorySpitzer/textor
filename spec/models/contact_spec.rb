require 'rails_helper'

describe Contact do
  it { should validate_presence_of :name}
  it { should validate_presence_of :cell_number}
  it { should have_and_belong_to_many :messages}

end
