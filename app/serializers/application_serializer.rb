class ApplicationSerializer < ActiveModel::Serializer
  def serialize_each(objs, serializer, options={})
    options = {each_options:{}}.merge(options)
    if options[:each_options].empty?
      ActiveModel::ArraySerializer.new(objs, each_serializer: serializer)
    else
      objs.map do |obj|
        serializer.new(obj, options[:each_options]).as_json[options[:key]]
      end 
    end 
  end
end
