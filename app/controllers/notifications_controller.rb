class NotificationsController < ApplicationController
  before_action :require_permission

  def index
    if user_signed_in?
      @notifications = current_user.passive_notifications.page(params[:page]).per(10)
    else
      @notifications = current_corp.passive_corp_notifications.page(params[:page]).per(10)
    end
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end

  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy
    redirect_to notifications_path
  end

  def destroy_all
    @notifications = current_user.passive_notifications.destroy_all
    redirect_to notifications_path
  end

  private
  def require_permission
    unless user_signed_in? || corp_signed_in?
      redirect_to root_path, alert: "連絡機能のご利用にはログインが必要です。"
    end
  end
end
