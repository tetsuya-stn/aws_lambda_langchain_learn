FROM public.ecr.aws/lambda/python:3.10

COPY notify_slack.py ${LAMBDA_TASK_ROOT}

RUN pip install --upgrade pip

CMD [ "notify_slack.handler" ]
