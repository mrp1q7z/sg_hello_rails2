class EntriesController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :new, :create]
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @entry = @blog.entries.build
  end

  def create
    @entry = @blog.entries.build(entry_params)
    if @entry.save
      redirect_to blog_path(@blog), notice: 'Entry was successfully created.'
    else
      render :new
    end
  end

  def edit
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
    redirect_to @blog, notice: 'Entry was successfully destroyed.'
  end

  private
    def set_blog
      @blog = Blog.find(params[:blog_id])
    end

    def set_entry
      begin
        @entry = @blog.entries.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render plain: "404 Not Found", status: 404
      end
    end

    def entry_params
      params.require(:entry).permit(:title, :body)
    end
end
