class DailyScheduleMailer < ApplicationMailer

  sendgrid_enable :subscriptiontrack
  sendgrid_category :daily_schedule
  sendgrid_subscriptiontrack_text replace: '[unsub]'

  def notify_of_monday_daily_schedule(registration)
    sendgrid_asm_group_id 3437
    @day = 0
    @registration = registration
    @sessions = @registration.
                submissions.
                for_schedule.
                where(start_day: @day + 2).
                order('start_hour ASC')
    mail to: @registration.user.email,
         subject: "Your Denver Startup Week Daily Schedule for #{formatted_day_for_subject(@day + 2)}"
  end

  def notify_of_tuesday_daily_schedule(registration)
    sendgrid_asm_group_id 3437
    @day = 1
    @registration = registration
    @sessions = @registration.
                submissions.
                for_schedule.
                where(start_day: @day + 2).
                order('start_hour ASC')
    mail to: @registration.user.email,
         subject: "Your Denver Startup Week Daily Schedule for #{formatted_day_for_subject(@day + 2)}"
  end

  def notify_of_wednesday_daily_schedule(registration)
    sendgrid_asm_group_id 3437
    @day = 2
    @registration = registration
    @sessions = @registration.
                submissions.
                for_schedule.
                where(start_day: @day + 2).
                order('start_hour ASC')
    mail to: @registration.user.email,
         subject: "Your Denver Startup Week Daily Schedule for #{formatted_day_for_subject(@day + 2)}"
  end

  def notify_of_thursday_daily_schedule(registration)
    sendgrid_asm_group_id 3437
    @day = 3
    @registration = registration
    @sessions = @registration.
                submissions.
                for_schedule.
                where(start_day: @day + 2).
                order('start_hour ASC')
    mail to: @registration.user.email,
         subject: "Your Denver Startup Week Daily Schedule for #{formatted_day_for_subject(@day + 2)}"
  end

  def notify_of_friday_daily_schedule(registration)
    sendgrid_asm_group_id 3437
    @day = 4
    @registration = registration
    @sessions = @registration.
                submissions.
                for_schedule.
                where(start_day: @day + 2).
                order('start_hour ASC')
    mail to: @registration.user.email,
         subject: "Your Denver Startup Week Daily Schedule for #{formatted_day_for_subject(@day + 2)}"
  end

  private

  def formatted_day_for_subject(day)
    formatted_start_date_for_index(day, '%A %-m/%-d')
  end
end
