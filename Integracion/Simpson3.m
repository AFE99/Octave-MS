function Simpson3 (f,desde,hasta,h,n)
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
    sum=0;
   
    for i=2:columns(y)-1
       sum=sum+y(i)
    endfor;
    E=y(1)+y(columns(y));
    j=2;
    I=0;
    while j<columns(y)
      I=I+y(j);
      j=j+2;
    endwhile
    k=3;
    P=0;
    while k<columns(y)
      P=P+y(k);
      k=k+2;
    endwhile
    syms x;  
    AAprox=(h/3)*(E+4*I+2*P);
    AExact=int(f,x,desde,hasta);
    Ea=abs(AExact-AAprox); #Error absoluto
    Error=(Ea/AExact)*100;
    titulo="---------------------------------------METODO DE SIMPSON 1/3---------------------------------------\n\n";
    silent_functions(0);
   Mostrar(titulo,tabla,AAprox,AExact,Error,n);
endfunction

