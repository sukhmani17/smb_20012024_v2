# The name of this view in Looker is "Smb V2"
view: smb_v2 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `SMB_20012024.smb_v2` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Annual Payroll" in Explore.

  dimension: annual_payroll {
    type: number
    sql: ${TABLE}.AnnualPayroll ;;
  }

  dimension: borrower_address {
    type: string
    sql: ${TABLE}.BorrowerAddress ;;
  }

  dimension: borrower_city {
    type: string
    sql: ${TABLE}.BorrowerCity ;;
  }

  dimension: borrower_name {
    label: "Company Name"
    type: string
    sql: ${TABLE}.BorrowerName ;;
  }

  dimension: borrower_state {
    label: "State"
    map_layer_name: us_states
    type: string
    sql: ${TABLE}.BorrowerState ;;
  }

  dimension: borrower_zip {
    label: "Zip"
    type: string
    sql: ${TABLE}.BorrowerZip ;;
  }

  dimension: jobs_reported {
    label: "Number of Employees"
    type: number
    sql: ${TABLE}.JobsReported ;;
  }

  dimension: naics_us_code2017 {
    label:"NAICS Code"
    type: number
    sql: ${TABLE}.NAICS_US_Code2017 ;;
  }

  dimension: naics_us_title2017 {
    label: "NAICS Title"
    type: string
    sql: ${TABLE}.NAICS_US_Title2017 ;;
  }

  dimension: originating_lender {
    label: "Bank"
    type: string
    sql: ${TABLE}.OriginatingLender ;;
  }

  dimension: payroll_proceed_for_ppp {
    type: number
    sql: ${TABLE}.PayrollProceed_for_PPP ;;
  }

  dimension: project_county_name {
    type: string
    sql: ${TABLE}.ProjectCountyName ;;
  }

  dimension: revenue {
    type: number
    sql: ${TABLE}.revenue ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_revenue {
    type: sum
    sql: ${revenue} ;;  }
  measure: average_revenue {
    type: average
    sql: ${revenue} ;;  }
  measure: count {
    type: count
    drill_fields: [project_county_name, borrower_name]
  }
  dimension: Address {
    type: string
    sql: concat(${borrower_address},",",${borrower_city},",",${borrower_state},",",${borrower_zip}) ;;
  }
  measure: Revenue {
    type: sum
    value_format_name: usd_0
    sql: ${revenue} ;;
  }

  measure: payroll2 {
    label: "Annual Payroll"
    value_format_name: usd_0
    type: sum
    sql: ${annual_payroll} ;;
  }

  measure: NAICSCode2{
    type: sum
    sql: ${naics_us_code2017} ;;
  }
}
