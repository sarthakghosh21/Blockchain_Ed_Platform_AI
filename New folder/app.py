from flask import Flask, render_template, request, redirect, flash, url_for, session, send_file
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.exc import IntegrityError
import random
import string
from reportlab.lib.pagesizes import letter
from reportlab.pdfgen import canvas
import os
from datetime import datetime
import requests
import openai
from dotenv import load_dotenv
load_dotenv()



app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///users.db'
app.config['SECRET_KEY'] = 'your_secret_key'
db = SQLAlchemy(app)


openai.api_key = os.getenv("OPENAI_API_KEY")

@app.route("/chatbot", methods=["POST"])
def chatbot():
    data = request.json
    user_message = data.get("message", "")

    try:
        response = openai.ChatCompletion.create(
            model="gpt-3.5-turbo",
            messages=[
                {"role": "system", "content": "You are a helpful AI tutor for blockchain education."},
                {"role": "user", "content": user_message}
            ]
        )
        bot_message = response["choices"][0]["message"]["content"]
        return {"response": bot_message}
    except Exception as e:
        return {"response": f"Sorry, I couldn't get a response. {str(e)}"}



import openai

@app.route("/chat", methods=["POST"])
def chat():
    data = request.get_json()
    message = data["message"]

    try:
        # Call OpenAI or any other chatbot API
        openai.api_key = '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'
        response = openai.Completion.create(
            engine="text-davinci-003",  # or any other engine you want
            prompt=message,
            max_tokens=150
        )

        bot_reply = response.choices[0].text.strip()
        return {"response": bot_reply}

    except Exception as e:
        print(f"Error: {e}")
        return {"response": "Error getting response."}, 500



class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.String(100), unique=True, nullable=False)
    new_user = db.Column(db.Boolean, default=True)

@app.route("/", methods=["GET", "POST"])
def home():
    if request.method == "POST":
        email = request.form["email"]
        if not email.endswith("@slopewallet.com"):
            flash("Only @slopewallet.com emails are allowed", "danger")
            return redirect(url_for("home"))

        user = User.query.filter_by(email=email).first()
        if user:
            user.new_user = False
            db.session.commit()
            flash("Welcome back", "success")
        else:
            new_user = User(email=email, new_user=True)
            db.session.add(new_user)
            try:
                db.session.commit()
                flash("Welcome to the portal, happy learning", "success")
            except IntegrityError:
                db.session.rollback()
                flash("Something went wrong. Please try again.", "danger")

        session['user_email'] = email  # Store user email in the session
        return redirect(url_for("welcome"))
    return render_template("home.mako")

@app.route("/welcome")
def welcome():
    return render_template("welcome.mako")

@app.route("/admin")
def admin():
    users = User.query.all()
    return render_template("admin.mako", users=users)

@app.route("/courses")
def courses():
    return render_template("courses.mako")

@app.route('/quiz', methods=['GET', 'POST'])
def quiz():
    if request.method == 'POST':
        # Get the answers from the form (assuming you have a form with radio buttons)
        answer1 = request.form.get('q1')

        # Here you can check if the user passed the quiz. For simplicity, let's assume they always pass.
        passed = True

        if passed:
            # If the user passed, generate a certificate.
            return redirect(url_for('certificate'))  # Redirect to the certificate page

    return render_template('quiz.mako')  # Display the quiz page

@app.route('/certificate', methods=['GET'])
def certificate():
    # Retrieve the email from the session
    user_email = session.get('user_email')

    if user_email:
        # Query the user from the database using the email stored in the session
        user = User.query.filter_by(email=user_email).first()
        
        if user:
            user_name = user.email.split('@')[0]  # For example, we take the part before '@' as the user's name
        else:
            user_name = "Unknown User"  # Fallback if user not found in the database
    else:
        user_name = "Guest"  # In case the session does not have user_email

    # Generate the certificate ID in the format XXX-XXX-XXX
    certificate_id = generate_certificate_id()

    # Generate the certificate PDF
    pdf_path = generate_pdf_certificate(user_name, certificate_id)
    
    return send_file(pdf_path, as_attachment=True)

def generate_certificate_id():
    """Generates a random certificate ID in the format XXX-XXX-XXX"""
    return '-'.join([''.join(random.choices(string.ascii_uppercase + string.digits, k=3)) for _ in range(3)])

def generate_pdf_certificate(user_name, certificate_id):
    """Generate the PDF certificate and save it as a file"""
    certificate_file_path = f"certificates/{certificate_id}.pdf"
    
    if not os.path.exists('certificates'):
        os.makedirs('certificates')

    c = canvas.Canvas(certificate_file_path, pagesize=letter)
    c.setFont("Helvetica", 20)

    c.drawString(100, 750, "Certificate of Completion")
    c.setFont("Helvetica", 16)
    c.drawString(100, 700, f"Presented to: {user_name}")
    c.drawString(100, 675, f"Certificate ID: {certificate_id}")
    c.drawString(100, 650, f"Date: {datetime.now().strftime('%Y-%m-%d')}")  # Current date

    c.save()

    return certificate_file_path

if __name__ == "__main__":
    with app.app_context():
        db.create_all()  # Ensure database tables are created
    app.run(debug=True)
