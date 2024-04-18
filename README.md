# Your dbt Project Name

Welcome to [Your dbt Project Name]! This project utilizes dbt (data build tool) to transform raw data into analytics-ready tables in your data warehouse. Below, you'll find information on how to set up and use this project effectively.

## Project Structure

- **models**: Contains dbt models that define transformations on your raw data.
- **tests**: Contains dbt tests to ensure data quality and integrity.
- **analysis**: Contains SQL files for ad-hoc analysis and reporting.
- **macros**: Contains reusable dbt macros for common tasks.
- **snapshots**: Contains dbt snapshots for capturing point-in-time data.

## Setup Instructions

The instructions below assume you are running dbt on macOS. Linux and Windows 
users should adjust the bash commands accordingly.

1. Clone this github repo
2. Install [dbt-spark](https://github.com/fishtown-analytics/dbt-spark): `pip install dbt-spark`
3. Copy the example profile to your `~/.dbt` folder (created when installing dbt):
```bash
$ cp ./sample.profiles.yml ~/.dbt/profiles.yml
```
4. Populate `~/.dbt/profiles.yml` with your Databricks host, API token, cluster ID, and schema name
```bash
open ~/.dbt
```
5. Verify that you can connect to Databricks
```
$ dbt debug
```
6. Verify that you can run dbt
```
$ dbt run
```