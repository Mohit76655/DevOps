#!/bin/bash

# User Management Script

echo "User Management Script"

while true; do
    echo ""
    echo "Please select an option:"
    echo "1. Add a new user"
    echo "2. Delete a user"
    echo "3. List all users"
    echo "4. Exit"

    read -p "Enter your choice: " choice
    echo ""

    case $choice in
        1)
            read -p "Enter username: " username
            # Check if user already exists
            if id "$username" &>/dev/null; then
                echo "User $username already exists."
            else
                sudo useradd -m "$username"
                echo "User $username added successfully."
            fi
            ;;
        2)
            read -p "Enter username to delete: " username
            # Check if user exists
            if id "$username" &>/dev/null; then
                sudo userdel -r "$username"
                echo "User $username deleted successfully."
            else
                echo "User $username does not exist."
            fi
            ;;
        3)
            echo "List of users:"
            cut -d: -f1 /etc/passwd
            ;;
        4)
            echo "Exiting."
            break
            ;;
        *)
            echo "Invalid choice. Please enter a number between 1 and 4."
            ;;
    esac
done
