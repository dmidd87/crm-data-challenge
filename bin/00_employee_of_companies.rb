require 'pp'
load '../data/crm.rb'

result = []

CRM[:companies].each do |company|
   result << { name: company[:name], employees: [] }
   CRM[:people].each do |person|
     person[:employments].each do |employment|   
       if employment[:company_id] == company[:id]
        result.last[:employees] << {
          id: person[:id],
          first_name: person[:first_name],
          last_name: person[:last_name],
          title: employment[:title]
          }
        end
     end
   end
end

pp result
