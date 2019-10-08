#! /bin/bash

mongoimport --host <AWS LOAD BALANCER Address> --db clients --collection cases < sampleData/client_cases.json