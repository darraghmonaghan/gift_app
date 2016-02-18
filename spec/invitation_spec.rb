
require 'rails_helper'

RSpec.describe Invite do
  describe 'instructions' do
    let(:invite) { mock_model Invite, group_id: 100, email: 'test_email@gmail.com' }
    let(:mail) { Invite.instructions(invite) }

    it 'renders the subject' do
      expect(mail.subject).to eql('Welcome, you have an event invite!')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eql([invite.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eql(['noreply@ourgift.com'])
    end


  end
end
