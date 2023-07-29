class ReactionsController < ApplicationController
	before_action :authenticate_user!
def user_reaction
		@user = current_user
		@publication = Publication.find(params[:publication_id])
		reaction = Reaction.find_by(user_id: @user.id, publication_id: @publication.id)
		if reaction
			return flash.now[:alert] = 'Ya haz reaccionado a esta publicación'
		else
				@new_reaction = Reaction.new(user_id: @user.id, publication_id: @publication.id)
				respond_to do |format|
						if @new_reaction.save!
								format.html { redirect_to publication_path(@publication), notice: "Haz reaccionado con un #{@new_reaction.kind}"}
						else
								format.html { redirect_to publication_path(@publication), status: :unprocessable_entity }
						end
				end
		end
end
end
