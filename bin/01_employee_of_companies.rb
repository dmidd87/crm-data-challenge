require 'pp'
load '../data/crm.rb'

def employee_of_companies(input)
  result = []
  input[:companies].each do | company |
    result << { name: company[:name], employees: [] }
    input[:people].each do | person |
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
  result
end

require 'rspec/autorun'

RSpec.describe '#employee_of_companies' do
  it 'return an array of companies, and the people who work for them' do
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
          name: "Nicolas and Sons",
          employees: [
            {
              :id => 32,
              :first_name => "Elyse",
              :last_name => "Jensen",
              :title => "Chief Communications Consultant"
            }
          ]
        }
      ]
    expect(employee_of_companies(input)).to eq(expected)
  end
end
