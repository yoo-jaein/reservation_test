class BookingController < ApplicationController
   # before_action :authenticate_user!, except: [:index]
  
  def index
    @notice = Notice.all
    
  end


  def create
    post = Post.new
        post.classroom = params[:classroom]
        post.starttime = params[:starttime]
        post.endtime = params[:endtime]
        post.user_id = current_user.id
        post.date = params[:date]
        post.content = params[:content]
        post.people = params[:people]
        post.status = 0
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
        post.starttime = params[:starttime]
        post.endtime = params[:endtime]
        post.user_id = current_user.id
        post.date = params[:date]
        post.content = params[:content]
        post.people = params[:people]
        post.save
        
        redirect_to '/new'
  end

  def show
    @posts = Post.where(:user_id => current_user.id)
  end

  def list
  end

  def accept
  end

  def reject
  end
  
  def admin_index
    @posts = Post.all.size
    @accept_post = Post.where(:status => 1).size
    @reject_post = Post.where(:status => 2).size
    @wait_post = Post.where(:status => 0).size
  end
  
  def admin_list
     @posts = Post.all
  end
  
  def accepted_list
    @posts = Post.all
  end

  def schedule_accept
     post = Post.find(params[:post_id])
        post.status = 1
        post.save
        
        redirect_to '/admin_list'
    
  end
  
  def schedule_reject
    post = Post.find(params[:post_id])
        post.status = 2
        post.save
        
        redirect_to '/admin_list'
  end
  
  def schedule_create
     post = Post.new
        post.classroom = params[:classroom]
        post.starttime = params[:starttime]
        post.endtime = params[:endtime]
        post.user_id = current_admin.id
        post.date = params[:date]
        post.content = params[:content]
        post.people = params[:people]
        post.status = 1
        post.save
        
        redirect_to '/admin_index'
  end

  def schedule_new
  end
  
  def report_create
    report = Report.new
      report.title = params[:title]
      report.content = params[:content]
      report.save
      
      redirect_to '/index'
  end
  
  def report_new
  
  end 
  
  def report_list
    @reports = Report.all
  end

  def schedule_update
  end

  def notice
    
  end
  
  
  def schedule_index
  end

  def black_index
    @users = User.all
  end

  def black_create
    users = User.find(params[:student_id])
      if(users.is_black == 0)
        users.is_black =1
      elsif(users.is_black==1)
        users.is_black=2
      end
        users.save
        
        redirect_to '/black_index'
  end

  def black_new
  end

  def black_destroy
    users = User.find(params[:student_id])
      if(users.is_black == 2)
        users.is_black =1
      elsif(users.is_black==1)
        users.is_black=0
      end
        users.save
        
        redirect_to '/black_index'
  end
end
