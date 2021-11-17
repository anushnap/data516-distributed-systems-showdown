CREATE TABLE akas(
    titleID VARCHAR(255),
    ordering INT,
    title VARCHAR(255),
    region VARCHAR(255),
    language VARCHAR(255),
    -- IMDB SAYS THIS IS AN ARRAY TYPE, LOOKS TO BE SEPARATED BY SPACES?
    types SUPER,
    attributes SUPER,
    isOriginalTitle BOOLEAN DEFAULT TRUE
);

CREATE TABLE title_basics(
    tconst VARCHAR(255),
    titleType VARCHAR(255),
    primaryTitle VARCHAR(255),
    originalTitle VARCHAR(255),
    isAdult BOOLEAN DEFAULT TRUE,
    startYear INT,
    endYear INT,
    runtimeMinutes INT,
    genres SUPER
);

CREATE TABLE crew(
    tconst VARCHAR(255),
    directors SUPER,
    writers SUPER
);

CREATE TABLE episode(
    tconst VARCHAR(255),
    parentTconst VARCHAR(255),
    seasonNumber INT,
    episodeNumber INT
);

CREATE TABLE principals(
    tconst VARCHAR(255),
    ordering INT,
    nconst VARCHAR(255),
    category VARCHAR(255),
    job VARCHAR(255),
    characters VARCHAR(255)
);

CREATE TABLE ratings(
    tconst VARCHAR(255),
    averageRating REAL,
    numVotes INT
);

CREATE TABLE name_basics(
    nconst VARCHAR(255),
    primaryName VARCHAR(255),
    birthYear INT,
    deathYear INT,
    primaryProfession SUPER,
    knownForTitles SUPER
);