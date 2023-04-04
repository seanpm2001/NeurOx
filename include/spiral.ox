/**	Ox version of https://cs231n.github.io/neural-networks-case-study/
	translated by CF	
**/
#include <oxstd.oxh>
#include <oxdraw.oxh>

/**	Generate and Graph 3 different spirals.
@param N number of points per spiral
@param K number of spirals
@return y~X   NK x 3 matrix
	y = "class" of spiral, 0...K-1
	X = the (x,y) coordinates of the point in the spiral	 

@comments
	No "D" parameter because dimension in the code fixed to 2

**/
spiral(N,K) {  
  decl k,xk,X,t,r,tag = "spiral_"+sprint(K)+"_"+sprint(N);  
  r=range(0,1,1/(N-1))';  //no reason to do this in the loop
  X=<>;
  for (k=0;k<K;++k) {
	t = 4*(k+1)*r + 0.2*rann(N,1);   //no reason to recreate same range, reuse r
	xk = r.*(sin(t)~cos(t));
	DrawXMatrix(0,xk[][1]',"",xk[][0]',"",1,2+k);
    X |= k~xk;
  	}
  DrawAxisAuto(0,0,1,ANCHOR_USER, 0.0, 0.0);  
  SaveDrawWindow(tag+".pdf");
  savemat(tag+".dta",X);
  return X;
}
