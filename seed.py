import mysql.connector
from faker import Faker
import random

# Create Faker instance
faker = Faker()

# Connect to MySQL
conn = mysql.connector.connect(host='localhost', user='root', password='', database='papchat')
cursor = conn.cursor()

# Function to generate unique user id
def generate_unique_value(table_name, col_name):
    while True:
        val = random.randint(1, 75)
        cursor.execute(f"SELECT 1 FROM {table_name} WHERE {col_name} = {val}")
        if cursor.fetchone() is None:
            return val

# Insert Lens_Level
levels = [
    {'id': 0, 'name': 'Not Rated', 'incentive': 0, 'min': 1},
    {'id': 1, 'name': 'Bronze', 'incentive': 1000000, 'min': 10},
    {'id': 2, 'name': 'Silver', 'incentive': 2000000, 'min': 20},
    {'id': 3, 'name': 'Gold', 'incentive': 3000000, 'min': 30},
]
for level in levels:
    cursor.execute("""
        INSERT INTO Lens_Level (level_id, level_name, incentive, n_min_lens_created)
        VALUES (%s, %s, %s, %s)
    """, (level['id'], level['name'], level['incentive'], level['min']))

# Insert in User table
for _ in range(50):
    user_id = generate_unique_value("User", "user_id")
    email = faker.unique.safe_email()
    password = faker.password()
    username = faker.user_name()
    telp_num = '08' + faker.numerify('#########')  # This will generate phone numbers like '08123456789'
    birthdate = faker.date_of_birth(minimum_age=18, maximum_age=70).strftime('%Y-%m-%d')
    date_created = faker.date_this_decade().strftime('%Y-%m-%d')
    level_id = random.randint(1, 3)  # assuming 3 level_ids exist in the Lens_Level table

    cursor.execute("""
        INSERT INTO `User` (user_id, email, password, username, telp_num, birthdate, date_created, level_id)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
    """, (user_id, email, password, username, telp_num, birthdate, date_created, level_id))

    print(f"Inserted: {username}")

# Fetch user_ids from the User table
cursor.execute("SELECT user_id FROM User")
existing_user_ids = [row[0] for row in cursor.fetchall()]

# Ensure that user_id and friend_id exist in the existing_user_ids list
for _ in range(50):
    user_id = random.choice(existing_user_ids)
    friend_id = random.choice(existing_user_ids)
    
    # Avoid self-friendship (user can't be friends with themselves)
    if user_id != friend_id:
        cursor.execute("INSERT INTO Friend (user_id, friend_id) VALUES (%s, %s)", (user_id, friend_id))
        print(f"Inserted friendship: {user_id} -> {friend_id}")

# Get all valid user_ids from User table
cursor.execute("SELECT user_id FROM User")
valid_user_ids = [row[0] for row in cursor.fetchall()]

# Insert in Subscription
for _ in range(50):
    user_id = random.choice(valid_user_ids)
    subscription_number = generate_unique_value("Subscription", "subscription_number")
    subscribe_date = faker.date_this_year().strftime('%Y-%m-%d')
    expire_date = faker.date_this_year().strftime('%Y-%m-%d')
    status = random.randint(0, 1)

    cursor.execute("""
        INSERT INTO Subscription (user_id, subscription_number, subscribe_date, expire_date, status)
        VALUES (%s, %s, %s, %s, %s)
    """, (user_id, subscription_number, subscribe_date, expire_date, status))

# Insert in Room_Chat
for _ in range(50):
    room_id = generate_unique_value("Room_Chat", "room_id")
    created_date = faker.date_this_year().strftime('%Y-%m-%d')

    cursor.execute("""
        INSERT INTO Room_Chat (room_id, created_date) VALUES (%s, %s)
    """, (room_id, created_date))

# Get all valid room_ids from room_chat table
cursor.execute("SELECT room_id FROM Room_Chat")
valid_room_ids = [row[0] for row in cursor.fetchall()]

