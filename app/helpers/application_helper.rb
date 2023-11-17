module ApplicationHelper
  def stars_rating(value)
    value = value / 2.0
    full_stars = value.floor
    half_stars = 0
    remainder = ((value - full_stars)*2).round()
    if remainder == 2
      full_stars += 1
    elsif remainder == 1
      half_stars = 1
    end
    return {full_stars: full_stars, half_stars: half_stars}
  end
end
