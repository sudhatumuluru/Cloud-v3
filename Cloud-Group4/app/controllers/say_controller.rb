class SayController < ApplicationController
  def hello
    @message = "Hello Sudheeshna"
    @names  = ["hari", "suri", "murari"]
  end
  
  def goodbye
    @message = "Goodbye Sudheeshna"
  end
  
  def app
    @clients = Client.all
    @projects = Project.order("datetime(start_date) DESC")
  end
  
  def list
    @clients = Client.all
  end
  
  
end
