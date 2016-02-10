class ExampleMailerPreview < ActionMailer::Preview
  def sample_mail_preview
    token = Digest::SHA1.hexdigest([5, Time.now, rand].join)
    InviteMailer.group_invite(User.first, token)
  end
end