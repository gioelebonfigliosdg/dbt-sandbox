echo "Start post-create process"

echo "1/4 - Clean dbt targets"
dbt clean

echo "2/4 - Install dbt packages"
dbt deps

echo "3/4 - Check dbt configuration and connection"
dbt debug

echo "4/4 - Load the database with raw data"
dbt seed

echo "End post-create process"
