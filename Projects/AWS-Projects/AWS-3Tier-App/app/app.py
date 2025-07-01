from flask import Flask
import psycopg2

app = Flask(__name__)

@app.route('/')
def index():
    try:
        conn = psycopg2.connect(
            host="threetier-db.c6b2i0cekgt0.us-east-1.rds.amazonaws.com",
            database="postgres",
            user="<username>",
            password="<pwd>",
            sslmode="require"
        )
        return "✅ Connected to RDS!"
    except Exception as e:
        return f"❌ Failed to connect: {e}"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)

