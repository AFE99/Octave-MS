function Simpson8 (f,desde,hasta,h,n)
  silent_functions(1);
  warning('off','all');
    x=[];
    y=[];
    aux=desde;
    i=1;
    while (aux<=hasta)
      x(i)=aux;
      y(i)= double(subs(f,aux));
      aux=aux+h;
      i=i+1;
    endwhile
    tabla=[x ; y];
   sum=y(1)+y(columns(y));
  for i=2:columns(y)-1
    sum=sum+(3*y(i));
  endfor;
      syms x;  
  AExact = int(f,x,desde,hasta);
  AAprox=(3/8)*h*sum; 
  Ea=abs(AExact-AAprox); #Error absoluto
  Error=(Ea/AExact)*100; 
  
    titulo="---------------------------------------METODO DE SIMPSON 3/8---------------------------------------\n\n";
    
   silent_functions(0);
   Mostrar(titulo,tabla,AAprox,AExact,Error,n);

endfunction
