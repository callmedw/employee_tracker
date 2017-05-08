require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
also_reload('lib/**/*.rb')
require './lib/division'
require './lib/employee'
require 'pry'
require 'pg'


get("/") do
  @divisions = Division.all()
  erb(:index)
end

post("/divisions") do
  title = params.fetch("title")
  division = Division.create({:title => title, :id => nil})
  erb(:success)
end

get("/divisions/:id") do
  @division = Division.find(params.fetch("id").to_i())
  erb(:division)
end

get("/divisions/:id/edit") do
  @division = Division.find(params.fetch("id").to_i())
  erb(:division_edit)
end

patch("/divisions/:id") do
  @title = params.fetch("title")
  @division = Division.find(params.fetch("id").to_i())
  @division.update({:title => title})
  erb(:division)
end

delete("/divisions/:id") do
  @division = Division.find(params.fetch("id").to_i())
  @division.delete()
  @divisions = Division.all()
  erb(:index)
end

post("/employees") do
  name = params.fetch("name")
  division_id = params.fetch('division_id').to_i
  @division = Division.find(division_id)
  @employee = Employee.create({:name => name, :division_id => division_id})
  erb(:success)
end


get('/employees/:id/edit') do
  @employee = Employee.find(params.fetch("id").to_i())
  erb(:employee_edit)
end

patch("/employees/:id") do
  name = params.fetch("name")
  @employee = Employee.find(params.fetch("id").to_i())
  @employee.update({:name => name})
  redirect ('/')
end
