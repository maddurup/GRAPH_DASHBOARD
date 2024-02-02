from flask import Flask, render_template, request, url_for, g
from werkzeug.utils import secure_filename
import jinja2
from sys import path
from os import getcwd
import os
# path.append(getcwd())
print(path)

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/graphs')
def graphs():
    return render_template('graphs.html') 

@app.route('/search')
def search():
    return render_template('search.html')

@app.route('/about') 
def about():
    return render_template('about.html')

if __name__ == '__main__':
    app.run(host = '0.0.0.0', debug=True)