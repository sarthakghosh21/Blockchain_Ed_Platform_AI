import sqlite3

def view_users():
    conn = sqlite3.connect(r'C:\Users\sarth\OneDrive\Desktop\New folder\instance\users.db')  # Connect to the database
    cursor = conn.cursor()

    # Query to select all users
    cursor.execute("SELECT * FROM user")

    # Fetch all the records
    users = cursor.fetchall()

    for user in users:
        print(user)  # Print each user record

    conn.close()

# Call the function to view users
view_users()
