# First import the os module
# This allows us to create file paths across operating systems
import os

# Module for reading CSV files
import csv

csvpath = os.path.join('..', 'Resources', 'accounting.csv')

# Method 2: Improved Reading using CSV module

with open(csvpath, newline = '') as csvfile:

	# CSV reader specifies delimiter and variable that holds contents
	csvreader = csv.reader(csvfile, delimiter = ',')

	print(csvreader)

	# Read the header row first (skip this step if there is no header)
	csv_header = next(csvreader)
	print(f"CSV Header: {csv_header}")

	# Read each row of data after the header
	for row in csvreader:
		print(row)
