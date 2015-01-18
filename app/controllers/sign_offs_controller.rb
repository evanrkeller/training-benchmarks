class SignOffsController < ApplicationController

  respond_to :html

  def create
    @sign_off = SignOff.new(sign_off_params)
    @sign_off.save
    redirect_to @sign_off.user, notice: 'Benchmark was signed off.'
  end

  private

  def sign_off_params
    params.require(:sign_off).permit(:bmark_id, :user_id)
  end

end
