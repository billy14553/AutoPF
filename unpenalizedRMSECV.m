function rmsecv = unpenalizedRMSECV(rmsecv,x,vsel)
factor = getPenalityFactor();
 nn = length(x)-length(find(x==1));
 if nargin>2
     max1 = max(vsel);
     if max1~=length(vsel)
         nn = nn +1;
     end
 end
 rmsecv = rmsecv/(factor)^nn;
end