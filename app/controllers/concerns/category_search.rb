module CategorySearch
  def category_search(id)
    @category = Category.find(id)
    @items = []
    @categories = []
    @categories << @category
    if @category.children.present?
      @category.children.each do |second_category|
        @categories << second_category
        case second_category.children.present?
          when second_category.children.each do |third_category|
            @categories << third_category
          end
        end
      end
    end
    @categories.each do |category|
      if category.items.present?
        @items << category.items
      end
    end
    @items = @items.flatten.sort_by{|i|i.created_at}.reverse
  end
end
