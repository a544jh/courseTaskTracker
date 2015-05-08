class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:destroy]


  # POST /attendances
  # POST /attendances.json
  def create
    @attendance = Attendance.new(attendance_params)
	@attendance.user_id = current_user.id
    respond_to do |format|
      if @attendance.save
        format.html { redirect_to @attendance.course, notice: 'Attendance was successfully created.' }
        format.json { render :show, status: :created, location: @attendance }
      else
        format.html { render :new }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /attendances/1
  # DELETE /attendances/1.json
  def destroy
    @attendance.destroy
    respond_to do |format|
      format.html { redirect_to @attendance.course, notice: 'Attendance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendance_params
      params.require(:attendance).permit(:user_id, :course_id)
    end
end
