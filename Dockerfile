FROM python:3.10-slim


COPY requirements.txt app/requirements.txt
WORKDIR /app
RUN pip install -r /app/requirements.txt
COPY ./source /app/src
RUN mkdir /pretrained


RUN ["python", "src/setup_model.py"]

EXPOSE 8000

CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8000"]