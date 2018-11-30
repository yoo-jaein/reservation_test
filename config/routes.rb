Rails.application.routes.draw do
  
  devise_for :admins
  devise_for :users
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

  # 관리자가 예약 신청 리스트 확인)
  get 'booking/list'

  # 관리자가 예약 승인
  get 'booking/accept'

  # 관리자가 예약 거절
  get 'booking/reject'

  # 관리자가 스케줄 추가
  get 'booking/schedule_create'

  get 'booking/schedule_new'

  # 관리자가 스케줄 삭제
  get 'booking/schedule_destroy'

  # 관리자가 스케줄 변경
  get 'booking/schedule_update'

  # 관리자 스케줄 홈
  get 'booking/schedule_index'

  # 관리자 블랙리스트 홈
  get 'booking/black_index'

  # 관리자 블랙리스트 추가
  get 'booking/black_create'

  get 'booking/black_new'

  # 관리자 블랙리스트 삭제
  get 'booking/black_destroy'

end
