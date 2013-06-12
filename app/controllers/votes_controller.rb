class VotesController < ApplicationController
  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy
    render :json => @vote
  end
end
