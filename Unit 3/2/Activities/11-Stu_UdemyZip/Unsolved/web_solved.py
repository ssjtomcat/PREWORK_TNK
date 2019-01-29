# First import the os module
# This allows us to create file paths across operating systems
import os

# Module for reading CSV files
import csv

title =[]
price = []
subscribercount = []
numberreviews = []
review_percent = []
courselength = []

csvpath = os.path.join("..", "Resources", "web_starter.csv")

# Open the CSV
with open(csvpath, encoding = "utf8", newline = "") as csvfile:

	csvreader = csv.reader(csvfile, delimiter = ",")

	# Loop through to store values 
	for row in csvreader:
		title.append(row[1])
		price.append(row[4])
		subscribercount.append(row[5])
		numberreviews.append(row[6])

		percent = round(int(row[6]) / int(row[5]), 2)
		review_percent.append(percent)

		courselength.append(row[9])

# Zip all lists together into tuples
webcourse = zip(title, price, subscribercount, numberreviews, review_percent, courselength)


# Specify the file to write to 
output_path = os.path.join("..", "Unsolved", "new.csv")

# Open the file using "write" mode. Specify the variable to hold the contents
with open (output_path, "w", newline = "") as datafile:

	# Initialize csv.writer
	csvwriter = csv.writer(datafile)

	# Write the first row (column headers)
	csvwriter.writerow(["Title", "Price", "Subscriber Count", "Number of Reviews", "Review Percentage", "Course Length"])

	# Write the next rows
	csvwriter.writerows(webcourse)