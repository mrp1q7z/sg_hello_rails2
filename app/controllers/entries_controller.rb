class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  def show
    @blog = Blog.find(params[:blog_id])
    if @entry.nil?
      render plain: "404 Not Found", status: 404
      return
    end
  end

  def new
    @blog = Blog.find(params[:blog_id])
    @entry = @blog.entries.build
  end

  def create
    @blog = Blog.find(params[:blog_id])
    @entry = @blog.entries.build(entry_params)
    if @entry.save
      redirect_to blog_path(@blog), notice: 'Entry was successfully created.'
    else
      render :new
    end
  end

  def edit
    @blog = Blog.find(params[:blog_id])
  end

  def update
    if @entry.update(entry_params)
      redirect_to blog_entry_path(@entry.blog_id, @entry.id), notice: 'Entry was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @entry.destroy
    redirect_to entries_url, notice: 'Entry was successfully destroyed.'
  end

  private
    def set_entry
      @entry = Entry.find_by(id: params[:id], blog_id: params[:blog_id])
    end

    def entry_params
      params.require(:entry).permit(:title, :body)
    end
end