# Insert in Room_Join
for _ in range(50):
    room_id = random.choice(valid_room_ids)
    user_id = random.choice(valid_user_ids)
    join_date = faker.date_this_year().strftime('%Y-%m-%d')

    cursor.execute("""
        INSERT INTO Room_Join (room_id, user_id, join_date) VALUES (%s, %s, %s)
    """, (room_id, user_id, join_date))

# Insert Lens
for _ in range(50):
    lens_id = generate_unique_value("Lens", "lens_id")
    user_id = random.choice(valid_user_ids)
    release_date = faker.date_this_year().strftime('%Y-%m-%d')

    cursor.execute("""
        INSERT INTO Lens (lens_id, user_id, release_date)
        VALUES (%s, %s, %s)
    """, (lens_id, user_id, release_date))

# Get all valid lens_id from User table
cursor.execute("SELECT lens_id FROM Lens")
valid_lens_ids = [row[0] for row in cursor.fetchall()]

# Insert Lens_Type — one type per lens
types = ['Face', 'Background', 'Both']

for lens_id in valid_lens_ids:
    lens_type = random.choice(types)
    cursor.execute("""
        INSERT INTO Lens_Type (lens_id, type)
        VALUES (%s, %s)
    """, (lens_id, lens_type))

# Insert Location
for _ in range(50):
    user_id = random.choice(valid_user_ids)
    start_time = faker.date_this_year().strftime('%Y-%m-%d %H:%M:%S')
    end_time = faker.date_this_year().strftime('%Y-%m-%d %H:%M:%S')
    latitude = faker.latitude()
    longitude = faker.longitude()

    cursor.execute("""
        INSERT INTO Location (user_id, start_time, end_time, latitude, longitude)
        VALUES (%s, %s, %s, %s, %s)
    """, (user_id, start_time, end_time, latitude, longitude))

# Insert Pap, Content, Chat, Add_On, Image, Caption
for i in range(1, 51):
    user_id = random.choice(valid_user_ids)
    room_id = random.choice(valid_room_ids)
    sent_order = i
    send_time = faker.date_this_year().strftime('%Y-%m-%d %H:%M:%S')

    cursor.execute("""
        INSERT INTO Content (user_id, room_id, sent_order, send_time, is_exists)
        VALUES (%s, %s, %s, %s, %s)
    """, (user_id, room_id, sent_order, send_time, 1))

    # Insert Pap
    lens_id = random.randint(1, 50)
    duration = random.randint(1, 60)
    cursor.execute("""
        INSERT INTO Pap (user_id, room_id, sent_order, lens_id, duration)
        VALUES (%s, %s, %s, %s, %s)
    """, (user_id, room_id, sent_order, lens_id, duration))

    # Insert Chat
    message = faker.sentence()
    cursor.execute("""
        INSERT INTO Chat (user_id, room_id, sent_order, message)
        VALUES (%s, %s, %s, %s)
    """, (user_id, room_id, sent_order, message))

    # Insert Add_On
    addon_idx = 1
    x_start = random.randint(0, 200)
    x_end = x_start + random.randint(10, 100)
    y_start = random.randint(0, 200)
    y_end = y_start + random.randint(10, 100)
    cursor.execute("""
        INSERT INTO Add_On (user_id, room_id, sent_order, addon_idx, x_start, x_end, y_start, y_end)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
    """, (user_id, room_id, sent_order, addon_idx, x_start, x_end, y_start, y_end))

    # Insert Image
    cursor.execute("""
        INSERT INTO Image (user_id, room_id, sent_order, addon_idx, name)
        VALUES (%s, %s, %s, %s, %s)
    """, (user_id, room_id, sent_order, addon_idx, f'image_{i}.jpg'))

    # Insert Caption
    font_style = random.choice(['Arial', 'Verdana', 'Comic Sans'])
    text = faker.sentence()
    cursor.execute("""
        INSERT INTO Caption (user_id, room_id, sent_order, addon_idx, font_style, text)
        VALUES (%s, %s, %s, %s, %s, %s)
    """, (user_id, room_id, sent_order, addon_idx, font_style, text))

# Commit and close
conn.commit()
cursor.close()
conn.close()

print("Data insertion complete.")
