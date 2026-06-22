FROM python:3.14-slim

RUN apt-get update && apt-get install -y git curl && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

RUN pip install poetry

COPY pyproject.toml poetry.lock ./

RUN poetry config virtualenvs.create false

RUN poetry install --no-root

COPY . .

RUN python -m ipykernel install --user --name quant-template --display-name "Python (Quant Template)"

CMD ["bash"]