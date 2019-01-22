function p=TM(F,OT,Dn)
L=length(Dn);
p=zeros(F+1,F+1);
p(1:(OT+1),(F+1):-1:(F+1-L+1))= repmat(Dn,(OT+1),1);
p((F+1),(F+1):-1:(F+1-L+1))=Dn;
if OT==(F+1)
    return;
end
for i=(OT+2):F
    if i<L
        Dn_ =[Dn(1:(i-1)) sum(Dn(L:-1:i))];
        L_=length(Dn_);
        p(i,i:-1:(i-L_+1))=Dn_;
    else
        p(i,i:-1:(i-L+1))=Dn;
    end
    
end





