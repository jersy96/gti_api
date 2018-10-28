class TutorFilter < Filter
  private
  def name
    Tutor.where("first_name || ' ' ||  first_lastname LIKE ?", likefy(@fc['value']))
  end

  def price
    prices = [@fc['price1'], @fc['price2']]
    p1 = prices.min
    p2 = prices.max
    Tutor.joins('JOIN tutor_profiles ON tutor_profiles.tutor_id = users.id').where('tutor_profiles.price BETWEEN ? AND ?', p1, p2)
  end

  def subject
    Tutor.joins(:subjects).where('subjects.name LIKE ?', likefy(@fc['value']))
  end

  def likefy(s)
    "%#{s.split('').join('%')}%"
  end
end
