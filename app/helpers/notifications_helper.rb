module NotificationsHelper
  def notification_form(notification)
    visitor = notification.visitor
    visitor_comment = notification.comment_id
    # notification.actionがfollowかlikeかcommentか
    case notification.action
    when 'follow'
      tag.a(notification.visitor.name, href: user_path(visitor), style: 'font-weight: bold;') + 'があなたをフォローしました'
    when 'like'
      tag.a(notification.visitor.name, href: user_path(visitor), style: 'font-weight: bold;') + 'が' + tag.a('あなたの投稿', href: post_path(notification.post_id), style: 'font-weight: bold;') + 'にいいねしました'
    when 'comment'
      comment = Comment.find_by(id: visitor_comment)&.comment
      tag.a(visitor.name, href: user_path(visitor), style: 'font-weight: bold;') + 'が' + tag.a('あなたの投稿', href: post_path(notification.post_id), style: 'font-weight: bold;') + 'にコメントしました'
    end
  end
end
