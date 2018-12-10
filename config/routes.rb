Rails.application.routes.draw do
  
  devise_for :users
  devise_for :admins
  # 메인페이지
  root 'booking#index'
  
  
  get '/index' => 'booking#index'
  
  # 학생이 예약 신청
  post '/create' => 'booking#create'

  get '/new' => 'booking#new'

  # 학생이 예약 신청 삭제
   get '/delete/:post_id' => 'booking#delete'

  # 학생이 예약 신청 변경
  post '/update/:post_id' => 'booking#update'
  
  get '/modify/:post_id' => 'booking#modify'
  
  # 학생이 예약 신청 확인
  get '/show' => 'booking#show'
  
  #학생이 신고하기
  post'/report_create' => 'booking#report_create'
  
  get '/report_new' => 'booking#report_new'
  
  #학생이 현재 확정된 예약리스트 보기
  get '/accepted_list' => 'booking#accepted_list'

  # 관리자 메인 페이지
  get '/admin_index' => 'booking#admin_index'
  
  #관리자 확인 페이지 확인하기
  get 'schedule_index' => 'booking#schedule_index'

  # 관리자가 예약 요청 리스트 보기
  get '/admin_list' => 'booking#admin_list'

  # 관리자가 예약 수락
  get '/schedule_accept/:post_id' => 'booking#schedule_accept'
  # 관리자가 예약 거절
  get '/schedule_reject/:post_id' => 'booking#schedule_reject'

  # 관리자가 스케줄 추가
  post '/schedule_create' => 'booking#schedule_create'

  get '/schedule_new' => 'booking#schedule_new'

  # 관리자가 스케줄 삭제
  get '/schedule_destroy' => 'booking#schedule_destroy'

  # 관리자가 스케줄 변경
  get '/schedule_update' => 'booking#schedule_update'

  # 관리자 확정된 예약리스트 보기
  get 'booking/schedule_index' => 'booking#schedule_index'

  # 관리자 블랙리스트 홈
  get '/black_index' => 'booking#black_index'
  
  #관리자 블랙리스트 관리 창
  get '/black_manage' => 'booking#black_manage'

  # 관리자 블랙리스트 추가
  get '/black_create/:student_id' => 'booking#black_create'

  get '/black_new' => 'booking#black_new'

  # 관리자 블랙리스트 삭제
  get '/black_destroy/:student_id' => 'booking#black_destroy'

  #관리자 행사 등록
  get '/admin_add' => 'booking#admin_add'
  
  get '/notice' => 'booking#notice'
  
  #관리자 신고 기록 보기
  get '/report_list' => 'booking#report_list'
end
