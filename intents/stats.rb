intent "Stats" do
	reply = "Sorry, I didn't understand that"
	entity = request.slot_value('entity')
	status = request.slot_value('status')
	type = 'get'
	extension = case entity
					when 'processes', 'assets', 'queues', 'schedules'
						'api/Stats/GetCountStats'
					when 'robots'
						'api/Stats/GetSessionsStats'
					when 'jobs'
						'api/Stats/GetJobsStats'
				end

	unless extension.nil?
		res = @@orch.request(type, extension)
		
		res["body"].each do |datum|
			if [status, entity].include? datum["title"].downcase
				reply = (datum["count"] == 1) ? "There is one #{status} #{entity[0..-2]}" :
												"There are #{datum[count]} #{status} #{entity}"
			end
		end
	end
	
	tell(reply)
end