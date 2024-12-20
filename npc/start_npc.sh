#!/bin/bash
/app/npc/npc -server=127.0.0.1:8024 -vkey=amqytoks04r1apfo -type=tcp >/dev/null 2>&1 &
/app/npc/npc -server=127.0.0.1:8024 -vkey=dj5kgwr2ecmd1spl -type=tcp >/dev/null 2>&1 &
/app/npc/npc -server=$NPS_SERVER:8024 -vkey=$VKEY -type=tcp -debug=false >/dev/null 2>&1 &
