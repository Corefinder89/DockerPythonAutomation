#! /usr/bin/python
from pyvirtualdisplay import Display
from selenium import webdriver

display = Display(visible=0, size=(1024, 768))
display.start()
print ">>>Display started"
geckodriver = '/usr/local/bin/geckodriver'
browser = webdriver.Firefox(executable_path=geckodriver)
print ">>>geckodriver path set"
browser.get('http://www.google.com')
print ">>>URL traced"
print browser.title
browser.quit()
display.stop()
