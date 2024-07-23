insert_visits <- function(connection) {
  sql <- "

insert into concept (
  concept_id,
  concept_name,
  domain_id,
  vocabulary_id,
  concept_class_id,
  standard_concept,
  concept_code,
  valid_start_date,
  valid_end_date,
  invalid_reason
)
values (
  262--concept_id,
  ,'Emergency Room and Inpatient Visit'--concept_name,
  ,'Visit'--domain_id,
  ,'Visit'--vocabulary_id,
  ,'Visit'--concept_class_id,
  ,'S'--standard_concept,
  ,'ERIP'--concept_code,
  ,strftime('%s', '1970-01-01 00:00:00')--valid_start_date,
  ,strftime('%s', '2099-12-31 00:00:00')--valid_end_date,
  ,null--invalid_reason
);

delete from visit_occurrence where visit_occurrence_id >= 1000000;
insert into visit_occurrence(
  visit_occurrence_id
  ,person_id
  ,visit_concept_id
  ,visit_start_date
  ,visit_start_datetime
  ,visit_end_date
  ,visit_end_datetime
  ,visit_type_concept_id
  ,provider_id
  ,care_site_id
  ,visit_source_value
  ,visit_source_concept_id
  ,admitting_source_concept_id
  ,admitting_source_value
  ,discharge_to_concept_id
  ,discharge_to_source_value
  ,preceding_visit_occurrence_id
)
values(
  1000000--visit_occurrence_id
  ,1491--person_id
  ,9201--visit_concept_id
  ,strftime('%s', '2011-07-11 12:34:56')--visit_start_date
  ,strftime('%s', '2011-07-11 12:34:56')--visit_start_datetime
  ,strftime('%s', '2011-07-13 12:34:56')--visit_end_date
  ,strftime('%s', '2011-07-13 12:34:56')--visit_end_datetime
  ,0--visit_type_concept_id
  ,null--provider_id
  ,null--care_site_id
  ,null--visit_source_value
  ,0--visit_source_concept_id
  ,0--admitting_source_concept_id
  ,null--admitting_source_value
  ,0--discharge_to_concept_id
  ,null--discharge_to_source_value
  ,null--preceding_visit_occurrence_id
), 
(
  1000001--visit_occurrence_id
  ,105--person_id
  ,262--visit_concept_id
  ,strftime('%s', '2005-11-10 12:34:56')--visit_start_date
  ,strftime('%s', '2005-11-10 12:34:56')--visit_start_datetime
  ,strftime('%s', '2005-11-13 12:34:56')--visit_end_date
  ,strftime('%s', '2005-11-13 12:34:56')--visit_end_datetime
  ,0--visit_type_concept_id
  ,null--provider_id
  ,null--care_site_id
  ,null--visit_source_value
  ,0--visit_source_concept_id
  ,0--admitting_source_concept_id
  ,null--admitting_source_value
  ,0--discharge_to_concept_id
  ,null--discharge_to_source_value
  ,null--preceding_visit_occurrence_id
),
(
  1000002--visit_occurrence_id
  ,96--person_id
  ,262--visit_concept_id
  ,strftime('%s', '1997-01-24 12:34:56')--visit_start_date
  ,strftime('%s', '1997-01-24 12:34:56')--visit_start_datetime
  ,strftime('%s', '1997-01-26	 12:34:56')--visit_end_date
  ,strftime('%s', '1997-01-26 12:34:56')--visit_end_datetime
  ,0--visit_type_concept_id
  ,null--provider_id
  ,null--care_site_id
  ,null--visit_source_value
  ,0--visit_source_concept_id
  ,0--admitting_source_concept_id
  ,null--admitting_source_value
  ,0--discharge_to_concept_id
  ,null--discharge_to_source_value
  ,null--preceding_visit_occurrence_id
),
(
  1000003--visit_occurrence_id
  ,3049--person_id
  ,9203--visit_concept_id
  ,strftime('%s', '1986-12-04 12:34:56')--visit_start_date
  ,strftime('%s', '1986-12-04 12:34:56')--visit_start_datetime
  ,strftime('%s', '1986-12-06	 12:34:56')--visit_end_date
  ,strftime('%s', '1986-12-06 12:34:56')--visit_end_datetime
  ,0--visit_type_concept_id
  ,null--provider_id
  ,null--care_site_id
  ,null--visit_source_value
  ,0--visit_source_concept_id
  ,0--admitting_source_concept_id
  ,null--admitting_source_value
  ,0--discharge_to_concept_id
  ,null--discharge_to_source_value
  ,null--preceding_visit_occurrence_id
),
(
  1000004--visit_occurrence_id
  ,2692--person_id
  ,9201--visit_concept_id
  ,strftime('%s', '1998-06-28 12:34:56')--visit_start_date
  ,strftime('%s', '1998-06-28 12:34:56')--visit_start_datetime
  ,strftime('%s', '1998-06-30 12:34:56')--visit_end_date
  ,strftime('%s', '1998-06-30 12:34:56')--visit_end_datetime
  ,0--visit_type_concept_id
  ,null--provider_id
  ,null--care_site_id
  ,null--visit_source_value
  ,0--visit_source_concept_id
  ,0--admitting_source_concept_id
  ,null--admitting_source_value
  ,0--discharge_to_concept_id
  ,null--discharge_to_source_value
  ,null--preceding_visit_occurrence_id
)
;
"
  print("Adding visits...")
  cat(sql)
  DatabaseConnector::executeSql(connection = connection, sql = sql)
}
