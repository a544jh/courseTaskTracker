class DashboardController < ApplicationController

  def update
      taskstates = params[:taskstate]
      taskstates.each do |id, state|
        sub = TaskSubmission.find_by(user_id:current_user.id, task_id:id)
        if sub
            sub.state = state
            sub.save
        else
          sub = TaskSubmission.create(user_id:current_user.id, task_id:id, state:state)
        end
      end
      redirect_to '/dashboard'
    end

    def show
      if current_user
        render '/dashboard/dashboard'
      else
        redirect_to new_session_path
      end
    end
end
