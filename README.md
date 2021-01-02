# DDS

vivado 2016.4
with matlab

this project mainly produce a .coe file from matlab, the .coe file is a cosine wave.


matlab code:
/*----------------------------------------------------------------------------------------*/
clc;clear;

width=8;
depth=1024;

x=linspace(0,2*pi,depth);
y_cos=cos(x);

y_cos=round(y_cos*(2^(width-1)-1));

plot(x,y_cos);
fid=fopen('C:\Users\72721\Desktop\1.coe','w');

fprintf(fid,'memory_initialization_radix = 10;\nmemory_initialization_vector =');

for i=1:depth
    
    if mod(i-1,8)==0
        fprintf(fid,'\n');
    end
    fprintf(fid,'%6d,',y_cos(i));
end

fclose(fid);
/*----------------------------------------------------------------------------------------*/

and uses the vivado ip block memory generator to generate a rom with .coe file initialized.

the data width is 8, and the depth is 1024 which is matched the data exported from matlab
and a verilog file is created and generate the wave, and the two cosine wave one is signed and another is unsigned.







