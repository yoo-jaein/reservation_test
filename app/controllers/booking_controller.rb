class BookingController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    
  end
  
  def show
    @post = Post.find(current_user.id)
    
    @notice = Notice.all
  end
  
  def notice
    require 'nokogiri'
    require 'open-uri'
    
    doc = Nokogiri::HTML(open("http://computer.knu.ac.kr/07_sub/01_sub.html"))
    
    cnt = 0
    
    doc.css("a").each do |x|
    
        cnt = cnt + 1
        
        if(23 < cnt && cnt < 58)
          @notice = Notice.new
          @notice.title = x.inner_text
          @notice.link = x["href"]
          @notice.save
        else
        end
    end
  end

  def create
    post = Post.new
        post.classroom = params[:classroom]
        post.time = params[:time]
        post.user_id = current_user.id
        post.save
        
        redirect_to '/show'
  end
  
  def modify
        @post = Post.find(params[:post_id])
  end

  def new
    
  end

  def delete
    Post.destroy(params[:post_id])
        
        redirect_to '/show'
  end

  def update
    post = Post.find(params[:post_id])
        post.classroom =  params[:classroom]
        post.time =  params[:time]
        post.user_id = current_user.id
        post.save
        
        redirect_to '/new'
  end

  def show
    @posts = Post.all
    @notices = Notice.all
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
