class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(lists_params)
    @list.save
    redirect_to list_path(@list)

  end

  def edit
    @list = List.find(params[:id])
  end

  def update
      @list = List.find(params[:id])
    if @list.update(lists_params)
      redirect_to lists_path, notice: "List updated successfully"
    else
      render :edit
    end
  end

  private

  def lists_params
    params.require(:list).permit(:name)
  end
end
