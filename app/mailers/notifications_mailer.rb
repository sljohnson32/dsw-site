class NotificationsMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.new_submission.subject
  #
  def notify_of_new_submission(chair, submission)
    @chair = chair
    @submission = submission
    @track = @submission.track
    mail to: chair.email, subject: "A new DSW submission has been received for the #{@track.name} track"
  end

  def notify_of_submission_update(chair, submission)
    @chair = chair
    @submission = submission
    @track = @submission.track
    mail to: chair.email, subject: "#{@submission.submitter.name} has proposed an update needing your approval for the #{@track.name} track."
  end

  def confirm_new_submission(submission)
    @submission = submission
    mail to: @submission.contact_emails, subject: 'Thanks for submitting a session proposal for Denver Startup Week!'
  end

  def voting_open(submission)
    @submission = submission
    mail to: @submission.contact_emails, subject: 'Voting for Denver Startup Week Sessions Is Now Open!'
  end

  def notify_of_new_inquiry(inquiry)
    @inquiry = inquiry
    mail to: ENV['VOLUNTEER_SIGNUP_EMAIL_RECIPIENTS'].split(','),
         subject: 'Someone has inquired about DSW',
         reply_to: "#{@inquiry.contact_name} <#{@inquiry.contact_email}>"
  end

  def notify_of_new_sponsor_signup(sponsor_signup)
    @sponsor_signup = sponsor_signup
    mail to: ENV['SPONSOR_SIGNUP_EMAIL_RECIPIENTS'].split(','), subject: 'Someone is interested in sponsoring DSW'
  end

  def notify_of_submission_acceptance(submission)
    @submission = submission
    mail to: [ @submission.contact_emails,
               @submission.submitter.email ].flatten.uniq,
         subject: 'RESPONSE NEEDED: Your Denver Startup Week session has been accepted!',
         from: @submission.track.email_alias,
         reply_to: @submission.track.email_alias,
         cc: @submission.track.email_alias
  end

  def notify_of_submission_rejection(submission)
    @submission = submission
    mail to: [ @submission.contact_emails,
               @submission.submitter.email ].flatten.uniq,
         subject: 'Your session proposal for Denver Startup Week'
  end

  def notify_of_submission_waitlisting(submission)
    @submission = submission
    mail to: [ @submission.contact_emails,
               @submission.submitter.email ].flatten.uniq,
         subject: 'Your session proposal for Denver Startup Week',
         from: @submission.track.email_alias,
         reply_to: @submission.track.email_alias,
         cc: @submission.track.email_alias
  end

  def notify_of_submission_venue_match(submission)
    @submission = submission
    mail to: [ @submission.contact_emails,
               @submission.venue.contact_emails,
               @submission.submitter.email ].flatten.uniq,
         subject: 'Denver Startup Week session location intro',
         from: @submission.track.email_alias,
         reply_to: @submission.track.email_alias,
         cc: @submission.track.email_alias
  end

  def confirm_registration(registration)
    @registration = registration
    mail to: @registration.user.email,
      subject: "You are registered for Denver Startup Week #{Date.today.year}"
  end

  def send_attendee_message(message, users)
    @message = message
    sendgrid_recipients users.map(&:email)
    mail to: 'Denver Startup Week <info@denverstartupweek.org>',
         subject: "Regarding '#{message.submission.full_title}': #{message.subject}"
  end

  def session_thanks(submission)
    @submission = submission
    mail to: [ @submission.contact_emails,
               @submission.submitter.email ].flatten.uniq,
         subject: 'Thank you, DSW session organizers!'
  end

end
