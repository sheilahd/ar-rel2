require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
set :database, { adapter: "sqlite3", database: "mydb.db" }
require './models/student'
require './models/student_class'
require './models/college_class'

get '/' do
    Student.all.to_yaml + CollegeClass.all.to_yaml + StudentClass.all.to_yaml 
end    

get '/students' do
    @students = Student.all
    erb :students
end

get '/student/:id' do
    @student = Student.find(params[:id])
    if @student.nil?
        "Student not found"
    end
    erb :student
end

get '/collegec' do
    @collclass = CollegeClass.all
    erb :collegec
end

get '/collclass/:id' do
    @collclass = CollegeClass.find(params[:id])
    if @collclass.nil?
        "Class not found"
    end
    erb :collclass
end