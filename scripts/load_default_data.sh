#!/bin/bash

## example of script command: ./load_default_data.sh "bolt://localhost:7687" "neo4j" "password" true "../" "/Users/hthai00/Development/neo4j"

host="${1}" ## example: bolt://localhost:7687
username="${2}"
password="${3}"
setup_schema="true"
home_dir="${5}"
db_home_dir="${6}"

if [ "${host}" == "" ]; then
    host="bolt://localhost:7687"
fi

if [ "${username}" == "" ]; then
    username="neo4j"
fi

if [ "${password}" == "" ]; then
    password="neo4jpass"
fi

if [ "${home_dir}" == "" ]; then
    home_dir="."
fi

if [ "${db_home_dir}" == "" ]; then
    db_home_dir="/usr/local/Cellar/neo4j/4.2.1/libexec"
fi
db_home_import_dir="${db_home_dir}/import"

is_schema_setup_success="true"
eval cd $home_dir

if [ "${setup_schema}" == "true" ]; then
    echo "Loading db schema..."
    cat cypher/schema.cyp | ${db_home_dir}/bin/cypher-shell --debug --format verbose -a $host -u $username -p $password
    if [ $? -ne 0 ]; then
        is_schema_setup_success="false"
        echo "Error loading schema! Terminating..."
        exit
    else
        echo "Schema loaded successfully!"
    fi
fi

if [ "${is_schema_setup_success}" == "true" ]; then
    echo "Removing previous data in ${db_home_import_dir}..."
    eval rm -f "${db_home_import_dir}/*.csv "
    echo "Copying data to ${db_home_import_dir} to prepare for data load..."
    eval cp -f ../data/*.csv "${db_home_import_dir}"
    echo "Loading data..."
    cat cypher/default_data.cyp | ${db_home_dir}/bin/cypher-shell --debug --format verbose -a $host -u $username -p $password
else
    echo "Data loading skipped!"
fi
