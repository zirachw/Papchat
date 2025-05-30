import mysql.connector
import copy
from faker import Faker
import random
import datetime

MIN_PRIM_DATA = 150
MULTIPLIER_FOREIGN_DATA = 200

# Create Faker instance
faker = Faker()

# Connect to MySQL without specifying the database first
conn = mysql.connector.connect(host='localhost', user='root', password='')   
cursor = conn.cursor()

# Create database if it doesn't exist
try:
    cursor.execute("CREATE DATABASE IF NOT EXISTS papchat")
    print("Database 'papchat' created or already exists")
except mysql.connector.Error as err:
    print(f"Error creating database: {err}")
    exit(1)

# Use the papchat database
cursor.execute("USE papchat")

# Define table creation statements
tables = {}

# Lens_Level table
tables['Lens_Level'] = """
CREATE TABLE IF NOT EXISTS Lens_Level (
    level_id INT PRIMARY KEY,
    level_name VARCHAR(50) NOT NULL,
    incentive INT NOT NULL,
    n_min_lens_created INT NOT NULL
)
"""

# User table - Using AUTO_INCREMENT
tables['User'] = """
CREATE TABLE IF NOT EXISTS User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    telp_num VARCHAR(15),
    birthdate DATE,
    date_created DATE NOT NULL,
    level_id INT,
    FOREIGN KEY (level_id) REFERENCES Lens_Level(level_id)
)
"""

# Friend table - Added streak and start_date
tables['Friend'] = """
CREATE TABLE IF NOT EXISTS Friend (
    user_id INT,
    friend_id INT,
    start_date DATE NOT NULL,
    streak INT DEFAULT 0,
    PRIMARY KEY (user_id, friend_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (friend_id) REFERENCES User(user_id)
)
"""

# Subscription table - Using AUTO_INCREMENT
tables['Subscription'] = """
CREATE TABLE IF NOT EXISTS Subscription (
    subscription_number INT AUTO_INCREMENT,
    user_id INT,
    subscribe_date DATE NOT NULL,
    expire_date DATE NOT NULL,
    status ENUM('inactive', 'active') NOT NULL,
    PRIMARY KEY (subscription_number, user_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
)
"""

# Room_Chat table - Using AUTO_INCREMENT
tables['Room_Chat'] = """
CREATE TABLE IF NOT EXISTS Room_Chat (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    created_date DATE NOT NULL
)
"""

# Room_Join table
tables['Room_Join'] = """
CREATE TABLE IF NOT EXISTS Room_Join (
    room_id INT,
    user_id INT,
    join_date DATE NOT NULL,
    PRIMARY KEY (room_id, user_id),
    FOREIGN KEY (room_id) REFERENCES Room_Chat(room_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
)
"""

# Lens table - Using AUTO_INCREMENT
tables['Lens'] = """
CREATE TABLE IF NOT EXISTS Lens (
    lens_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    name VARCHAR(100) NOT NULL,
    release_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
)
"""

# Content table
tables['Content'] = """
CREATE TABLE IF NOT EXISTS Content (
    user_id INT,
    room_id INT,
    sent_order INT,
    send_time DATETIME NOT NULL,
    is_exists TINYINT NOT NULL,
    PRIMARY KEY (user_id, room_id, sent_order),
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (room_id) REFERENCES Room_Chat(room_id)
)
"""

# Chat table
tables['Chat'] = """
CREATE TABLE IF NOT EXISTS Chat (
    user_id INT,
    room_id INT,
    sent_order INT,
    message TEXT NOT NULL,
    PRIMARY KEY (user_id, room_id, sent_order),
    FOREIGN KEY (user_id, room_id, sent_order) REFERENCES Content(user_id, room_id, sent_order)
)
"""

# Pap table - Modified to set duration=0 for photos
tables['Pap'] = """
CREATE TABLE IF NOT EXISTS Pap (
    user_id INT,
    room_id INT,
    sent_order INT,
    lens_id INT,
    content_type ENUM('photo', 'video') NOT NULL,
    duration INT NOT NULL,
    PRIMARY KEY (user_id, room_id, sent_order),
    FOREIGN KEY (user_id, room_id, sent_order) REFERENCES Content(user_id, room_id, sent_order),
    FOREIGN KEY (lens_id) REFERENCES Lens(lens_id),
    CHECK (content_type = 'photo' AND duration = 0 OR content_type = 'video' AND duration > 0)
)
"""

