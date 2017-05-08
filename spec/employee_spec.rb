require 'spec_helper'

describe(Employee) do
  describe('#division') do
    it('shows you which division the employee belongs to') do
      division = Division.create({:title => 'Web Development'})
      employee = Employee.create({:name => 'dw', :division_id => division.id})
      expect(employee.division).to(eq(division))
    end
  end
end
