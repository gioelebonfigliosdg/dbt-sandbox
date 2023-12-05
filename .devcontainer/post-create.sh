echo "Start post-create process"

echo "1/5 - Config GitHub account"

read -p "Your name: " name
git config --local user.name "$name"

read -p "Your GitHub email: " email
git config --local user.email $email

read -p "Your GitHub username: " username
git config --local credential.username $username

echo "2/5 - Clean dbt targets"
dbt clean

echo "3/5 - Install dbt packages"
dbt deps

echo "4/5 - Check dbt configuration and connection"
dbt debug

echo "5/5 - Load the database with raw data"
dbt seed

echo "End post-create process"
