class TodosController < ApplicationController

  protect_from_forgery :except => [:index, :create, :update, :destroy]

  def index
    todos = Todo.all.order(:created_at)
    render json: todos
  end

  def create
    tp = todo_params.tap do |v|
      v[:status] = 1
    end
    todo = Todo.new(tp)
    if todo.save
      render json: {status: "ok"}
    else
      render json: {status: "fail", errors: todo.errors.full_messages}
    end
  end

  def update
    todo = Todo.find(params[:id])
    if todo.update(todo_params)
      render json: {status: "ok"}
    else
      render json: {status: "fail", errors: todo.errors.full_messages}
    end
  end

  def destroy
    todo = Todo.find(params[:id])
    todo.delete
    render json: {status: "ok"}
  end

  private

  def todo_params
    params.require(:todo).permit(:status, :title, :explain)
  end
end
