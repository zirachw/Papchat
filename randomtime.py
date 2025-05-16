import random

def generate_random_times(n):
    times = []
    for _ in range(n):
        hour = random.randint(0, 23)
        minute = random.randint(0, 59)
        second = random.randint(0, 59)
        times.append(f"{hour:02}:{minute:02}:{second:02}")
    return times

random_times = generate_random_times(108)

# Print the result
for time in random_times:
    print(time)
