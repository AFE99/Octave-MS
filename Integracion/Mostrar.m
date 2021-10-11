function Mostrar (titulo,tabla,AAprox,AExact,Error,n)
  printf("%s \n",titulo);
  Tabla=tabla
  printf("\nCon n= %d\n",double(n));
  printf("\n  - Valor de Integral aproximada= %d \n", double(AAprox));
  printf("\n  - Valor de Integral exacto= %d\n", double(AExact));
  printf("\n  - Error porcentual= %d %%\n", double(Error));
endfunction
