# Import relevant modules
import numpy as np
import matplotlib.pyplot as plt

# Define constants
u = 12
L = 1
H = 0.2
rho = 1
alph = 5
TA = 20
TC = 100
TD = 50
n = 4;

# Calculate parameters
delx = L/2
dely = H/2
Fx = rho*u
Dx = alph/delx
Dy = alph/dely
Ax = dely
Ay = delx

# Create solution matrix
A = np.zeros((n, n))
Su = np.zeros((n, 1))

# Manually input solution to create matrix
# node 1
Su[0] = ((2*Dx+Fx)*Ax)*TA+(2*Dy*Ay)*TC
A[0, 1] = (Fx/2-Dx)*Ax
A[0, 2] = -Dy*Ay
A[0, 0] = (3*Dx+Fx/2)*Ax+(3*Dy*Ay)

# node 2
Su[1] = (2*Dy*Ay)*TC
A[1, 0] = -(Dx+Fx/2)*Ax
A[1, 3] = -Dy*Ay
A[1, 1] = (Dx+Fx/2)*Ax+(3*Dy*Ay)

# node 3
Su[2] = ((2*Dx+Fx)*Ax)*TA+2*Dy*Ay*TD
A[2, 0] = -Dy*Ay
A[2, 3] = -(Dx-Fx/2)*Ax
A[2, 2] = (3*Dx+Fx/2)*Ax+(3*Dy*Ay)

# node 4
Su[3] = (2*Dy*Ay)*TD
A[3, 1] = -Dy*Ay
A[3, 2] = -(Dx+Fx/2)*Ax
A[3, 3] = (Dx+Fx/2)*Ax+(3*Dy*Ay)


# Init
relax = 1.1
Nmax = 100
Tj = np.zeros((n, Nmax))
Tgs = np.zeros((n, Nmax))
Trlx= np.zeros((n, Nmax))
Sumj = np.zeros((n, Nmax))
Sumgs1 = np.zeros((n, Nmax))
Sumgs2 = np.zeros((n, Nmax))
Sumrlx = np.zeros((n, Nmax))

for k in range(1, Nmax):

    for i in range(0, n):

        for j in range(0, n):

            # Jacobi method
            if j !=i:
                Sumj[i, k] += -A[i, j] * Tj[j, k - 1]

            Tj[i, k] = (1/A[i, i])*(Sumj[i, k] + Su[i])

            # gs method
            if j <= i-1:
                Sumgs1[i, k] += -A[i, j] * Tj[j, k]
            elif j >= i+1:
                Sumgs2[i, k] += -A[i, j] * Tj[j, k - 1]

            Tgs[i, k] = (1 / A[i, i]) * (Sumgs1[i, k] + Sumgs2[i, k] + Su[i])

            # Relaxation
            Sumrlx[i, k] += -A[i, j] * Tj[j, k - 1]

            Trlx[i, k] = Trlx[i, k-1] + (relax / A[i, i]) * (Sumrlx[i, k]+ Su[i])

Tex = Tj[:, Nmax-1]

print('Done')