function integracion_Numerica(f,desde,hasta)
   syms x;
   warning('off','all');
   printf("\n\n---------------------------------------Integral definida--------------------------------------- \n\n");
   pretty(f);
   printf ("\n---------------------------------------- de x= %d a x= %d----------------------------------------\n",double(desde),double(hasta));
   ##METODOS
   metTrapecios(f,desde,hasta,(hasta-desde)/3,  3);
   metTrapecios(f,desde,hasta,(hasta-desde)/9, 9);
   Simpson3(f,desde,hasta,(hasta-desde)/2, 2);
   Simpson3(f,desde,hasta,(hasta-desde)/10,10);
   Simpson8(f,desde,hasta,(hasta-desde)/3, 3);  
printf("-----------------------------------------------------------------------------------------------------\n");   
endfunction
