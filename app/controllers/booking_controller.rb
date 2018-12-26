class BookingController < ApplicationController
   # before_action :authenticate_user!, except: [:index]
  
  def index
    # B-IT의 메인 화면
    # 크롤링한 공지사항인 모델 Notice를 읽어온다.
    @notice = Notice.all
  end

  def create
    # 예약에 사용되는 모델 Post를 생성한다.
    # 만약 현재 유저가 블랙 리스트 경고 2회일 경우 인덱스로 돌려보낸다.
    if current_user.is_black == 2
      redirect_to '/index'
    else
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
  end
  
  def modify
    @post = Post.find(params[:post_id])
  end

  def new
    
  end

  def delete
    # 예약을 삭제한다.
    Post.destroy(params[:post_id])
        
        redirect_to '/show'
  end

  def update
    # 예약을 수정한다.
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
    # 현재 유저가 작성한 모델 Post를 모두 읽어온다.
    @posts = Post.where(:user_id => current_user.id)
  end

  def list
  end

  def accept
  end

  def reject
  end
  
  def admin_index
    # 관리자의 관리 화면
    # 모델 Post의 총 개수와 실시간 도넛 차트로 보여줄 상태별 Post의 개수를 읽어온다.
    @posts = Post.all.size
    @accept_post = Post.where(:status => 1).size
    @reject_post = Post.where(:status => 2).size
    @wait_post = Post.where(:status => 0).size
    
    @date = Post.all
  end
  
  def admin_list
    # 모든 Post를 읽어와서 보여준다.
    @posts = Post.all
    
    @users = []
    
    Post.all.each do |pp|
      unless pp.user_id.nil?
      va = User.find(pp.user_id)
      
      unless va.nil?
        @users.push(User.find_by_id(pp.user_id))
      
      end
      else
        @users.push(User.create(:id => 99999, :name => "admin"))
      end
    end

  end
  
  def accepted_list
    # 승인된 예약 Post들을 보여준다.
    @posts = Post.where(:status => 1)
  end

  def schedule_accept
    # Post의 예약을 승인한다.
    # Post의 status가 1인 경우 승인을 뜻한다.
     post = Post.find(params[:post_id])
        post.status = 1
        post.save
        
        redirect_to '/admin_list'
    
  end
  
  def schedule_reject
    # Post의 예약을 거절한다.
    # Post의 status가 2인 경우 거절을 뜻한다.
    post = Post.find(params[:post_id])
        post.status = 2
        post.save
        
        redirect_to '/admin_list'
  end
  
  def schedule_create
    # status가 1인 (바로 승인된) Post를 생성한다.
    # 관리자가 생성한 Post이다.
     post = Post.new
        post.classroom = params[:classroom]
        post.starttime = params[:starttime]
        post.endtime = params[:endtime]
        
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
    # 유저가 신고 및 건의를 하는 화면이다.
    # 신고 및 건의는 모델 Report에 저장된다.
    report = Report.new
      report.title = params[:title]
      report.content = params[:content]
      report.save
      
      redirect_to '/index'
  end
  
  def report_new
  
  end 
  
  def report_list
    # 관리자가 모델 Report를 모두 읽는다.
    @reports = Report.all
  end

  def schedule_update
  end

  def notice
    
  end
  
  
  def schedule_index
  end

  def black_index
    # 모든 유저들의 정보를 읽는다.
    @users = User.all
  end

  def black_create
    # 선택한 유저의 블랙 리스트 상태인 is_black을 변경한다.
    # is_black이 2인 경우 Post 작성이 불가능하다.
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
    # 선택한 유저의 블랙 리스트 상태인 is_black을 변경한다.
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
