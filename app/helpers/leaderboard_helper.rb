module LeaderboardHelper
  def render_badge_icon(icon, color)
    case icon
    when "check"
      %(<svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="#{color}" stroke-width="2"><polyline points="20 6 9 17 4 12"/></svg>).html_safe
    when "users"
      %(<svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="#{color}" stroke-width="2"><path d="M17 21v-2a4 4 0 00-4-4H5a4 4 0 00-4 4v2"/><circle cx="9" cy="7" r="4"/></svg>).html_safe
    when "star"
      %(<svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="#{color}" stroke-width="2"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87L18.18 22 12 18.27 5.82 22 7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>).html_safe
    when "heart"
      %(<svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="#{color}" stroke-width="2"><path d="M20.84 4.61a5.5 5.5 0 00-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 00-7.78 7.78L12 21.23l8.84-8.84a5.5 5.5 0 000-7.78z"/></svg>).html_safe
    when "message"
      %(<svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="#{color}" stroke-width="2"><path d="M21 15a2 2 0 01-2 2H7l-4 4V5a2 2 0 012-2h14a2 2 0 012 2z"/></svg>).html_safe
    when "trophy"
      %(<svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="#{color}" stroke-width="2"><path d="M6 9H4.5a2.5 2.5 0 010-5H6"/><path d="M18 9h1.5a2.5 2.5 0 000-5H18"/><path d="M4 22h16"/><path d="M10 14.66V17c0 .55-.47.98-.97 1.21C7.85 18.75 7 20 7 22"/><path d="M14 14.66V17c0 .55.47.98.97 1.21C16.15 18.75 17 20 17 22"/><path d="M18 2H6v7a6 6 0 0012 0V2z"/></svg>).html_safe
    end
  end
end
