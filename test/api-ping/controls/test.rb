# encoding: utf-8
# copyright: 2018, The Authors

title 'api ping'

describe http('https://time-csa1.celidor.uk/test/ping') do
  its ('status') {should cmp 200}
  its('body') { should match 'message' }
  its('body') { should match 'Hello, the current time is' }
  its('headers.Content-Type') { should cmp 'application/json' }

end
