function metTrapecios (f, desde, hasta, h, n)
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
    y0=y(1);
    sum=0;
    yn=y(columns(y));
    for i=2:columns(y)-1
       sum=sum+y(i)
    endfor;
    syms x;  
    AAprox = 1/2*h*(y0+yn+2*sum);
    AExact = int(f,x,desde,hasta);
    Error=((desde-hasta)/AExact)*h^2*subs((diff(diff(f,x))),x,(hasta-desde)/2);
    titulo="---------------------------------------METODO DE TRAPECIOS---------------------------------------\n\n";
    silent_functions(0);
    Mostrar(titulo,tabla,AAprox,AExact,Error,n);
endfunction

