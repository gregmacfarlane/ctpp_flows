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

acc_file <- "L:/CTPP tracts/tract-flows.accdb"
channel <-  RODBC::odbcConnectAccess2007(acc_file)

df <- RODBC::sqlFetch(channel, "Tract-flows")

ctpp_flows <- dplyr::tbl_df(df)

ctpp_flows <- ctpp_flows %>%
  mutate(
    # fix FIPS code width
    rstate = sprintf("%02d", Residence_State_FIPS_Code),
    wstate = sprintf("%02d", Workplace_State_FIPS_Code),
    rcnty = sprintf("%03d", Residence_County_FIPS_Code),
    wcnty = sprintf("%03d", Workplace_County_FIPS_Code),
    rtract = sprintf("%06d", Residence_Tract_FIPS_Code),
    wtract = sprintf("%06d", Workplace_Tract_FIPS_Code)
  ) %>%
  transmute(
    # concatenate FIPS code to GEOID format
    residence = paste(rstate, rcnty, rtract, sep = ""),
    workplace = paste(wstate, wcnty, wtract, sep = ""),
    flow = EST,
    flow_moe = MOE
  )

 
save(ctpp_flows, file = "data/ctpp_flows.Rdata")
