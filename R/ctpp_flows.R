# Read the CTPP tract flow data into R.

# The RODBC library relies on a usable Access database driver, installed 
# separately If the script doesn't try downloading the 64-bit driver from
#
#     http://www.microsoft.com/en-us/download/details.aspx?id=13255
# 
# Installing this through Windows directly may cause conflicts with the existing
# Office installation. Instead use the command prompt at the download point
#
#     AccessDatabaseEngine_x64.exe /passive
#
# Then go to regedit  HKEY_LOCAL_MACHINE > SOFTWARE > Microsoft > Office > 
# 14.0 > Common > FilesPaths >  and delete `mso.dll`.


## THIS IS THE SCRIPT USED TO EXTRACT THE R DATA FROM AN ACCESS DATABASE
## It is commented to as not to break build scripts.

#> acc_file <- "L:/CTPP tracts/tract-flows.accdb"
#> channel <-  RODBC::odbcConnectAccess2007(acc_file)
#> 
#> df <- RODBC::sqlFetch(channel, "Tract-flows")
#> 
#> ctpp_flows <- dplyr::tbl_df(df)
#> 
#> save(ctpp_flows, file = "data/ctpp_flows.Rdata")
