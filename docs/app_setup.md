# 🛠️ Day 7 – Flask Web App Setup on EC2

**Date:** 2025-07-10  
**Goal:** Deploy a minimal Flask app on an EC2 instance and access it via curl and browser.

---

##  What I Did

### 1. SSH into EC2
```bash
ssh -i /path/to/key.pem ubuntu@<your-ec2-public-ip>
```

---

### 2. Install Python and Set Up Virtual Environment
```bash
sudo apt update
sudo apt install -y python3 python3-pip python3-venv

python3 -m venv venv
source venv/bin/activate
```

---

### 3. Install Flask in Virtual Environment
```bash
pip install flask
```

---

### 4. Create a Minimal Flask App
```bash
mkdir flask-app && cd flask-app
vim app.py
```

Contents of `app.py`:
```python
from flask import Flask
app = Flask(__name__)

@app.route("/")
def home():
    return "Hello from Flask on EC2!"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
```

---

### 5. Run the App
```bash
cd ~/flask-app
source ~/venv/bin/activate
python app.py
```

Output:
```
* Running on all addresses (0.0.0.0)
* Running on http://127.0.0.1:5000
* Running on http://<private-ip>:5000
```

---

## 🧪 Testing the App

### Local Test on EC2
```bash
curl localhost:5000
```
Output:
```
Hello from Flask on EC2!
```

### Public Test via Browser
Visit:
```
http://<your-ec2-public-ip>:5000
```
Output in browser:
```
Hello from Flask on EC2!
```

---

## EC2 Security Group

- Inbound Rule added to allow:
  - **Port**: 5000
  - **Protocol**: TCP
  - **Source**: 0.0.0.0/0 (open to all)

---

## Troubleshooting

### Problem: `pip3 install flask` failed with “externally-managed-environment” error

When I first tried to install Flask using:

```bash
pip3 install flask
```

I got an error like:

```
error: externally-managed-environment
This environment is externally managed...

```

### Cause

Modern Ubuntu (and Debian-based) systems use **PEP 668**, which blocks pip from installing packages globally to protect system-level Python dependencies.

---

### Solution: Use a Virtual Environment

I fixed this by creating and using a virtual environment:

```bash
sudo apt install -y python3-venv       # Install venv tools
python3 -m venv venv                   # Create isolated environment
source venv/bin/activate               # Activate it
pip install flask                      # Now works without issue
```

This created a sandboxed environment where I could safely install Flask without touching the system’s Python setup.

> Lesson learned: Always use a virtual environment for Python apps — especially on servers.


## Notes & Takeaways

- I had to use a virtual environment because `pip install flask` was blocked globally (PEP 668).
- The app runs using Flask’s built-in development server, which is fine for testing but not meant for real-world use.
- I don't know how Flask is deployed in production yet, but I’ll learn about that in future stages (probably using tools like Gunicorn or Nginx).

