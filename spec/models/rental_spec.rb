require 'rails_helper'

describe Rental do
    describe '.end_date_must_be_greater_than_start_date' do
        xit 'success' do
            car_category = CarCategory.create(name: 'A', daily_rate: '50', car_insurance: '20', third_party_insurance: '10') 
            client = Client.create(name: 'Marcos', document: '284.042.408-84', email: 'roberson@milguel.com')
            rental = Rental.new(start_date: '2019-12-23', end_date: '2019-12-31', client: client, car_category: car_category)

            rental.valid?
        
            expect(rental.errors).to be_empty
        end

        xit 'end date less than start date' do
            car_category = CarCategory.create(name: 'A', daily_rate: '50', car_insurance: '20', third_party_insurance: '10') 
            client = Client.create(name: 'Marcos', document: '284.042.408-84', email: 'roberson@milguel.com')
            rental = Rental.new(start_date: '2019-12-23', end_date: '2019-12-19', client: client, car_category: car_category)

            rental.valid?
            
            expect(rental.errors.full_messages).to include('deve ser maior que data inicial')
        end

        xit 'end date equal than start date' do
        end

        xit 'end date must exist' do
        end


    end
 
end
