class IssueOpenDateHookListener < Redmine::Hook::ViewListener
  render_on :view_issues_form_details_bottom, partial: 'issues/open_date_field'
  render_on :view_issues_show_details_bottom, partial: 'issues/open_date'

  def controller_issues_edit_before_save(context = {})
    return unless User.current.allowed_to?(:edit_issues, context[:issue].project)

    Time.use_zone(User.current.time_zone) do
      context[:issue].assign_attributes(context[:params][:issue].slice(*(1..5).map { |i| "open_date(#{i}i)" }))
    end
  end
end
