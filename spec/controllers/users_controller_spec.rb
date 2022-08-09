# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:id) { User.last.id }

  describe 'before_action' do
    it { should use_before_action(:set_user) }
  end

  describe 'set_user' do
  end
end
