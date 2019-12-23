# coding:utf-8

import linecache
import sys
import tweepy

args = sys.argv

# Create twitter objects
auth = tweepy.OAuthHandler(args[1], args[2])
auth.set_access_token(args[3], args[4])
api = tweepy.API(auth)

# Create message body
module = linecache.getline('module.txt', int(1))
module = module.replace('"', '')
module = module.replace('\n', '')

short_description = linecache.getline('short_description.txt', int(1))
short_description = short_description.replace('"', '')

supported_by = linecache.getline('supported_by.txt', int(1))
supported_by = supported_by.replace('"', '')

version_added = linecache.getline('version_added.txt', int(1))
version_added = version_added.replace('"', '')

url = 'https://docs.ansible.com/ansible/latest/modules/' + module + '_module.html'

message = ('Ansibleモジュール紹介' + '\n\n' + module + '\n\n' + short_description + 
           '\n' + 'supported_by: ' + supported_by + '\n' + 'version_added: ' + 
           version_added + '\n' + url)

print(message)

api.update_status(message)
