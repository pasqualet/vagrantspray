#!/bin/bash

set -e

curl -q -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh  2>/dev/null | sudo bash
sudo apt-get install -y gitlab-runner

sudo sed -i 's,"--user" "gitlab-runner","--user" "root",g' /etc/systemd/system/gitlab-runner.service
sudo systemctl daemon-reload

sudo usermod -aG docker gitlab-runner
sudo systemctl restart gitlab-runner

if ! grep -q token /etc/gitlab-runner/config.toml ; then
    sudo gitlab-runner register \
        --non-interactive \
        --name "$GITLABCI_NAME" \
        --url "$GITLABCI_URL" \
        --registration-token "$GITLABCI_TOKEN" \
        --executor "$GITLABCI_EXECUTOR" \
        --tag-list "$GITLABCI_TAGS" \
        --request-concurrency 0
fi


