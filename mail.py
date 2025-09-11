from dotenv import load_dotenv

import os
import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from email.mime.application import MIMEApplication



def get_env(*names):
    for n in names:
        v = os.getenv(n)
        if v:
            return v
    return None
    

load_dotenv(dotenv_path="config.env")
#email=os.getenv("email")
email=get_env('email','Email','EMAIL')
reciever_email=get_env('to_email','To_email','TO_EMAIL','Email_to')
email_password=get_env('email_password','password','PASSWORD','EMAIL,PASSWORD','Email_password')
subject=get_env('subject','Subject')
body=get_env('body','BODY')
provider=get_env('smtp_provider','SMTP_PROVIDER','Gmail')

print(f"Email user:{email} \n password: {email_password} \n subject:{subject}\n body: {body}\nprovider: {provider}\n reciever_email: {reciever_email}")

msg=MIMEMultipart()
msg['From'] = email
msg['To'] = reciever_email
msg['Subject'] = subject

msg.attach(MIMEText(body, 'plain'))

with open('health.logs', 'r', encoding='utf-8') as f:
    log_content = f.read()
    part = MIMEText(log_content, 'plain')
    part.add_header('Content-Disposition', 'attachment', filename='health.logs')
    msg.attach(part)

with smtplib.SMTP('smtp.gmail.com', 587) as server:
    server.starttls()
    server.login(email, email_password)
    server.sendmail(msg['From'], msg['To'], msg.as_string())