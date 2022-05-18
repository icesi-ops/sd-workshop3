from flask import Flask
from redis import Redis
import os

app = Flask(__name__)
host = os.environ.get('python-redis')
redis = Redis(host=host , port=6379)

@app.route('/')
def hello():
    count = redis.incr('hits')
    return 'Hello World! I have been seen {} times.\n'.format(count)
if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True)