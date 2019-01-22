clear all
profit=12;
cost=2;
F=3;
OT=0:2;
Dn=[0.3 0.4 0.2 0.1];
result=zeros(length(F),length(OT));
for i=1:length(F)
    for j=1:length(OT)
        p=TM(F(i),OT(j),Dn);
        A=p-eye(F(i)+1);
        A(:,(F(i)+1))=ones((F(i)+1),1);
        pi=linsolve(A',[zeros(F(i),1);1] );
        f=@(x) profit*(F(i)-x)*(x<=OT(j))-cost*x;
        for x=1:(F(i)+1)
            result(i,j)=result(i,j)+pi(x)*f(x-1);
        end
    end
end