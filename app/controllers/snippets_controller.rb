class SnippetsController < ApplicationController

  def index
    @snippets = Snippet.recent(10)
  end

  def show
    @snippet = Snippet.find(params[:id])
  end

  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = Snippet.new(snippet_params)

    respond_to do |format|
      if @snippet.save
        # @snippet.generate_slug
        format.html { redirect_to @snippet, notice: 'Snippet was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def view
    @snippet = Snippet.where("slug = ?", params[:slug]).first
    unless @snippet.present?
      redirect_to snippets_path, alert: 'Snippet not found. Please try again.'
    end
    render 'show'
  end

  private

  def snippet_params
    params.require(:snippet).permit(:body, :is_private)
  end

end