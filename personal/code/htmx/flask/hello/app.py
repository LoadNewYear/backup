from flask import Flask, render_template, request

app = Flask(__name__)

# Global variables
todo = []

# Main
@app.route('/')
def index():
    return render_template('index.html')

# Add task
@app.route('/todos', methods=['GET', 'POST'])
def todos():
    if request.method == 'POST':
        task = request.form.get('taskInput')
        todo.append(task)
    return render_template('todo.html', todo=todo)

# Remove task
@app.route('/removeTask', methods=['POST'])
def removeTask():
    try:
        todo.remove(request.form.get('removeTaskInput'))
    except ValueError:
        pass
    return render_template('todo.html', todo=todo)
