class InterestedUsersController < ApplicationController

  def create
    @interested_user = InterestedUser.new(interested_user_params)
    respond_to do |format|
      if @interested_user.save
        #TODO Make site work without javascript -> form will then redirect here and call this html action, we have to redirect it back to the main page
        #format.html { render json: @interested_user }
        #TODO Only render subfields of @interested_user (via jsbuilder?)
        format.json { render json: @interested_user }
      else
        #format.html { render json: @interested_user.errors }
        format.json { render json: @interested_user.errors, status: :unprocessable_entity }
      end
    end
  end

private
  def interested_user_params
    params.require(:interested_user).permit(:email)
  end
end
