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