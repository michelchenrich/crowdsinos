if Rails.env.development?
  %w[user contractor designer].each do |c|
    require_dependency File.join("app","models","#{c}.rb")
  end
end
