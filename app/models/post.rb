class Post < ApplicationRecord
    
    belongs_to :user
    # User는 다수의 Post를 가질 수 있다.
    
    def start_time
        self.date ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
    end
end
