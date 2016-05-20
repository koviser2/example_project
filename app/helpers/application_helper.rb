module ApplicationHelper
  def lang_switcher
    content_tag(:div, class: :langs) do
      I18n.available_locales.each_with_index do |loc, index|
        locale_param = request.path == root_path ? root_path(locale: loc) : params.merge(locale: loc)
        concat "\n".html_safe + link_to(t(loc, scope: :lng), locale_param, class: (I18n.locale == loc ? "active #{loc.to_s}" : loc.to_s), data: {loc: loc})
      end
    end
  end

  def work_page
    @work_page ||=1
  end

  def casting_page
    @casting_page ||=1
  end

  def casting_type
    @casting_type ||=1
  end

  def location_page
    @location_page ||=1
  end

  def video_link(skin)
    show_work_path(locale, params[:id], {page: params[:page], video: skin.try(:id)})
  end

  def active?(str)
    path = request.path
    path.slice!("/"+I18n.locale.to_s)
    return :active if path == str.to_s
    path.slice! "/"
    return :active if !str.blank? and path.slice str.to_s
    ""
  end
end
