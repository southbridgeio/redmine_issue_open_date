class IssueOpenDateHookListener < Redmine::Hook::ViewListener
  render_on :view_issues_form_details_bottom, partial: 'issues/open_date_field'
  render_on :view_issues_bulk_edit_details_bottom, partial: 'issues/open_date_field_bulk'
  render_on :view_issues_show_details_bottom, partial: 'issues/open_date'
  render_on :view_my_account, partial: 'my/open_date'
end
