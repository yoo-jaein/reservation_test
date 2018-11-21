class BookingController < ApplicationController

  def index
    
  end
  
  def show
  end

  def create
    post = Post.new
        post.classroom = params[:classroom]
        post.time = params[:time]
        post.save
        
        redirect_to '/index'
  end
  
  def modify
        @post = Post.find(params[:post_id])
  end

  def new
    
  end

  def delete
    Post.destroy(params[:post_id])
        
        redirect_to '/new'
  end

  def update
    post = Post.find(params[:post_id])
        post.classroom =  params[:classroom]
        post.time =  params[:time]
        post.save
        
        redirect_to '/new'
  end

  def show
    @posts = Post.all
  end

  def list
  end

  def accept
  end

  def reject
  end

  def schedule_create
  end

  def schedule_new
  end

  def schedule_destroy
  end

  def schedule_update
  end

  def schedule_index
  end

  def black_index
  end

  def black_create
  end

  def black_new
  end

  def black_destroy
  end
end
