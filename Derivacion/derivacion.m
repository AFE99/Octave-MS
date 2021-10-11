function tabla = armarTabla (x0, h, f, n)
    if n<20
        error("El número n debe ser >= 20");
    else
        der=[];
        izq=[];
        if (mod(n,2))==0
            for i=1:((n/2)-1)
                izq(i)=x0-i*h;
            endfor
            for i=1:(n/2)
                der(i)=x0+i*h;
            endfor
        else
            for i=1:((n-1)/2)
                izq(i)=x0-i*h;
                der(i)=x0+i*h;
            endfor
        endif
        izq=sort(izq);
        X=[izq x0 der];
        Y=double(subs(f,X));
        tabla=[X ; Y];
    endif
endfunction;

#Referencias:
#fx0=f(x0)=f(x(0))
#fx0_1=f(x(0-1))
#fx0t1=f(x(0+1))
#fx0_2=f(x(0-2))
#fx0t2=f(x(0+2))
#f1x0=f'(x0)
#f2x0=f''(x0)

function mostrarValores(f1x0,Er1,Ep1,f2x0,Er2,Ep2)
  printf("---------\n");
  printf("Derivada primera= %d\n", double(f1x0));
  printf("Error relativo= %d\n", double(Er1));
  printf("Error porcentual= %d %%\n\n", double(Ep1));
  printf("---------\n");
  printf("Derivada segunda= %d\n", double(f2x0));
  printf("Error relativo= %d\n", double(Er2));
  printf("Error porcentual= %d %%\n", double(Ep2));
endfunction

function haciaADELANTE (x0, h, f, n, tabla)
  printf("\n\nDiferencias finitas hacia adelante\n");
  #armarTabla(x0, h, f, n)
  if (mod(n,2))==0
    #----------------------------------PAR 
    #DATOS
    fx0t2=tabla(2,1:end)((n/2)+2);
    fx0t1=tabla(2,1:end)((n/2)+1);
    fx0=tabla(2,1:end)((n/2));
   else
    #----------------------------------IMPAR
    #DATOS
    fx0t2=tabla(2,1:end)(((n-1)/2)+3);
    fx0t1=tabla(2,1:end)(((n-1)/2)+2);
    fx0=tabla(2,1:end)(((n-1)/2)+1);
  endif
#---------------------------------------Derivada primera
  f1x0=(fx0t1-fx0)/h;
#Error relativo y porcentual
  Er1=( subs(diff(f),x0)-f1x0 ) / subs(diff(f),x0);
  Ep1= Er1 * 100;
#---------------------------------------Derivada segunda
  f2x0= ( fx0t2-2*fx0t1+fx0 )/(h^2);
  #Error relativo y porcentual
  Er2=( subs(diff(diff(f)),x0)-f2x0 ) / subs(diff(diff(f)),x0);
  Ep2= Er2 * 100;
  mostrarValores(f1x0,Er1,Ep1,f2x0,Er2,Ep2);

endfunction

#----------------------------------------------------------------------------------



function haciaATRAS (x0, h, f, n, tabla)
  printf("\n\nDiferencias finitas hacia atras\n");
  #armarTabla(x0, h, f, n)
  if (mod(n,2))==0
    #----------------------------------PAR 
    #DATOS
    fx0_2=tabla(2,1:end)((n/2)-2);
    fx0_1=tabla(2,1:end)((n/2)-1);
    fx0=tabla(2,1:end)((n/2));
   else
    #----------------------------------IMPAR
    #DATOS
    fx0_2=tabla(2,1:end)(((n-1)/2)-1);
    fx0_1=tabla(2,1:end)(((n-1)/2));
    fx0=tabla(2,1:end)(((n-1)/2)+1);
  endif
#---------------------------------------Derivada primera
  f1x0= ( fx0 - fx0_1 ) / h;
#Error relativo y porcentual
  Er1=( subs(diff(f),x0)-f1x0 ) / subs(diff(f),x0);
  Ep1= Er1 * 100;
#---------------------------------------Derivada segunda
  f2x0= ( fx0 - 2*fx0_1 + fx0_2 )/(h^2);
#Error relativo y porcentual
  Er2=( subs(diff(diff(f)),x0)-f2x0 ) / subs(diff(diff(f)),x0);
  Ep2= Er2 * 100;
  mostrarValores(f1x0,Er1,Ep1,f2x0,Er2,Ep2);

endfunction

#--------------------------------------------------------------


function CENTRALES (x0, h, f, n, tabla)
  #armarTabla(x0, h, f, n)}
  printf("\n\nValores centrales\n");
  if (mod(n,2))==0
    #----------------------------------PAR 
    #DATOS
    fx0_1=tabla(2,1:end)((n/2)-1);
    fx0t1=tabla(2,1:end)((n/2)+1);
    fx0=tabla(2,1:end)((n/2));
   else
    #----------------------------------IMPAR
    #DATOS
    fx0_1=tabla(2,1:end)(((n-1)/2));
    fx0t1=tabla(2,1:end)(((n-1)/2)+2);
    fx0=tabla(2,1:end)(((n-1)/2)+1);
  endif
#---------------------------------------Derivada primera
  f1x0= ( fx0t1 - fx0_1 ) / (2*h);
#Error relativo y porcentual
  Er1=( subs(diff(f),x0)-f1x0 ) / subs(diff(f),x0);
  Ep1= Er1 * 100;
#---------------------------------------Derivada segunda
  f2x0= ( fx0t1 - 2*fx0 + fx0_1 )/(h^2);
#Error relativo y porcentual
  Er2=( subs(diff(diff(f)),x0)-f2x0 ) / subs(diff(diff(f)),x0);
  Ep2= Er2 * 100;
  mostrarValores(f1x0,Er1,Ep1,f2x0,Er2,Ep2);
endfunction

#--------------------------------------------------------------------
function derivacionNumerica (x0, h, f, n)
  warning('off','all');
  tabla=armarTabla(x0, h, f, n);
  haciaADELANTE(x0, h, f, n, tabla);
  haciaATRAS(x0, h, f, n, tabla);
  CENTRALES(x0, h, f, n, tabla);
  warning('on','all');
 endfunction