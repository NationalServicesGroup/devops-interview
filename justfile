set dotenv-load := true

black   := `tput -Txterm setaf 0`
red     := `tput -Txterm setaf 1`
green   := `tput -Txterm setaf 2`
yellow  := `tput -Txterm setaf 3`
blue    := `tput -Txterm setaf 4`
magenta := `tput -Txterm setaf 5`
cyan    := `tput -Txterm setaf 6`
white   := `tput -Txterm setaf 7`
bold    := `tput -Txterm bold`
reset   := `tput -Txterm sgr0`


# ----------------------------------------------------------------------------
# P R I V A T E
# ----------------------------------------------------------------------------

[private]
@_red message:
    echo "{{ red }}{{ message }}{{ reset }}"

[private]
@_green message:
    echo "{{ green }}{{ message }}{{ reset }}"

[private]
@_yellow message:
    echo "{{ yellow }}{{ message }}{{ reset }}"

[private]
@_blue message:
    echo "{{ blue }}{{ message }}{{ reset }}"

[private]
@_start_msg msg:
    just _green "{{ msg }} ..."

[private]
@_warn_msg msg:
    just _red "{{ msg }} ..."

# ----------------------------------------------------------------------------
# B U I L D / D E P L O Y
# ----------------------------------------------------------------------------

@docker_login:
    just _start_msg "Logging into docker hub"
    echo $DOCKER_HUB_KEY | docker login -u $DOCKER_HUB_USER --password-stdin

@docker_build:
    just _start_msg "Starting build of docker container"
    docker build -t nsg-test-django:dev -t ${DOCKER_HUB_USER}/nsg-test-django:$BITBUCKET_BUILD_NUMBER .

@docker_push:
    just _start_msg "Pushing built docker image"
    docker push ${DOCKER_HUB_USER}/nsg-test-django:$BITBUCKET_BUILD_NUMBER

# ----------------------------------------------------------------------------
# S E T U P
# ----------------------------------------------------------------------------
@init:
    python3 -m venv .venv
