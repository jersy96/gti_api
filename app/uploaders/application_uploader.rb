class ApplicationUploader < CarrierWave::Uploader::Base
  after :remove, :clear_uploader

  protected
  def random_filename(model, camp)
    file_name = ''
    begin
      file_name = "#{SecureRandom.uuid.gsub(/-/, '')}#{Pathname.new(original_filename).extname}"
    end while (model.where(camp => file_name).any?)
    file_name
  end

  def clear_uploader
    if model.persisted?
      @file = @filename = @original_filename = @cache_id = @version = @storage = nil
      model.update_column(mounted_as, nil)
    end
  end
end
