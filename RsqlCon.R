# https://www.datacareer.de/blog/connect-to-postgresql-with-r-a-step-by-step-example/

install.packages("RPostgres")
library(RPostgres)

# Creating connection to a specific database
library(DBI)
db <- "test_db"  #provide the name of your db
host_db <- "localhost" #i.e. # i.e. 'ec2-54-83-201-96.compute-1.amazonaws.com'  
db_port <- "5432"  # or any other port specified by the DBA
db_user <- "root"  
db_password <- "root"
con <- dbConnect(RPostgres::Postgres(), dbname = db, host=host_db, port=db_port, user=db_user, password=db_password) 

# Test connection
dbListTables(con) 

# Working with database
dbWriteTable(con, "mtcars", mtcars)

# Read table
dbReadTable(con, "mtcars")

# Two methods for querying
# `dbGetQuery` and `dbSendQuery`
# The dbGetQuery method returns all the query results in a dataframe. 
# The dbSendQuery registers the request for the data that has to be called by `dbFetch`
dbGetQuery(con, "SELECT * FROM mtcars;")

# Storing as dataframe
df <- dbGetQuery(con, "SELECT * FROM mtcars;")

# Finally, connection should be closed
dbDisconnect(con) 
