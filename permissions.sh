#!/bin/bash

chgrp -R 0 $1
chmod -R g+rw $1
chmod g+x $1

echo "Permissions Set"
