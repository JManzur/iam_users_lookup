import re
import boto3
import logging, os

logger = logging.getLogger()
logger.setLevel(logging.INFO)

iam = boto3.client('iam')

def lambda_handler(event, context):
    logger.info(f'event: {event}')
    lookup_string = event['lookup_string']

    response = iam.list_users()
    user_list = []
    try:
        for user in response['Users']:
            UserName = user['UserName']
            Arn = user['Arn']
        
            if re.search(lookup_string, UserName, re.IGNORECASE):
                iam_user = {
                    'UserName': '{}'.format(UserName),
                    'Arn': '{}'.format(Arn)
                }
                user_list.append(iam_user)
    
        return user_list

    except Exception as error:
        logger.error(error)
        return {
            'statusCode': 400,
            'message': 'An error has occurred',
			'moreInfo': {
				'Lambda Request ID': '{}'.format(context.aws_request_id),
				'CloudWatch log stream name': '{}'.format(context.log_stream_name),
				'CloudWatch log group name': '{}'.format(context.log_group_name)
				}
			}