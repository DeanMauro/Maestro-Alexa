require 'sinatra'
require 'ralyxa'
require_relative 'ruby/orchestrator'

# Replace with background job or cron job every hour to refresh token
@@orch = Orchestrator.new("dean", "admin", "123qwe123")


post '/' do
	Ralyxa::Skill.handle(request)
end