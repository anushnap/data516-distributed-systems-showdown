CREATE TABLE akas(
    titleID VARCHAR(255),
    ordering INT,
    title VARCHAR(255),
    region VARCHAR(255),
    language VARCHAR(255),
    types VARCHAR(255),
    attributes VARCHAR(255),
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
    genres VARCHAR(255)
);

CREATE TABLE crew(
    tconst VARCHAR(255),
    directors VARCHAR(255),
    writers VARCHAR(255)
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
    primaryProfession VARCHAR(255),
    knownForTitles VARCHAR(255)
);

copy into name_basics from 's3://data516-project-data-2/imdb/name_basics.csv' 
file_format = (TYPE='csv'
               FIELD_DELIMITER = '|'
               SKIP_HEADER = 1
               NULL_IF = ('NA'));

copy into title_basics from 's3://data516-project-data-2/imdb/title.basics.csv' 
file_format = (TYPE='csv'
               FIELD_DELIMITER = '|'
               SKIP_HEADER = 1
               NULL_IF = ('NA', '\\N')
               REPLACE_INVALID_CHARACTERS = TRUE)
ON_ERROR = CONTINUE;

copy into crew from 's3://data516-project-data-2/imdb/title.crew.csv'
file_format = (TYPE='csv'
               FIELD_DELIMITER = '|'
               SKIP_HEADER = 1
               NULL_IF = ('NA', '\\N'))
TRUNCATECOLUMNS = TRUE;

copy into episode from 's3://data516-project-data-2/imdb/title.episode.csv'
file_format = (TYPE='csv'
               FIELD_DELIMITER = '|'
               SKIP_HEADER = 1
               NULL_IF = ('NA', '\\N'))
;

copy into ratings from 's3://data516-project-data-2/imdb/title.ratings.tsv'
file_format = (TYPE='csv'
               FIELD_DELIMITER = '\t'
               SKIP_HEADER = 1
               NULL_IF = ('NA', '\\N'))
;

copy into principals from 's3://data516-project-data-2/imdb/title.principals.tsv'
file_format = (TYPE='csv'
               FIELD_DELIMITER = '\t'
               SKIP_HEADER = 1
               NULL_IF = ('NA', '\\N'))
TRUNCATECOLUMNS = TRUE;

copy into akas from 's3://data516-project-data-2/imdb/title_akas.tsv'
file_format = (TYPE='csv'
               FIELD_DELIMITER = '\t'
               SKIP_HEADER = 1
               NULL_IF = ('NA', '\\N'))
TRUNCATECOLUMNS = TRUE;