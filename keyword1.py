from datetime import datetime

def create_fake_item_name():
    timestamp = datetime.timestamp(datetime.now())

    return f"item_{timestamp}"

def create_fake_project_name():
    timestamp = datetime.timestamp(datetime.now())

    return f"project_{timestamp}"

def create_fake_user_Name():
    timestamp = datetime.timestamp(datetime.now())

    return f"user_{timestamp}"

def CreateAfake():
    timestamp = datetime.timestamp(datetime.now())

    return f"fake_{timestamp}"

# type: ignore # if __name__ == "__main__":
#     print(create_fake_item_name())
#     print(create_fake_project_name())
#     print(create_fake_user_name())