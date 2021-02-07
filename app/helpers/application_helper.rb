module ApplicationHelper
  def body_class
    qualified_controller_name = controller.controller_path.tr('/', '-').tr('_', '-')
    "#{qualified_controller_name}-#{controller.action_name}"
  end

  # エラーメッセージ表示
  def error_messages(*objects)
    messages = objects.compact.map { |o| o.errors.full_messages }.flatten

    unless messages.empty?
      tag.div(class: "alert alert-#{message_level :error}") do
        list_items = messages.map { |m| tag.li(m) }
        tag.ul(list_items.join.html_safe, class: 'list-unstyled') # rubocop:disable Rails/OutputSafety
      end
    end
  end

  def message_level(level)
    message_class = {
      notice: :success,
      alert: :warning,
      error: :danger
    }

    message_class[level.to_sym]
  end
end
