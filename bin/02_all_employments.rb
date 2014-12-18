require 'pp'
load '../data/crm.rb'

def all_employees(input)
  result = []
  input[:companies].each do |company|
    input[:people].each do |person|
      person[:employments].each do |employment|
        result << {
          :company_id => employment[:company_id] ,
          :company_name => company[:name] ,
          :person_id => person[:id] ,
          :person_first_name => person[:first_name] ,
          :person_last_name => person[:last_name] ,
          :title => employment[:title]
        }
      end
    end
  end
  result
end

require 'rspec/autorun'

RSpec.describe '#all_employees' do
  it 'returns an array of employments, including the person name,
  company name, person id, company id and title.' do
    input = {
      :people => [
        {
          :id => 32,
          :first_name => "Elyse",
          :last_name => "Jensen",
          :employments =>
          [
            {
              :company_id => 0,
              :title => "Chief Communications Consultant"
            }
          ]
        }
      ],
      :companies => [
        {
          :id => 0,
          :name => "Nicolas and Sons"
        }
      ]
    }

    expected =
      [
        {
          :company_id => 0,
          :company_name => "Nicolas and Sons",
          :person_id => 32,
          :person_first_name => "Elyse",
          :person_last_name => "Jensen",
          :title => "Chief Communications Consultant"
        }
      ]
    expect(all_employees(input)).to eq(expected)
  end
end
