.PHONY: test deps

run_gunicorn:
	PYTHONPATH=$${PYTHONPATH}:$$(pwd) gunicorn hello_world:app

deps:
	pip install -r requirements.txt; \
	pip install -r test_requirements.txt

# pip install flake8
lint:
	flake8 hello_world test

test:
	PYTHONPATH=. py.test --verbose -s

docker_build:
	docker build -t hello_world-printer .

docker_run: docker_build
	docker run \
		--name hello-world-printer-dev \
		 -p 5000:5000 \
		 -d hello_world-printer