# Add_On table
tables['Add_On'] = """
CREATE TABLE IF NOT EXISTS Add_On (
    user_id INT,
    room_id INT,
    sent_order INT,
    addon_idx INT,
    x_start INT NOT NULL,
    x_end INT NOT NULL,
    y_start INT NOT NULL,
    y_end INT NOT NULL,
    PRIMARY KEY (user_id, room_id, sent_order, addon_idx),
    FOREIGN KEY (user_id, room_id, sent_order) REFERENCES Pap(user_id, room_id, sent_order)
)
"""

# Image table
tables['Image'] = """
CREATE TABLE IF NOT EXISTS Image (
    user_id INT,
    room_id INT,
    sent_order INT,
    addon_idx INT,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (user_id, room_id, sent_order, addon_idx),
    FOREIGN KEY (user_id, room_id, sent_order, addon_idx) REFERENCES Add_On(user_id, room_id, sent_order, addon_idx)
)
"""

# Caption table
tables['Caption'] = """
CREATE TABLE IF NOT EXISTS Caption (
    user_id INT,
    room_id INT,
    sent_order INT,
    addon_idx INT,
    font_style VARCHAR(50) NOT NULL,
    text TEXT NOT NULL,
    PRIMARY KEY (user_id, room_id, sent_order, addon_idx),
    FOREIGN KEY (user_id, room_id, sent_order, addon_idx) REFERENCES Add_On(user_id, room_id, sent_order, addon_idx)
)
"""

# Lens_Type table - Modified to handle multiple types per lens
tables['Lens_Type'] = """
CREATE TABLE IF NOT EXISTS Lens_Type (
    lens_id INT,
    type ENUM('Face', 'Background') NOT NULL,
    PRIMARY KEY (lens_id, type),
    FOREIGN KEY (lens_id) REFERENCES Lens(lens_id)
)
"""

# Location table - Added status field (public/private)
tables['Location'] = """
CREATE TABLE IF NOT EXISTS Location (
    user_id INT,
    start_time DATETIME,
    end_time DATETIME,
    latitude DECIMAL(9,6) NOT NULL,
    longitude DECIMAL(9,6) NOT NULL,
    status ENUM('public', 'private') NOT NULL DEFAULT 'private',
    PRIMARY KEY (user_id, start_time),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
)
"""

# Create tables if they don't exist
for table_name, create_statement in tables.items():
    try:
        cursor.execute(create_statement)
        print(f"Table '{table_name}' created or already exists")
    except mysql.connector.Error as err:
        print(f"Error creating table {table_name}: {err}")

# Insert Lens_Level
levels = [
    {'id': 0, 'name': 'Not Rated', 'incentive': 0, 'min': 1},
    {'id': 1, 'name': 'Bronze', 'incentive': 1000000, 'min': 10},
    {'id': 2, 'name': 'Silver', 'incentive': 2000000, 'min': 20},
    {'id': 3, 'name': 'Gold', 'incentive': 3000000, 'min': 30},
]

# Check if Lens_Level table is empty before inserting
cursor.execute("SELECT COUNT(*) FROM Lens_Level")
count = cursor.fetchone()[0]
if count == 0:
    for level in levels:
        cursor.execute("""
            INSERT INTO Lens_Level (level_id, level_name, incentive, n_min_lens_created)
            VALUES (%s, %s, %s, %s)
        """, (level['id'], level['name'], level['incentive'], level['min']))
    print("Inserted Lens_Level data")
else:
    print("Lens_Level data already exists")

# Check if User table is empty before inserting
cursor.execute("SELECT COUNT(*) FROM User")
count = cursor.fetchone()[0]
if count == 0:
    # Insert in User table - Using AUTO_INCREMENT
    for _ in range(MIN_PRIM_DATA):
        email = faker.unique.safe_email()
        password = faker.password()
        username = faker.user_name()
        telp_num = '08' + faker.numerify('#########')
        birthdate = faker.date_of_birth(minimum_age=18, maximum_age=70).strftime('%Y-%m-%d')
        date_created = faker.date_this_decade().strftime('%Y-%m-%d')
        level_id = None

        cursor.execute("""
            INSERT INTO `User` (email, password, username, telp_num, birthdate, date_created, level_id)
            VALUES (%s, %s, %s, %s, %s, %s, %s)
        """, (email, password, username, telp_num, birthdate, date_created, level_id))

        print(f"Inserted user: {username}")
else:
    print("User data already exists")

