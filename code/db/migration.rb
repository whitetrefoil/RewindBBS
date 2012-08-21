require "dm-migrations/migration_runner"

DataMapper.logger.debug( "Starting Migration" )

migration 1, :create_users_table do
  up do
    create_table :users do
      column :id, Integer, :serial => true
      column :password_digest, String
      column :email, String
      column :name, String
      column :title, String, :allow_nil => true
      column :bio, String, :allow_nil => true, :size => 250
      column :role_id, Integer, :allow_nil => true
      column :skin_id, Integer, :allow_nil => true

      # Timestamps
      column :created_at, DateTime
    end
  end
  down do
    drop_table :users
  end
end

migration 2, :create_cookies_table do
  up do
    create_table :cookies do
      column :user_id, Integer
      column :cookie_key, String, :size => 128
      column :updated_at, DateTime
    end
  end
  down do
    drop_table :cookies
  end
end

migration 3, :create_avatars_table do
  up do
    create_table :avatars do
      column :user_id, Integer
      column :filename, String
      column :width, Integer, :allow_nil => true
      column :height, Integer, :allow_nil => true
      column :updated_at, DateTime
    end
  end
  down do
    drop_table :avatars
  end
end

migration 4, :create_signs_table do
  up do
    create_table :signs do
      column :user_id, Integer
      column :content, "TEXT", :allow_nil => true
    end
  end
  down do
    drop_table :signs
  end
end

migration 5, :create_roles_table do
  up do
    create_table :roles do
      column :id, Integer, :serial => true
      column :name, String
    end
  end
  down do
    drop_table :roles
  end
end

migration 6, :create_posts_table do
  up do
    create_table :posts do
      column :id, Integer, :serial => true
      column :user_id, Integer
      column :subject, String
      column :content, "TEXT"
      column :is_draft, Integer
      column :created_at, DateTime
      column :updated_at, DateTime
    end
  end
  down do
    drop_table :posts
  end
end

migration 7, :create_comments_table do
  up do
    create_table :comments do
      column :id, Integer, :serial => true
      column :user_id, Integer
      column :post_id, Integer
      column :content, "TEXT"
      column :created_at, DateTime
      column :updated_at, DateTime
    end
  end
  down do
    drop_table :comments
  end
end

migration 8, :create_systags_table do
  up do
    create_table :systags do
      column :id, Integer, :serial => true
      column :name, String
      column :level, Integer
    end
  end
end

migration 9, :create_usertags_table do
  up do
    create_table :usertags do
      column :id, Integer, :serial => true
      column :name, String
    end
  end
  down do
    drop_table :usertags
  end
end

migration 10, :create_messages_table do
  up do
    create_table :messages do
      column :id, Integer, :serial => true
      column :to_id, Integer
      column :from_id, Integer, :allow_nil => true # If nil it means from System
      column :content, "TEXT"
      column :is_new, Integer
      column :created_at, DateTime
    end
  end
  down do
    drop_table :messages
  end
end

migration 11, :create_skins_table do
  up do
    create_table :skins do
      column :id, Integer, :serial => true
      column :path, String
    end
  end
  down do
    drop_table :skins
  end
end




migrate_down!
migrate_up!

DataMapper.logger.debug("Migration Finished!")
