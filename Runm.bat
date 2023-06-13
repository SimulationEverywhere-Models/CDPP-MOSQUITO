simu -eEvents.ev -mmosquito.ma -t00:05:00:000 -lmosquito

cd \eclipse\workspace\c\
remdim -d3 -f -lmosquito

drawlog -mmosquito.ma -l40mosquito -cambiente -d0 -g > pressure.drw
drawlog -mmosquito.ma -l41mosquito -cambiente -d1 -g > temp.drw
drawlog -mmosquito.ma -l42mosquito -cambiente -d2 -g > presence.drw



