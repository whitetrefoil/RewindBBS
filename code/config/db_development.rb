# DataMapper.setup(:default, 'sqlite::memory:')
DataMapper.setup(:default, "sqlite:/#{Dir.pwd}/db/rewind_bbs_dev.sqlite")
# DataMapper::Model.raise_on_save_failure = true
DataMapper::Logger.new($stdout, :debug)
