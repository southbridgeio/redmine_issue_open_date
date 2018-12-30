class IssueOpenDateHookListener < Redmine::Hook::ViewListener
  render_on :view_issues_form_details_bottom, partial: 'issues/open_date_field'
  render_on :view_issues_bulk_edit_details_bottom, partial: 'issues/open_date_field_bulk'
  render_on :view_issues_show_details_bottom, partial: 'issues/open_date'
  render_on :view_my_account, partial: 'my/open_date'

  def controller_issues_edit_before_save(context = {})
    assign_issue_attributes(context)
  end

  def controller_issues_bulk_edit_before_save(context = {})
    assign_issue_attributes(context)
  end

  def controller_issues_new_before_save(context = {})
    assign_issue_attributes(context)
  end

  private

  def assign_issue_attributes(context)
    params, issue = context[:params].to_unsafe_h, context[:issue]
    Time.use_zone(User.current.time_zone || Time.now.localtime.utc_offset / 3600) do
      issue.update(params[:issue].slice(*(1..5).map { |i| "open_date(#{i}i)" }))
    end
  end
end
