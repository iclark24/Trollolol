class ListsController < ApplicationController
  before_action :set_board, only: [:new, :create]
  before_action :set_list, only: [:edit, :update, :destroy]

  def new
    @lists = @board.lists.new
  end

  def create
    @board.lists.create_list(list_params, @board.id)
    redirect_to @board
  end

  def edit
  end

  def update
    @list.update_list(@list.id, list_params)
    redirect_to @list
  end

  def destroy
    List.delete_list(@list)
    redirect_to board_path(@list.board_id)
  end

  private
    def set_list
      @list = List.single_list(params[:id])
    end

    def set_board
      @board = Board.single_board(params[:board_id])
    end

    def list_params
      params.require(:list).permit(:l_name, :l_priority)
    end


end
