module TransactionsHelper
  def converting_to_post_number(post_number)
    "〒#{post_number}".insert(4, '-')
  end
end
