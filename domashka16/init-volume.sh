#!/bin/bash
# Створення волюму, якщо він не існує
if [ ! -d /data/db ]; then
    mkdir -p /data/db
fi
