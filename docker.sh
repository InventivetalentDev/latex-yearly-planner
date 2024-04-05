#!/bin/bash
docker compose up --build    
docker cp latex-yearly-planner:/app/out/ ./