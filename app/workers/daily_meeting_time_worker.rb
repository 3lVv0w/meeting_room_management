class DailyMeetingTimeWorker
  include Sidekiq::Worker
  sidekiq_options :retry => false

  def perform(*args)
    MeetingRoom.all.each do |me|
      me.preset(me.id)
    end
  end
end

job = Sidekiq::Cron::Job.new(name: 'Meeting Room reservation time setup - run weekdays at 8am in the morning', cron: '0 8 * * 1-5', class: 'DailyMeetingTimeWorker')
unless job.save
  puts job.errors
end

