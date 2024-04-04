#!/bin/bash

# Define color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Function to delete empty folders
clean_empty_folders() {
    find . -type d -empty -delete
    echo -e "${GREEN}[INFO] Empty folders cleaned.${NC}"
}

# Function to remove node_modules directories
clean_node_modules() {
    find . -name 'node_modules' -type d -prune -exec rm -rf '{}' +
    echo -e "${GREEN}[INFO] node_modules directories cleaned.${NC}"
}

# Function to clean Flutter-related files
clean_flutter() {
    find . -name '.flutter-plugins' -type f -delete
    find . -name '.flutter-plugins-dependencies' -type f -delete
    find . -name '.packages' -type f -delete
    find . -name 'pubspec.lock' -type f -delete
    find . -name 'build' -type d -prune -exec rm -rf '{}' +
    echo -e "${GREEN}[INFO] Flutter-related files cleaned.${NC}"
}

# Clean empty folders
echo -e "${RED}[INFO] Cleaning empty folders...${NC}"
clean_empty_folders

# Clean node_modules directories
echo -e "${RED}[INFO] Cleaning node_modules directories...${NC}"
clean_node_modules

# Clean Flutter-related files
echo -e "${RED}[INFO] Cleaning Flutter-related files...${NC}"
clean_flutter
