require 'spec_helper'

describe(Division) do
  describe('#employees') do
    it("shows which employees are assigned to the division") do
      division = Division.create({:title => 'Web Development'})
      employee = Employee.create({:name => 'dw', :division_id => division.id})
      employee2 = Employee.create({:name => 'dw', :division_id => division.id})
      expect(division.employees).to(eq([employee, employee2]))
    end
  end
end
