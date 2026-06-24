# MyApp Update Server

This repository is a simple GitHub Pages update server for a .NET application.

It hosts:

- A JSON update manifest
- Versioned ZIP update packages
- A simple test webpage

## Repository Structure

```text
.
├── .nojekyll
├── README.md
├── index.html
└── updates/
    ├── manifest.json
    └── releases/
        └── 1.0.1/
            └── MyApp-1.0.1.zip
