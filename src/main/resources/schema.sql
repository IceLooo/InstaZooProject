-- Таблица пользователей (User)
CREATE TABLE users (
                       id SERIAL PRIMARY KEY,
                       name VARCHAR(255) NOT NULL,
                       username VARCHAR(255) UNIQUE NOT NULL,
                       lastname VARCHAR(255) NOT NULL,
                       email VARCHAR(255) UNIQUE NOT NULL,
                       bio TEXT,
                       password VARCHAR(3000) NOT NULL,
                       created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Таблица ролей пользователей (User roles)
CREATE TABLE user_role (
                           user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
                           role VARCHAR(255) NOT NULL,
                           PRIMARY KEY (user_id, role)
);

-- Таблица постов (Post)
CREATE TABLE posts (
                       id SERIAL PRIMARY KEY,
                       title VARCHAR(255),
                       caption TEXT,
                       location VARCHAR(255),
                       likes INTEGER DEFAULT 0,
                       user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
                       created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Таблица пользователей, которые лайкнули пост (Liked Users)
CREATE TABLE post_liked_users (
                                  post_id INTEGER NOT NULL REFERENCES posts(id) ON DELETE CASCADE,
                                  liked_user VARCHAR(255) NOT NULL,
                                  PRIMARY KEY (post_id, liked_user)
);

-- Таблица комментариев (Comment)
CREATE TABLE comments (
                          id SERIAL PRIMARY KEY,
                          post_id INTEGER NOT NULL REFERENCES posts(id) ON DELETE CASCADE,
                          username VARCHAR(255) NOT NULL,
                          user_id INTEGER NOT NULL,
                          message TEXT NOT NULL,
                          created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Таблица изображений (ImageModel)
CREATE TABLE images_model (
                        id SERIAL PRIMARY KEY,
                        name VARCHAR(255) NOT NULL,
                        image_bytes BYTEA NOT NULL,
                        user_id INTEGER REFERENCES users(id) ON DELETE SET NULL,
                        post_id INTEGER REFERENCES posts(id) ON DELETE SET NULL
);
