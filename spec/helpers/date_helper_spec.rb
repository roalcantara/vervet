require 'rails_helper'

RSpec.describe DateHelper do
  describe '#current_year' do
    it 'renders the current year' do
      expect(helper.current_year).to eq Date.today.year
    end
  end
end
