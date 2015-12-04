class IssueOpenDateHookListener < Redmine::Hook::ViewListener
  render_on :view_issues_form_details_bottom, partial: 'issues/open_date_field'
  render_on :view_issues_show_details_bottom, partial: 'issues/open_date'
end
