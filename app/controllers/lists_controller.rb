class ListsController < ApplicationController
  before_action :set_lists, only: [ :index ]
  before_action :set_list, only: [ :show ]

  def index
  end

  def new
    @list = List.new
  end

  def show

  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render action: "new"
    end
  end

  private

  def set_lists
    @lists = List.all
  end

  def set_list
    @list = List.find(params[:id])
  end



  def list_params
    params.require(:list).permit(:name)
  end
end
