#!/bin/dash
sudo systemctl enable --now cups.service
sudo systemctl enable --now cups.socket
sudo systemctl enable --now cups.path
