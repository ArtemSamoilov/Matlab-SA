function[]=plotXY(); 

x=1:0.1:5; 

y=log(x); 

axis([-1 5 -1 1.8]) 

plot(x,y,'b:*') 

xlabel('Ox') 

ylabel('Oy') 

whitebg('y') 

end