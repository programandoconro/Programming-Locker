from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return "Análisis de data COVID19 en tiempo real !"

if __name__ == "__main__":
    app.run()
