# @TODO: Your code here
hobbies = {
	"name": "Tom Khambounheuang",
	"age": 32,
	"hobbies": ["tennis","golf","fishing"],
	"time wake up": {"Mon": 4, "Friday": 4, "Saturday": 10}}

print(f'Hello I am {hobbies["name"]} and I am {hobbies["age"]} years old.')
print(f'I have {len(hobbies["hobbies"])} hobbies!')
print(f'On the weekend I get up at {hobbies["time wake up"]["Saturday"]}')
