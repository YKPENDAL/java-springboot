#!/bin/bash

# Array of possible phone numbers
phone_numbers=("1234567890" "9876543210" "5551234567" "9998887777" "4445556666" "1112233444" "7778889999")

# File to store the output
output_file="output.sql"

# Clear existing content in the output file
> "$output_file"

echo "INSERT INTO your_table_name (empname, phone, classid) VALUES" >> "$output_file"
for i in {1..1000000}
do
  # Select a random phone number from the array
  random_phone=${phone_numbers[$((RANDOM % ${#phone_numbers[@]}))]}
  
  # Generate a random name
  random_name="emp$i"
  
  # Append the output to the file
  echo "('$random_name', '$random_phone', $((($i-1)%3 + 1))), " >> "$output_file"
done

# Remove the trailing comma from the last line
sed -i '$s/,$//' "$output_file"

echo ";" >> "$output_file"

echo "Output saved to $output_file"
