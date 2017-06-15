# Import relevant modules
import numpy as np

# Define constants
u, L, H, rho, alph, n = 12, 1, 0.2, 1, 5, 4
# Boundary conditions
TA, TC, TD = 20, 100, 50

# Calculate parameters
delx = L/2
dely = H/2
Fx = rho*u
Dx = alph/delx
Dy = alph/dely
Ax = dely
Ay = delx

# Create solution matrix
a = np.zeros((n, n))
Su = np.zeros((n, 1))

# Manually input solution to create matrix
# node 1 (recall python start at 0)
Su[0] = ((2*Dx+Fx)*Ax)*TA+(2*Dy*Ay)*TC
a[0, 1] = (Fx / 2 - Dx) * Ax
a[0, 2] = -Dy * Ay
a[0, 0] = (3 * Dx + Fx / 2) * Ax + (3 * Dy * Ay)

# node 2
Su[1] = (2*Dy*Ay)*TC
a[1, 0] = -(Dx + Fx / 2) * Ax
a[1, 3] = -Dy * Ay
a[1, 1] = (Dx + Fx / 2) * Ax + (3 * Dy * Ay)

# node 3
Su[2] = ((2*Dx+Fx)*Ax)*TA+2*Dy*Ay*TD
a[2, 0] = -Dy * Ay
a[2, 3] = -(Dx - Fx / 2) * Ax
a[2, 2] = (3 * Dx + Fx / 2) * Ax + (3 * Dy * Ay)

# node 4
Su[3] = (2*Dy*Ay)*TD
a[3, 1] = -Dy * Ay
a[3, 2] = -(Dx + Fx / 2) * Ax
a[3, 3] = (Dx + Fx / 2) * Ax + (3 * Dy * Ay)


# Initialize solutions
relax, Nmax = 1.1, 100
Tj = np.zeros((n, Nmax))
Tgs = np.zeros((n, Nmax))
Trlx= np.zeros((n, Nmax))
Sumj = np.zeros((n, Nmax))
Sumgs1 = np.zeros((n, Nmax))
Sumgs2 = np.zeros((n, Nmax))

# Cycle through iterations k
for k in range(1, Nmax):
    # Cycle through matrix i,j
    for i in range(0, n):
        for j in range(0, n):
            # JM
            if j != i:
                Sumj[i, k] += -a[i, j] * Tj[j, k - 1]
            Tj[i, k] = (1 / a[i, i]) * (Sumj[i, k] + Su[i])
            # GSM
            if j <= i-1:
                Sumgs1[i, k] += -a[i, j] * Tgs[j, k]
            if j >= i+1:
                Sumgs2[i, k] += -a[i, j] * Tgs[j, k - 1]
            Tgs[i, k] = (1 / a[i, i]) * (Sumgs1[i, k] + Sumgs2[i, k] + Su[i])

            # RM
            Trlx[i, k] = relax*Tgs[i, k] + (1-relax)*Trlx[i, k-1]

# Get exact solution
Tex = Tj[:, Nmax-1]

# Compute errors
err = np.zeros((3, 1))
itnum = 3
for e in range(0, n):
    # Error for JM
    err[0] += abs(Tj[e, itnum] - Tex[e])
    # Error for GSM
    err[1] += abs(Tgs[e, itnum] - Tex[e])
    # Error for RLM
    err[2] += abs(Trlx[e, itnum] - Tex[e])

# Export Results
np.savetxt('Results\Tj.csv', Tj[:, 1:itnum+1], delimiter=',')
np.savetxt('Results\Tgs.csv', Tgs[:, 1:itnum+1], delimiter=',')
np.savetxt('Results\Trlx.csv', Trlx[:, 1:itnum+1], delimiter=',')
np.savetxt('Results\err.csv', err[:, 1:itnum+1], delimiter=',')
