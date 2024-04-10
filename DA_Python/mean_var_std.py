import numpy as np
#Surely there's a less annoying way to do this
def calculate(asd):
    tes=np.shape(asd)
    if tes!=(9,):
        raise ValueError("List must contain nine numbers.")
    calculations={}
    mat=np.array([[asd[0],asd[1],asd[2]],[asd[3],asd[4],asd[5]],[asd[6],asd[7],asd[8]]])
    m1=np.mean(mat,axis=0)
    m1=m1.tolist()
    m2=np.mean(mat,axis=1)
    m2=m2.tolist()
    m3=np.mean(asd)
    v1=np.var(mat,axis=0)
    v2=np.var(mat,axis=1)
    v1=v1.tolist()
    v2=v2.tolist()
    v3=np.var(asd)
    s1=np.std(mat,axis=0)
    s2=np.std(mat,axis=1)
    s1=s1.tolist()
    s2=s2.tolist()
    s3=np.std(asd)
    min1=np.min(mat,axis=0)
    min2=np.min(mat,axis=1)
    min1=min1.tolist()
    min2=min2.tolist()
    min3=np.min(asd)
    max1=np.max(mat,axis=0)
    max2=np.max(mat,axis=1)
    max1=max1.tolist()
    max2=max2.tolist()
    max3=np.max(asd)
    sum1=np.sum(mat,axis=0)
    sum2=np.sum(mat,axis=1)
    sum1=sum1.tolist()
    sum2=sum2.tolist()
    sum3=np.sum(asd)
    calculations['mean']=[m1,m2,m3]
    calculations['variance']=[v1,v2,v3]
    calculations['standard deviation']=[s1,s2,s3]
    calculations['min']=[min1,min2,min3]
    calculations['max']=[max1,max2,max3]
    calculations['sum']=[sum1,sum2,sum3]
    return calculations