# Check if Friend table is empty before inserting
cursor.execute("SELECT COUNT(*) FROM Friend")
count = cursor.fetchone()[0]
if count == 0:
    # Fetch user_ids from the User table
    cursor.execute("SELECT user_id FROM User")
    valid_user_ids = copy.deepcopy([row[0] for row in cursor.fetchall()])

    # Ensure that user_id and friend_id exist in the existing_user_ids list
    MIN_DATA_FRIEND = MIN_PRIM_DATA * 2
    inserted_pairs = set()

    for _ in range(MIN_DATA_FRIEND):
        user_id = random.choice(valid_user_ids)
        valid_friend_ids = [uid for uid in valid_user_ids if uid != user_id]
        if not valid_friend_ids:
            break
        friend_id = random.choice(valid_friend_ids)

        # Skip if this pair (in either direction) is already inserted
        if (user_id, friend_id) in inserted_pairs or (friend_id, user_id) in inserted_pairs:
            continue

        # Start date and streak
        start_date = faker.date_this_year().strftime('%Y-%m-%d')
        streak = random.randint(0, 100)

        cursor.execute("INSERT INTO Friend (user_id, friend_id, start_date, streak) VALUES (%s, %s, %s, %s)", 
                      (user_id, friend_id, start_date, streak))
        cursor.execute("INSERT INTO Friend (user_id, friend_id, start_date, streak) VALUES (%s, %s, %s, %s)", 
                      (friend_id, user_id, start_date, streak))
        
        inserted_pairs.add((user_id, friend_id))
        print(f"Inserted friendship: {user_id} <-> {friend_id}")
else:
    print("Friend data already exists")

# Check if Subscription table is empty before inserting
cursor.execute("SELECT COUNT(*) FROM Subscription")
count = cursor.fetchone()[0]
if count == 0:
    # Get all valid user_ids from User table
    cursor.execute("SELECT user_id FROM User")
    valid_user_ids = copy.deepcopy([row[0] for row in cursor.fetchall()])
    
    # Track subscription periods per user to avoid overlaps
    user_subscriptions = {}  # user_id -> list of (subscribe_date, expire_date) tuples
    
    # Insert in Subscription - Using AUTO_INCREMENT
    MIN_DATA_SUBSCRIPTION = MIN_PRIM_DATA * 5
    subscriptions_added = 0
    attempts = 0
    max_attempts = MIN_DATA_SUBSCRIPTION * 2  # Allow for some failed attempts
    
    # Get current date as date object
    current_date = datetime.date.today()
    
    while subscriptions_added < MIN_DATA_SUBSCRIPTION and attempts < max_attempts:
        attempts += 1
        
        # Allow multiple subscriptions per user
        user_id = random.choice(valid_user_ids)
        
        # Generate realistic subscription dates
        subscribe_date_obj = faker.date_this_year()  # This returns a date object
        subscribe_date = subscribe_date_obj.strftime('%Y-%m-%d')
        
        # Make expire_date after subscribe_date (1-12 months later)
        months_to_add = random.randint(1, 12)
        
        # Calculate expire date properly
        year_to_add = (subscribe_date_obj.month + months_to_add - 1) // 12
        new_month = ((subscribe_date_obj.month + months_to_add - 1) % 12) + 1
        
        try:
            expire_date_obj = datetime.date(
                year=subscribe_date_obj.year + year_to_add,
                month=new_month,
                day=subscribe_date_obj.day
            )
        except ValueError:
            # Handle edge case for months with different days
            if new_month == 2:  # February
                last_day = 29 if (subscribe_date_obj.year + year_to_add) % 4 == 0 else 28
            elif new_month in [4, 6, 9, 11]:  # April, June, September, November
                last_day = 30
            else:
                last_day = 31
                
            expire_date_obj = datetime.date(
                year=subscribe_date_obj.year + year_to_add,
                month=new_month,
                day=min(subscribe_date_obj.day, last_day)
            )
            
        expire_date = expire_date_obj.strftime('%Y-%m-%d')
        
        # Check for overlap with existing subscriptions for this user
        has_overlap = False
        if user_id in user_subscriptions:
            for sub_start, sub_end in user_subscriptions[user_id]:
                # Check if dates overlap
                if (subscribe_date_obj <= sub_end and expire_date_obj >= sub_start):
                    has_overlap = True
                    break
        
        if has_overlap:
            continue  # Skip this subscription and try again
            
        # Status: 1 for active, 0 for expired
        status = 1 if expire_date_obj >= current_date else 0
        
        # Add to our tracking dictionary
        if user_id not in user_subscriptions:
            user_subscriptions[user_id] = []
        user_subscriptions[user_id].append((subscribe_date_obj, expire_date_obj))
        
        cursor.execute("""
            INSERT INTO Subscription (user_id, subscribe_date, expire_date, status)
            VALUES (%s, %s, %s, %s)
        """, (user_id, subscribe_date, expire_date, status))
        
        subscriptions_added += 1
    
    print(f"Inserted {subscriptions_added} Subscription records")
