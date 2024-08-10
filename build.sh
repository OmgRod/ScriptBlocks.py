#!/bin/bash

# Remove the existing dist directory
echo "Removing existing dist directory..."
rm -rf dist

# Build the package using setup.py
echo "Building the package..."
python setup.py sdist bdist_wheel

# Navigate into the dist directory
cd dist || { echo "Failed to enter dist directory"; exit 1; }

# Find the .whl file and install it
echo "Installing the package..."
whl_file=$(ls *.whl)
pip install --force-reinstall "$whl_file"

echo "Package installed successfully."