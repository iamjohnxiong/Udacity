from twilio.rest import Client

# Your Account SID from twilio.com/console
account_sid = "AC08ad45f61e74f513ba1e18bc9a36ed97"
# Your Auth Token from twilio.com/console
auth_token  = "a7431f5db14216dd7bbdf6ca571ce72d"

client = Client(account_sid, auth_token)

message = client.messages.create(
    to="+15172568382", 
    from_="+15172539051",
    body="Hello world. This is John Xiong")

print(message.sid)
