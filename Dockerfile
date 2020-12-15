FROM python:3.7-slim


WORKDIR /usr/src/app
COPY . .

RUN addgroup --system user && adduser --system --no-create-home --group user
RUN chown -R user:user /usr/src/app && chmod -R 755 /usr/src/app

ENV DASH_DEBUG_MODE True
RUN set -ex && \
    pip install -r requirements.txt

EXPOSE 5000
CMD ["python", "run.py"]