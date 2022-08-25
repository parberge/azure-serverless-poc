from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello Mojang!"

@app.route("/version")
def version():
    return "1.0.0"

if __name__ == "__main__":
    app.run(debug=True,host='0.0.0.0',port=5000)