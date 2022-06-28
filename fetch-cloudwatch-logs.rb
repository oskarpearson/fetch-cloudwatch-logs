#!/usr/bin/env ruby

require "aws-sdk-cloudwatchlogs"

log_group_name = ARGV[0]
log_stream_name = ARGV[1]

if log_group_name.nil? || log_stream_name.nil?
  puts "Need two arguments: log_group_name and log_stream_name"
  exit 1
end

client = Aws::CloudWatchLogs::Client.new

params = {
  log_group_name: log_group_name,
  log_stream_name: log_stream_name,
  start_from_head: true,
}

resp = client.get_log_events(params).each do |data|
  events = data.dig(:events) || []

  events.each do |event|
    puts "#{event[:timestamp]} #{event[:message].chomp}"
  end
end
