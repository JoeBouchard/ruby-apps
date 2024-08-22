class EntriesController < ApplicationController
  before_action :require_authentication

  def index
    @entries = Entry.all
    print @current_user
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)

    if @entry.save
      redirect_to entries_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def entry_params
    params.require(:entry).permit(:message, :due, :priority)
  end
end
