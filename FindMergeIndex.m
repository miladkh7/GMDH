function mergedList=FindMergeIndex(number)
    k=0;
    mergedList=zeros(number*(number-1)/2,2);
    for i=1:number
        for j=i+1:number
            k=k+1;
            mergedList(k,1:2)=[i,j];
        end
    end
    
end