else:
    print("Subscription data already exists")

# Check if Room_Join table is empty before inserting
cursor.execute("SELECT COUNT(*) FROM Room_Join")
count = cursor.fetchone()[0]
if count == 0:
    # Get all valid room_ids from room_chat table
    cursor.execute("SELECT room_id FROM Room_Chat")
    valid_room_ids = copy.deepcopy([row[0] for row in cursor.fetchall()])
    cursor.execute("SELECT user_id FROM User")
    valid_user_ids = copy.deepcopy([row[0] for row in cursor.fetchall()])

    # Insert in Room_Join
    MIN_ROOM_JOIN = MULTIPLIER_FOREIGN_DATA * 2
    
    # Ensure each room has at least one member (room can't be empty)
    for room_id in valid_room_ids:
        if not valid_user_ids:
            break
        user_id = random.choice(valid_user_ids)
        join_date = faker.date_this_year().strftime('%Y-%m-%d')

        cursor.execute("""
            INSERT INTO Room_Join (room_id, user_id, join_date) VALUES (%s, %s, %s)
        """, (room_id, user_id, join_date))
        
    # Add more room joins
    for _ in range(MIN_ROOM_JOIN - len(valid_room_ids)):
        if not valid_user_ids:
            break
        room_id = random.choice(valid_room_ids)
        user_id = random.choice(valid_user_ids)
        
        # Check if this room-user pair already exists
        cursor.execute("SELECT COUNT(*) FROM Room_Join WHERE room_id = %s AND user_id = %s", (room_id, user_id))
        if cursor.fetchone()[0] > 0:
            continue
            
        join_date = faker.date_this_year().strftime('%Y-%m-%d')

        cursor.execute("""
            INSERT INTO Room_Join (room_id, user_id, join_date) VALUES (%s, %s, %s)
        """, (room_id, user_id, join_date))
    print("Inserted Room_Join data")
else:
    print("Room_Join data already exists")

# Check if Lens table is empty before inserting
cursor.execute("SELECT COUNT(*) FROM Lens")
count = cursor.fetchone()[0]
if count == 0:
    cursor.execute("SELECT user_id FROM User")
    valid_user_ids = copy.deepcopy([row[0] for row in cursor.fetchall()])

    # fill level id = 0 for a random user in Lens relation
    user_id = random.choice(valid_user_ids)
    for _ in range(1):
        lens_name = faker.word() + "Lens"
        cursor.execute("""
            INSERT INTO Lens (user_id, name, release_date)
            VALUES (%s, %s, %s)
        """, (user_id, lens_name, faker.date_this_year().strftime('%Y-%m-%d')))

    # fill level id = 1 for a random user in Lens relation
    user_id = random.choice(valid_user_ids)
    for _ in range(13):
        lens_name = faker.word() + "Lens"
        cursor.execute("""
            INSERT INTO Lens (user_id, name, release_date)
            VALUES (%s, %s, %s)
        """, (user_id, lens_name, faker.date_this_year().strftime('%Y-%m-%d')))

    # fill level id = 2 for a random user in Lens relation
    user_id = random.choice(valid_user_ids)
    for _ in range(22):
        lens_name = faker.word() + "Lens"
        cursor.execute("""
            INSERT INTO Lens (user_id, name, release_date)
            VALUES (%s, %s, %s)
        """, (user_id, lens_name, faker.date_this_year().strftime('%Y-%m-%d')))

    # fill level id = 3 for a random user in Lens relation
    user_id = random.choice(valid_user_ids)
    for _ in range(31):
        lens_name = faker.word() + "Lens"
        cursor.execute("""
            INSERT INTO Lens (user_id, name, release_date)
            VALUES (%s, %s, %s)
        """, (user_id, lens_name, faker.date_this_year().strftime('%Y-%m-%d')))

    # Insert Lens
    MIN_LENS_DATA = MULTIPLIER_FOREIGN_DATA
    for _ in range(MIN_LENS_DATA):
        lens_name = faker.word() + "Lens"
        user_id = random.choice(valid_user_ids)
        release_date = faker.date_this_year().strftime('%Y-%m-%d')

        cursor.execute("""
            INSERT INTO Lens (user_id, name, release_date)
            VALUES (%s, %s, %s)
        """, (user_id, lens_name, release_date))

    # Edit user based on how much lens each of them own
    cursor.execute("SELECT user_id, COUNT(lens_id) FROM Lens GROUP BY user_id")
    results = cursor.fetchall()
    for user_id, lens_count in results:
        if lens_count == 0:
            cursor.execute("UPDATE User SET level_id = null WHERE User.user_id = %s", (user_id, ))
        elif 1 <= lens_count < 10:
            cursor.execute("UPDATE User SET level_id = 0 WHERE User.user_id = %s", (user_id, ))
        elif 10 <= lens_count < 20:
            cursor.execute("UPDATE User SET level_id = 1 WHERE User.user_id = %s", (user_id, ))
        elif 20 <= lens_count < 30:
            cursor.execute("UPDATE User SET level_id = 2 WHERE User.user_id = %s", (user_id, ))
        elif 30 <= lens_count:
            cursor.execute("UPDATE User SET level_id = 3 WHERE User.user_id = %s", (user_id, ))
    print("Inserted Lens data and updated user levels")
