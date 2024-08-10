class PollsController < ApplicationController
  def index
    @polls = Poll.all
  end

  def new
    @poll = Poll.new
  end

  def create
    sparams = poll_params
    sparams[:options] = sparams[:options].split("\n")
    @poll = Poll.new(sparams)
    if @poll.save
      redirect_to edit_poll_url @poll
    else
      render :new
    end
  end

  def edit
    @poll = Poll.find(params[:id])
  end

  def update
    @poll = Poll.find(params[:id])
    sparams = poll_params
    sparams[:options] = sparams[:options].split("\n")
    if @poll.update(sparams)
      redirect_to edit_poll_url @poll
    else
      render :edit
    end
  end

  def destroy
    @poll = Poll.find(params[:id])
    @poll.destroy
    redirect_to polls_url
  end

  private
  def poll_params
    params.require(:poll).permit(:name, :options, :open)
  end
end
