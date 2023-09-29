import json
import os
import urllib3
http = urllib3.PoolManager()

def handler(event, context):
    send_slack_notification(event)
    return event

def send_slack_notification(event):
    slack_channel = os.getenv("SLACK_CHANNEL")
    webhook_url   = os.getenv("WEBHOOK_URL")

    text = {
        "channel": slack_channel,
        "username": "LangChain Bot",
        "text": event["body"],
        "icon_emoji": ""
    }

    encoded_text = json.dumps(text).encode('utf-8')
    response = http.request('POST', webhook_url, body=encoded_text)

    print({
        "status_code": response.status,
        "data": response.data
    })

