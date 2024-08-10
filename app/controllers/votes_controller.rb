class VotesController < ApplicationController
  def new
    if cookies["poll-#{params[:id]}"] == 'voted'
      render :done
      return
    end
    @poll = Poll.find(params[:id])
    if @poll.open?
      @vote = Vote.new
      render :vote
    else
      render :closed
    end
  end

  def create
    @poll = Poll.find(params[:poll_id])
    @vote = @poll.votes.new(vote_params)
    if cookies["poll-#{@poll.id}"] == 'voted'
      render :done
      return
    end
    unless @poll.open?
      render :closed
      return
    end

    if @vote.save
      ResultsChannel.broadcast_to(@poll, @poll.results)
      cookies["poll-#{@poll.id}"] = 'voted'
      render :done
    else
      render :vote
    end
  end

  def results
    @poll = Poll.find(params[:id])
    @results = @poll.results
  end

  private
  def vote_params
    params.require(:vote).permit(:vote)
  end
end
