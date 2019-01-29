#Dependencies
import os
import csv

# Three Lists
indexes = [1, 2, 3, 4]
employees = ["Michael", "Dwight", "Meredith", "Kelly"]
department = ["Boss", "Sales", "Sales", "HR"]

# Zip all three lists together into tuples
roster = zip(indexes, employees, department)

# Save the output file path
output_file = os.path.join("output.csv")

# Open the output file, ceate a header row, and then write the zipped object to the csv
with open(output_file, "w", newline = "") as datafile:
	writer = csv.writer(datafile)

	writer.writerow(["Index", "Employee", "Department"])

	writer.writerows(roster)
	