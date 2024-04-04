#!/bin/bash

# Set the total number of records to generate
total_records=1000000

# Set the output SQL file name
output_file="db.sql"

# Start generating SQL insert statements
echo "INSERT INTO posts (author_id, title, description, content, date) VALUES" > $output_file

# Loop to generate insert statements for each record
for ((i=1; i<=$total_records; i++)); do
    author_id=$((RANDOM % 100 + 1))  # Random author_id between 1 and 100
    title="Title $i"
    description="Description $i"
    content="Content $i"
    date=$(date +"%Y-%m-%d")  # Current date

    # Append the insert statement to the SQL file
    echo "($author_id, '$title', '$description', '$content', '$date')," >> $output_file
done

# Remove the trailing comma from the last insert statement
sed -i '$ s/,$//' $output_file

echo "SQL file generated: $output_file"
