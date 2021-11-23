require(RPostgreSQL)
sib_adm <- dbConnect(PostgreSQL(),dbname="sib_plot",user="sib_adm",password="sib")
dbSendStatement(sib_adm,"DROP SCHEMA main CASCADE")
dbSendStatement(sib_adm,"CREATE SCHEMA main AUTHORIZATION sib")
dbDisconnect(sib_adm)
sib_plot <- dbConnect(PostgreSQL(), user = "sib_user", dbname = "sib_plot", password = "pw")
dbExecute(sib_plot,statement = paste(readLines("/home/marius/Travail/traitementDonnees/2021_Humboldt_Sib/sibPlot/notR/sql_database/creationdb.sql"),collapse="\n"))
dbExecute(sib_plot,statement = paste(readLines("/home/marius/Travail/traitementDonnees/2021_Humboldt_Sib/sibPlot/notR/sql_database/spatialFields.sql"),collapse="\n"))
dbExecute(sib_plot,statement = paste(readLines("/home/marius/Travail/traitementDonnees/2021_Humboldt_Sib/sibPlot/notR/sql_database/insertDictionaries.sql"),collapse="\n"))
dbDisconnect(sib_plot)

