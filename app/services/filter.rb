class Filter
  def filter(filters)
    @active_records = nil
    filters = [filters] unless filters.instance_of? Array
    filters.each do |filter|
      # fc = filter content
      @fc = filter['content']
      filter_type = filter['type']
      validate_filter_type(filter_type)
      if @active_records
        @active_records = @active_records.merge(self.send(filter_type))
      else
        @active_records = self.send(filter_type)
      end
    end
    @active_records
  end

  def validate_filter_type(filter_type)
    unless self.class.private_method_defined? filter_type
      raise Exceptions::UnknownFilterType.new(filter_type)
    end
  end
end
