fold = 5;
CARS = carspls(X,y,7,fold,'center',50,1);
NewXtrain = X(:,CARS.vsel);
 
vsel = CARS.vsel