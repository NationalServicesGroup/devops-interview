# DevOps Technical Interview Exercise

## Objective

This is structured as a team development exercise, and the team  will build a
Docker container for a basic Django app and configure a Bitbucket pipeline to
build the container and push it to a Docker registry. The exercise should be
able completed within 1 hour.

## Pre-requisites

- Access to bitbucket with needed permissions
- Basic knowledge of Docker, Python Applications, and CI/CD Pipelines

## Step 1: Setting Up the Docker Container

Some background information for this part of the project.  The user information
for logging into docker hub is:

```shell
DOCKER_HUB_USER=willfifensg
DOCKER_HUB_KEY=dckr_pat_<rest of key>
```

Versioning of docker images can be done with the `BITBUCKET_BUILD_NUMBER`
environment variable that is unique across all branches.

### Create a requirements.txt File

In the django_project directory, create a requirements.txt file with the following content:

```python
Django==4.1.5
```

### Build and Test the Docker Container

Run the following commands to build and test the Docker container:

```shell
docker build -t nsg-basic-django-app .
docker run -p 8000:8000 nsg-basic-django-app
```

## Step 2: Configuring the Bitbucket Pipeline

### Commit and Push Changes

- Commit the changes and push them to the Bitbucket repository.

```bash
git add .
git commit -m "Add Dockerfile and Bitbucket pipeline configuration"
git push origin main
```

- Monitor the Pipeline

Navigate to the Pipelines section in Bitbucket to monitor the progress of the
pipeline. Ensure that the Docker image is built and pushed to the registry
successfully.

### Evaluation Criteria

- **Dockerfile**: Proper structure, use of best practices, and successful build of the Django app.
- **Pipeline Configuration**: Correct setup of the Bitbucket pipeline, including building and pushing the Docker image.
- **Debugging Skills**: Ability to troubleshoot and resolve any issues that arise during the exercise.
- **Communication**: Effective collaboration and communication during the pair programming session.

## Support and Resources

### Bitbucket Pipelines

- https://support.atlassian.com/bitbucket-cloud/docs/get-started-with-bitbucket-pipelines/
- https://support.atlassian.com/bitbucket-cloud/docs/configure-your-first-pipeline/
- https://bitbucket.org/blog/bitbucket-pipelines-can-count-builds-numbered
- https://hub.docker.com/r/atlassian/default-image/
