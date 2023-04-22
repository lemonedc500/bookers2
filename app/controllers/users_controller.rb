class UsersController < ApplicationController
 
 def show
  @new_book=Book.new
  @user=User.find(params[:id])
  @book=@user.books
 end
  
 def index
  @users=User.all
  @book=Book.new
  @user=current_user
 end
 
 def update
  @user=User.find(params[:id])
  if @user.update(user_params)
   flash[:notice] = "You have updated user successfully."
   redirect_to user_path(@user.id)
  else
   render :edit
  end
 end
 
 def edit
  user=User.find(params[:id])
  unless user.id == current_user.id
   redirect_to user_path(current_user.id)
  end
   @user = User.find(params[:id])
 end

 private
  
 def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
 end

 def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to books_path
    end
 end
end

