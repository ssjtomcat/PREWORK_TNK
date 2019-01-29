# Initial variable to track game play
user_play ="y"

# Set the start and last numebr
start_number = 0

# While we are still playing...
while user_play == "y":

	# Ask the user how many numbers to loop through
	user_number = input("How many number?")

	# Loop through the numbers. (Make sure to make string into integer)
	for x in range(start_number, int(user_number) + start_number):

		# Print each number in the range
		print(x)

	# Set the next start as the last number of the loop
	start_number= start_number+ int(user_number)

	# Once complete
	user_play = input("Continue the chain: (y)es or (n)o?")