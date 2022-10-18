CREATE TABLE games(
    id auto GENERATED ALWAYS AS IDENTITY NOT NULL
    multiplayer varchar(250)
    last_played_at date
    published_date date
    primary key(id)
)

CREATE TABLE author(
    id auto GENERATED ALWAYS AS IDENTITY NOT NULL
    first_name varchar(250)
    last_name varchar(250)
    primary key(id)
)
