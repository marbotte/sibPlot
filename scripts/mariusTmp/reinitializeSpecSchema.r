require(RPostgreSQL)
setwd("/home/marius/Travail/traitementDonnees/2021_Humboldt_Sib/sibPlot/devDocs/")
sib_adm <- dbConnect(PostgreSQL(),dbname = "sib_plot",user = "sib_adm",password="sib")
dbSendStatement(sib_adm,"DROP SCHEMA spec CASCADE")
sqlCreateSpec <- paste(readLines("../notR/sql_database/createInputSpecTables.sql"),collapse = "\n")
dbSendStatement(sib_adm,sqlCreateSpec)
dbSendStatement(sib_adm,"GRANT USAGE ON SCHEMA spec TO sib")
dbSendStatement(sib_adm,"GRANT SELECT ON ALL TABLES IN SCHEMA spec TO sib")
dbDisconnect(sib_adm)