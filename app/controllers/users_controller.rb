class UsersController < ApplicationController
  def show
    @users=User.find(params[:id])
    debugger
  end
  def new
    @users=User.new
  end
end
