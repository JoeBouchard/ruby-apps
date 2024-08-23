class EntriesController < ApplicationController
  before_action :require_authentication

  def index
    @entries = @current_user.entries
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def new
    @entry = Entry.new
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.user = @current_user

    if @entry.save
      redirect_to entries_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @entry = Entry.find(params[:id])

    if @entry.update(entry_params)
      redirect_to entries_path, flash: { notice: "Updated entry \"#{@entry.message}\"" }
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @entry = Entry.find(params[:id])
    flash[:notice] = "Deleted entry \"#{@entry.message}\""
    @entry.destroy

    redirect_to entries_path, status: :see_other
  end

  private
  def entry_params
    params.require(:entry).permit(:message, :due, :priority)
  end
end