else:
    print("Lens data already exists")

# Check if Content, Chat, and Pap tables are empty before inserting
cursor.execute("SELECT COUNT(*) FROM Content")
count = cursor.fetchone()[0]
if count == 0:
    # Get all valid lens_id from LENS table
    cursor.execute("SELECT lens_id FROM Lens")
    valid_lens_ids = copy.deepcopy([row[0] for row in cursor.fetchall()])
    cursor.execute("SELECT user_id FROM User")
    valid_user_ids = copy.deepcopy([row[0] for row in cursor.fetchall()])
    cursor.execute("SELECT room_id FROM Room_Chat")
    valid_room_ids = copy.deepcopy([row[0] for row in cursor.fetchall()])

    # Insert Pap, Content, Chat, Add_On, Image, Caption
    MIN_CONTENT_DATA = MULTIPLIER_FOREIGN_DATA * 2
    
    # Create a dictionary to track sent_order for each user-room combination
    sent_order_tracker = {}
    
    for i in range(MIN_CONTENT_DATA):
        user_id = random.choice(valid_user_ids)
        room_id = random.choice(valid_room_ids)
        
        # Make sure the user is a member of the room
        cursor.execute("SELECT COUNT(*) FROM Room_Join WHERE room_id = %s AND user_id = %s", (room_id, user_id))
        if cursor.fetchone()[0] == 0:
            # If user is not a member, add them to the room
            join_date = faker.date_this_year().strftime('%Y-%m-%d')
            cursor.execute("INSERT INTO Room_Join (room_id, user_id, join_date) VALUES (%s, %s, %s)", 
                          (room_id, user_id, join_date))
        
        # Get the next sent_order for this user-room
        key = f"{user_id}-{room_id}"
        sent_order = sent_order_tracker.get(key, 0) + 1
        sent_order_tracker[key] = sent_order
        
        send_time = faker.date_time_this_year()

        cursor.execute("""
            INSERT INTO Content (user_id, room_id, sent_order, send_time, is_exists)
            VALUES (%s, %s, %s, %s, %s)
        """, (user_id, room_id, sent_order, send_time, 1))

        # divide the content into two section
        if (random.randint(0, 1) == 1):  # create chat
            # Insert Chat
            message = faker.sentence()
            cursor.execute("""
                INSERT INTO Chat (user_id, room_id, sent_order, message)
                VALUES (%s, %s, %s, %s)
            """, (user_id, room_id, sent_order, message))
        else:  # create pap
            # Insert Pap
            lens_id = random.choice(valid_lens_ids)
            content_type = random.choice(['photo', 'video'])
            # Set duration based on content_type (0 for photos, positive for videos)
            duration = 0 if content_type == 'photo' else random.randint(1, 60)
            cursor.execute("""
                INSERT INTO Pap (user_id, room_id, sent_order, lens_id, content_type, duration)
                VALUES (%s, %s, %s, %s, %s, %s)
            """, (user_id, room_id, sent_order, lens_id, content_type, duration))
        
            # Insert Add-On or not
            if (random.randint(0, 1) == 0):
                continue
            else:  # if one, then add add-on
                n_image = random.randint(0, 10)
                n_caption = random.randint(0, 10)
                addon_idx = 1

                for _ in range(n_image):
                    # Insert Add_On
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
                    addon_idx += 1

                for _ in range(n_caption):
                    # Insert Add_On
                    x_start = random.randint(0, 200)
                    x_end = x_start + random.randint(10, 100)
                    y_start = random.randint(0, 200)
                    y_end = y_start + random.randint(10, 100)
                    cursor.execute("""
                        INSERT INTO Add_On (user_id, room_id, sent_order, addon_idx, x_start, x_end, y_start, y_end)
                        VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
                    """, (user_id, room_id, sent_order, addon_idx, x_start, x_end, y_start, y_end))

                    # Insert Caption
                    font_style = random.choice(['Arial', 'Verdana', 'Comic Sans'])
                    text = faker.sentence()
                    cursor.execute("""
                        INSERT INTO Caption (user_id, room_id, sent_order, addon_idx, font_style, text)
                        VALUES (%s, %s, %s, %s, %s, %s)
                    """, (user_id, room_id, sent_order, addon_idx, font_style, text))
                    addon_idx += 1
    print("Inserted Content, Chat, Pap, Add_On, Image, and Caption data")
