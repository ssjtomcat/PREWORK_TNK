import os
import csv

# Path to collect data from the Resources folder
wrestlingCSV = os.path.join("..", "Resources", "WWE-Data-2016.csv")


# Define the function and have it accept the 'wrestlerData' as its sole parameter

def getPercentages(wrestlerData):

# Find the total number of matches wrestled
totalMatches = int(wrestlerData[1]) + int(wrestlerData[2]) + int(wrestlerData[3])

# Find the percentage of matches won
winPercent = (int(wrestlerData[1]) / totalMatches) * 100

# Find the percentage of matches lost
lossPercent = (int(wrestlerData[2]) / totalMatches) * 100

# Find the percentage of matches drawn
drawPercent = (int(wrestlerData[3]) / totalMatches) * 100

if(lossPercent > 50):
	typeOfWrestler = "Jobber"
else:
	typeOfWrestler = "Superstar"

# Print out the wrestler's name and their percentage stats


# Read in the CSV file
with open(wrestlingCSV, 'r') as csvfile:

    # Split the data on commas
    csvreader = csv.reader(csvfile, delimiter=',')

    # Prompt the user for what wrestler they would like to search for
    nameToCheck = input("What wrestler do you want to look for? ")

    # Loop through the data
    for row in csvreader:

        # If the wrestler's name in a row is equal to that which the user input, run the 'getPercentages()' function
        if(nameToCheck == row[0]):
            getPercentages(row)
