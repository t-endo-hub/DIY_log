module NotificationsHelper
  def notification_form(notification)
    visitor = notification.visitor
    visitor_comment = notification.comment_id
    # notification.actionがfollowかlikeかcommentか
    case notification.action
    when 'follow'
      tag.a(notification.visitor.name, href: users_user_path(visitor), style: 'font-weight: bold;') + 'があなたをフォローしました'
    when 'like'
      tag.a(notification.visitor.name, href: users_user_path(visitor), style: 'font-weight: bold;') + 'が、あなたの投稿にいいねしました'
    when 'comment'
      comment = Comment.find_by(id: visitor_comment)&.comment
      tag.a(visitor.name, href: users_user_path(visitor), style: 'font-weight: bold;') + 'が、あなたの投稿にコメントしました'
    end
  end
end