else:
    print("Content data already exists")

# Check if Lens_Type table is empty before inserting
cursor.execute("SELECT COUNT(*) FROM Lens_Type")
count = cursor.fetchone()[0]
if count == 0:
    # Get valid lens IDs
    cursor.execute("SELECT lens_id FROM Lens")
    valid_lens_ids = copy.deepcopy([row[0] for row in cursor.fetchall()])
    
    # Insert Lens_Type — implementing "Both", "Not Both" logic
    lens_types = ['Face', 'Background']
    
    for lens_id in valid_lens_ids:
        # Randomly decide if lens is 'Both', 'Face', 'Background', or 'Not Both'
        lens_category = random.choice(['Both', 'Face', 'Background', 'Not Both'])
        
        if lens_category == 'Both':
            # Insert both Face and Background types
            for lens_type in lens_types:
                cursor.execute("""
                    INSERT INTO Lens_Type (lens_id, type)
                    VALUES (%s, %s)
                """, (lens_id, lens_type))
        elif lens_category == 'Face' or lens_category == 'Background':
            # Insert just one type
            cursor.execute("""
                INSERT INTO Lens_Type (lens_id, type)
                VALUES (%s, %s)
            """, (lens_id, lens_category))
        # If 'Not Both', don't insert any type (lens has no type)
    print("Inserted Lens_Type data")
else:
    print("Lens_Type data already exists")

# Check if Location table is empty before inserting
cursor.execute("SELECT COUNT(*) FROM Location")
count = cursor.fetchone()[0]
if count == 0:
    cursor.execute("SELECT user_id FROM User")
    valid_user_ids = copy.deepcopy([row[0] for row in cursor.fetchall()])

    # Insert Location
    MIN_LOCATION_DATA = MIN_PRIM_DATA
    for _ in range(MIN_LOCATION_DATA):
        user_id = random.choice(valid_user_ids)
        
        # Generate new entry time and location
        start_time = faker.date_time_this_year()
        end_time = start_time + faker.time_delta(end_datetime='+2h')
        latitude = round(random.uniform(-90.0, 90.0), 6)
        longitude = round(random.uniform(-180.0, 180.0), 6)
        status = random.choice(['public', 'private'])

        # Fetch existing location entries for the user
        cursor.execute(f"SELECT start_time, end_time, latitude, longitude FROM Location WHERE user_id = {user_id}")
        existing_locations = cursor.fetchall()

        # Check for overlap
        conflict = False
        for s_time, e_time, lat, lon in existing_locations:
            if lat == latitude and lon == longitude:
                if (s_time <= start_time <= e_time) or (s_time <= end_time <= e_time):
                    conflict = True
                    break

        if not conflict:
            cursor.execute("""
                INSERT INTO Location (user_id, start_time, end_time, latitude, longitude, status)
                VALUES (%s, %s, %s, %s, %s, %s)
            """, (user_id, start_time.strftime('%Y-%m-%d %H:%M:%S'), end_time.strftime('%Y-%m-%d %H:%M:%S'), 
                latitude, longitude, status))
    print("Inserted Location data")
else:
    print("Location data already exists")

# Commit and close
conn.commit()
cursor.close()
conn.close()

print("Data insertion complete.")