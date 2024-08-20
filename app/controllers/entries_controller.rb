class EntriesController < ApplicationController
  before_action :require_authentication

  def index
    @entries = Entry.all
    print @current_user
  end

  def show
    @entry = Entry.find(params[:id])
  end
end
