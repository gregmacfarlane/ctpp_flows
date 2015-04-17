ctppflows
=======================

This package contains a dataset of home-to-work flows
provided by the Federal Highway Administration as part of the Census 
Transportation Planning Package.

  - `ctpp_flows` flows between residences and workplaces for all Census tracts
  in the United States.
  
For more information, see the [CTPP website](http://www.fhwa.dot.gov/planning/census_issues/ctpp/data_products/2006-2010_tract_flows/index.cfm).

Use
-------------------
The package can be installed directly into R as a library using the 
[devtools](https://github.com/hadley/devtools) package.

    devtools::install_github("gregmacfarlane/ctpp_flows")
    library(ctppflows)
    ?ctpp_flows

There are also a series of helper function that can be used to easily extract
different geographic levels from the FIPS codes.

We highly recommend that users also `library(dplyr)`, which will prevent the 
entire dataset of 4 million rows from printing to your console. Its tools will 
also aid users in extracting and filtering the data for their purposes.
