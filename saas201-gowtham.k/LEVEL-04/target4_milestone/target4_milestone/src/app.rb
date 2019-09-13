require 'sinatra'
class TodoApp
def get_todos
	@@id ||=0
	@@todos ||={}
end
def add_todo(todo,date)
	@@id=@@id+1
	get_todos()[@@id]=[todo,date]
end
def get_todo(id)
	get_todos()[id]
end
def update_todo(id,title)
  get_todos()[id][0] =title
end
def delete_todo(id)
  get_todos().delete(id)
end
end
todonew=TodoApp.new
get "/todos" do
	@todos=todonew.get_todos()
	erb :todos
end
get "/todos/:id" do
	@id=params[:id].to_i
	@todo=todonew.get_todo(@id)
	erb :todo
end
put "/todos/:id" do
  @id = params[:id].to_i
  todonew.update_todo(@id,params[:title])
  redirect "/todos"
end
post "/todos" do
	todonew.add_todo(params[:title],params[:date])
	redirect "/todos"
end
delete "/todos/:id" do
  @id = params[:id].to_i
  todonew.delete_todo(@id)
  redirect "/todos"
end