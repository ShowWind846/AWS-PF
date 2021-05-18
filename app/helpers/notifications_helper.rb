module NotificationsHelper

  def unchecked_notifications
   @notifications = current_user.passive_notifications.where(checked: false)
  end

  def corp_unchecked_notifications
    @notifications = current_corp.passive_corp_notifications.where(checked: false)
  end

end
