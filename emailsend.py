import os
from os.path import exists
from pathlib import Path
import sys
import json
import smtplib, ssl
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from email.mime.base import MIMEBase
from email import encoders

#----ATTACHMENT-----
def attachmentexists():
    fileObject = open("emaildata.json", "r")
    jsonContent = fileObject.read()
    xemaildata = json.loads(jsonContent)
    xxsender = str(xemaildata['xsender_email'])
    xxpassword = str(xemaildata['xpassword'])
    xxsmtplogin = str(xemaildata['xsmtplogin'])
    xxsmtpserver = str(xemaildata['xsmtpserver'])
    xxsmtpport = str(xemaildata['xsmtpport'])
    xxreceiver = str(xemaildata['xreceiver_email'])
    xxsubject = str(xemaildata['xsubject'])
    xxmessage = str(xemaildata['xmessage'])    
    xxattachment = str(xemaildata['xattachment'])
    
    body = xxmessage
    message = MIMEMultipart()
    message['From'] = xxsender
    message['To'] = xxreceiver
    message['Subject'] = xxsubject
    message.attach(MIMEText(body, 'plain'))
    files = [xxattachment]
    for file in files:
        with open(file, 'rb') as f:
            payload = MIMEBase('application', 'octate-stream')
            payload.set_payload((f).read())
            encoders.encode_base64(payload)         
            payload.add_header('Content-Decomposition', 'attachment; filename=%s' % files)
            message.attach(payload)

    text = message.as_string()
    context = ssl.create_default_context()

    with smtplib.SMTP(xxsmtpserver, xxsmtpport) as server:
        server.starttls()
        server.login(xxsmtplogin, xxpassword)
        server.sendmail(xxsender, xxreceiver, text)
        server.quit()

#----NO ATTACHMENT-----
def attachmentnoexists():
    fileObject = open("emaildata.json", "r")
    jsonContent = fileObject.read()
    xemaildata = json.loads(jsonContent)
    xxsender = str(xemaildata['xsender_email'])
    xxpassword = str(xemaildata['xpassword'])
    xxsmtplogin = str(xemaildata['xsmtplogin'])
    xxsmtpserver = str(xemaildata['xsmtpserver'])
    xxsmtpport = str(xemaildata['xsmtpport'])
    xxreceiver = str(xemaildata['xreceiver_email'])
    xxsubject = str(xemaildata['xsubject'])
    xxmessage = str(xemaildata['xmessage'])    
    
    body = xxmessage
    message = MIMEMultipart()
    message['From'] = xxsender
    message['To'] = xxreceiver
    message['Subject'] = xxsubject
    message.attach(MIMEText(body, "plain"))
    text = message.as_string()
    context = ssl.create_default_context()

    with smtplib.SMTP(xxsmtpserver, xxsmtpport) as server:
        server.starttls()
        server.login(xxsmtplogin, xxpassword)
        server.sendmail(xxsender, xxreceiver, text)
        server.quit()
    
#-------------START--------------april 19 2022----------------------------------

fileObject = open("emaildata.json", "r")
jsonContent = fileObject.read()
xemaildata = json.loads(jsonContent)

if "xattachment" in xemaildata:
    attachmentexists()
else:
    attachmentnoexists()

