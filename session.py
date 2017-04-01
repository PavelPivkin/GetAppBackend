sessions = {}

def login(username):
    if (sessions.get(username) is not None):
        return sessions[username]
    else:
        sessions[username] = str(os.urandom())
        return sessions[username]

def logout(username):
    sessions[username] = None


