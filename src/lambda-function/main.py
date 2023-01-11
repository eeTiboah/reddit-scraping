
import praw
import pandas as pd
import boto3

def handler(event, context):

    ssm = boto3.client('ssm')
    client_id = ssm.get_parameter(Name='/reddit/client/id', WithDecryption=True)        
    secret_key = ssm.get_parameter(Name='/reddit/secret/key', WithDecryption=True)        
    user_agent = ssm.get_parameter(Name='/reddit/user/agent', WithDecryption=True)        

    reddit = praw.Reddit(
    client_id=client_id,
    client_secret=secret_key,
    user_agent=user_agent,
    )

    posts=[]

    hot_posts = reddit.subreddit('MachineLearning').hot(limit=10)
    for post in hot_posts:
        posts.append(post.title)

    response = {
        "statusCode": 200,
        "body": posts[0]
    }
    return response