# Produces the package dataset `public_schools`

# This dataset is a dated snapshot of the NSW Public Schools Master Dataset,
# made on 2025-01-11. The original source is available under a cc-by licence at
# https://data.nsw.gov.au/data/dataset/nsw-education-nsw-public-schools-master-dataset

library(readr)

public_schools <- read_csv("data-raw/master_dataset.csv",
                           col_types = cols(
                             School_code = col_character(),
                             AgeID = col_character(),
                             School_name = col_character(),
                             Street = col_character(),
                             Town_suburb = col_character(),
                             Postcode = col_character(),
                             Phone = col_character(),
                             School_Email = col_character(),
                             Website = col_character(),
                             Fax = col_character(),
                             latest_year_enrolment_FTE = col_double(),
                             Indigenous_pct = col_double(),
                             LBOTE_pct = col_double(),
                             ICSEA_value = col_double(),
                             Level_of_schooling = col_character(),
                             Selective_school = col_character(),
                             Opportunity_class = col_character(),
                             School_specialty_type = col_character(),
                             School_subtype = col_character(),
                             Support_classes = col_logical(),
                             Preschool_ind = col_character(),
                             Distance_education = col_character(),
                             Intensive_english_centre = col_character(),
                             School_gender = col_character(),
                             Late_opening_school = col_character(),
                             Date_1st_teacher = col_date(format = ""),
                             LGA = col_character(),
                             electorate_from_2023 = col_character(),
                             electorate_2015_2022 = col_character(),
                             Fed_electorate = col_character(),
                             Operational_directorate = col_character(),
                             Principal_network = col_character(),
                             Operational_directorate_office = col_character(),
                             Operational_directorate_office_phone = col_character(),
                             Operational_directorate_office_address = col_character(),
                             FACS_district = col_character(),
                             Local_health_district = col_character(),
                             AECG_region = col_character(),
                             ASGS_remoteness = col_character(),
                             Latitude = col_double(),
                             Longitude = col_double(),
                             `Assets unit` = col_character(),
                             SA4 = col_character(),
                             FOEI_Value = col_double(),
                             Date_extracted = col_date(format = "")
                           ))

usethis::use_data(public_schools, overwrite = TRUE)
