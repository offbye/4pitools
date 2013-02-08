#!/usr/bin/python
# -*- coding: utf-8 -*-

import email
import mimetypes
from email.MIMEMultipart import MIMEMultipart
from email.MIMEText import MIMEText
from email.MIMEImage import MIMEImage
import smtplib
import getopt
import sys

def sendEmail(authInfo, fromAdd, toAdd, subject, plainText, htmlText,picture):

    server = authInfo.get('server')
    user = authInfo.get('user')
    passwd = authInfo.get('passwd')

    if not (server and user and passwd) :
        print 'need set server and user and passwd '
        return False 

    msgRoot = MIMEMultipart('related')
    msgRoot['Subject'] = subject
    msgRoot['From'] = fromAdd
    msgRoot['To'] =  ', '.join( toAdd )
    msgRoot.preamble = 'This is a multi-part message in MIME format.'

    msgAlternative = MIMEMultipart('alternative') 
    msgRoot.attach(  msgAlternative )

    if plainText:
        msgText = MIMEText(plainText, 'plain','utf-8')
        msgAlternative.attach(msgText)

    if htmlText:
        msgText = MIMEText(htmlText, 'html','utf-8')
        msgAlternative.attach(msgText)

    #if need send picture .
    if picture:
        fp = open(picture, 'rb') 
        msgImage = MIMEImage(fp.read())
        fp.close()
        msgImage.add_header('Content-ID','<image1>')
        msgRoot.attach(msgImage)

    smtp = smtplib.SMTP()
    smtp.set_debuglevel(0)
    try:
        smtp.connect(server)
        smtp.login(user, passwd)
        smtp.sendmail( msgRoot['From'], toAdd , msgRoot.as_string())
        smtp.quit()
    except Exception,ex: 
        print ex 
        return False 
    return True 

def main(argv):
    opts, args = getopt.getopt(argv, "hg:d", ["help", "user=","passwd="])
    print opts[1]
    fromAdd = defaultAuth['user'] 
    toAdd   = ['']
    subject = ''
    plainText = ''
    htmlText=''
    picture=''
    #sendEmail(defaultAuth, fromAdd, toAdd, subject, plainText, htmlText,picture)

defaultAuth = {'server': 'smtp.163.com' , 'user':'yourname@163.com' , 'passwd': 'yourpasswd' }

if __name__ == '__main__' :
    main(sys.argv[1:])
