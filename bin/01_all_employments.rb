require 'pp'
load '../data/crm.rb'

result = []

CRM[:companies].each do |company|
  CRM[:people].each do |person|
    person[:employments].each do |employment|
      result << {
        :company_id => employment[:company_id] ,
        :company_name => company[:name] ,
        :person_id => person[:id] ,
        :person_first_name => person[:first_name] ,
        :person_last_name => person[:last_name] ,
        :title => person[:title]
      }
    end
  end
end

pp result
