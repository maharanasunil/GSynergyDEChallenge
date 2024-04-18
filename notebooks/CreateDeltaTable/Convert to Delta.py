# Databricks notebook source
# MAGIC %sql
# MAGIC drop database dim cascade;
# MAGIC drop database fct cascade;

# COMMAND ----------

# MAGIC %sql
# MAGIC create database dim;
# MAGIC create database fct;

# COMMAND ----------

# MAGIC %md
# MAGIC ## Collect all the file names from the DataLake Raw Layer

# COMMAND ----------

# Define the mounted directory path
mounted_path = "mnt/gsynergydatalake/rawdata/data"

# Initialize an empty list to store file names
file_names = []

# List all files in the directory
for file_info in dbutils.fs.ls(mounted_path):
    # Extract file name from the file info
    file_name = file_info.name.split("/")[-1]
    file_names.append(file_name)

# Display the list of file names
file_names

# COMMAND ----------

# MAGIC %md
# MAGIC ## Save all tables in dim and fct database

# COMMAND ----------

from pyspark.sql import SparkSession

# Initialize SparkSession
spark = SparkSession.builder.getOrCreate()

def read_data(file_path):
    # Read data and return DataFrame
    return spark.read \
                .format("csv") \
                .option("header", "true") \
                .option("delimiter", "|") \
                .load(file_path)

def write_data(dbname, tbl_name, data_df):
    if dbname == 'fact':
        dbname = 'fct'
    elif dbname == 'hier':
        dbname = 'dim'
    data_df.coalesce(1)\
        .write \
        .format("delta") \
        .mode("overwrite") \
        .saveAsTable("{a}.{b}".format(a=dbname, b=tbl_name))

# Assuming file_names is the list of file names you obtained earlier
for f in file_names:
    dbname, tbl_name, file_format, compression = f.split('.')
    file_path = '/mnt/gsynergydatalake/rawdata/data/{a}.{b}.dlm.gz'.format(a=dbname, b=tbl_name)
    print(file_path)
    # Read data
    data_df = read_data(file_path)
    # Write data
    write_data(dbname, tbl_name, data_df)
    print("Created {a}.{b} Table".format(a=dbname, b=tbl_name))


# COMMAND ----------

# MAGIC %sql
# MAGIC select * from dim.clnd

# COMMAND ----------

# temp_df = spark.read \
#                 .format("csv") \
#                 .option("header", "true") \
#                 .option("delimiter", "|") \
#                 .load('/mnt/gsynergydatalake/rawdata/data/hier.pricestate.dlm.gz')
# temp_df.show()

# COMMAND ----------


