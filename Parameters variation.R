### 0. ---------- COMBINATION OF PARAMETERS ---------- ###
###    Combination of parameters for a cross calibration 
###    of SOLANUM model
###    ---
###    Ninanya Tantavilca, Johan Lenon (N0N1)
###    ninanyat.jl@gmail.com
### 0. ----------------------------------------------- ### 

### 1. ---------- Input range [a, b] for the parameters ---------- ###
 pDAT = read.csv("Initial Parameters.csv") 
 p1 = pDAT[, 1] # wmax
 p2 = pDAT[, 2] # te
 p3 = pDAT[, 3] # tm
#
 p4 = pDAT[, 4] # A
 p5 = pDAT[, 5] # tu
 p6 = pDAT[, 6] # b
#
 p7 = pDAT[, 7] # RUE
 p8 = pDAT[, 8] # DMc
### 1. ----------------------------------------------------------- ###

 ### 2. ---------- Determination of the points ---------- ### 
 p = data.frame(p1, p2, p3, p4, p5, p6, p7, p8)
 P = matrix(nrow = 2, ncol = 8)
#
 for(i in 1:8){                #
    a = p[1, i]                #
    b = p[2, i]                #
    x2 = 0.5*(a + b)           #
    x1 = 0.5*(a + x2)          #
    x3 = 0.5*(b + x2)          #  <*-------x1--------x2-------x3-------*>
#                              #   a   |         |        |        |   b
    u1 = 0.5*( a + x1)         #       |         |        |        |
    u2 = 0.5*(x1 + x2)         #       *         *        *        *
    u3 = 0.5*(x2 + x3)         #       u1        u2       u3       u4
    u4 = 0.5*(x3 +  b)         #
#                              #
#    u = c(u1, u2, u3, u4)      
    u = c(x1, x3)
    P[, i] = u                 #
 }
### 2. -------------------------------------------------- ###

### 3. ---------- Point of the parameters ---------- ### 
 pP1 = pDAT[,1]
 pP2 = pDAT[,2]
 pP3 = pDAT[,3]
 pP4 = pDAT[,4]
 pP5 = pDAT[,5]
 pP6 = pDAT[,6]
 pP7 = pDAT[,7]
 pP8 = pDAT[,8]
 
 P1 = pP1[!is.na(pP1)]
 P2 = pP2[!is.na(pP2)]
 P3 = pP3[!is.na(pP3)]
 P4 = pP4[!is.na(pP4)]
 P5 = pP5[!is.na(pP5)]
 P6 = pP6[!is.na(pP6)]
 P7 = pP7[!is.na(pP7)]
 P8 = pP8[!is.na(pP8)]
 
### 3. --------------------------------------------- ###

### 4. ---------- Number of points per parameter -------- ###
 n1 = length(P1)
 n2 = length(P2)
 n3 = length(P3)
 n4 = length(P4)
 n5 = length(P5)
 n6 = length(P6)
 n7 = length(P7)
 n8 = length(P8)
# 
 nn = n1*n2*n3*n4*n5*n6*n7*n8
### 4. -------------------------------------------------- ### 

### 5. ----------- P8: Dry Matter Concentration (DMc) ---------- ###
 B8 = P8                                  # vector with points repeated r8 times (r8 = 1)
# 
 N8 = n1*n2*n3*n4*n5*n6*n7
 Y8 = rep(B8, N8)
### 5. --------------------------------------------------------- ### 

### 6. ---------- P7: Radiation Use Efficiency (RUE) -------- ###
 r7 = n8
 R7 = rep(P7, r7)                         # repeat each points r7 times
 M7 = matrix(R7, nrow = n7, ncol = r7)    # save ass matrix
#
 A7 = vector()
 B7 = vector()
# 
 for (i in 1:n7) {
  A7 = M7[i,]
  B7 = c(B7, A7)                          # vector with points repeated r7 times
 }
# 
 N7 = n1*n2*n3*n4*n5*n6
 Y7 = rep(B7, N7)
### 6. -------------------------------------------------------- ### 
 
### 7. ---------- P6: TT just before the tuber initiation process (b) -------- ###
 r6 = n7*n8
 R6 = rep(P6, r6)                         # repeat each points r7 times
 M6 = matrix(R6, nrow = n6, ncol = r6)    # save ass matrix
#
 A6 = vector()
 B6 = vector()
# 
 for (i in 1:n6) {
   A6 = M6[i,]
   B6 = c(B6, A6)                          # vector with points repeated r7 times
 }
# 
 N6 = n1*n2*n3*n4*n5
 Y6 = rep(B6, N6)
### 7. ----------------------------------------------------------------------- ###  
 
### 8. ---------- P5: TT at maximum tuber partition rate (tu) -------- ###
 r5 = n6*n7*n8
 R5 = rep(P5, r5)                         # repeat each points r7 times
 M5 = matrix(R5, nrow = n5, ncol = r5)    # save ass matrix
#
 A5 = vector()
 B5 = vector()
# 
 for (i in 1:n5) {
   A5 = M5[i,]
   B5 = c(B5, A5)                          # vector with points repeated r7 times
 }
# 
 N5 = n1*n2*n3*n4
 Y5 = rep(B5, N5)
### 8. --------------------------------------------------------------- ###  
 
### 9. ---------- P4: Maximum harvest index (A) -------- ###
 r4 = n5*n6*n7*n8
 R4 = rep(P4, r4)                         # repeat each points r7 times
 M4 = matrix(R4, nrow = n4, ncol = r4)    # save ass matrix
#
 A4 = vector()
 B4 = vector()
# 
 for (i in 1:n4) {
   A4 = M4[i,]
   B4 = c(B4, A4)                          # vector with points repeated r7 times
 }
# 
 N4 = n1*n2*n3
 Y4 = rep(B4, N4)
### 9. -------------------------------------------------- ###  
 
### 10. ---------- P3: TT at the maximum canopy cover growth rate (tm) -------- ###
 r3 = n4*n5*n6*n7*n8
 R3 = rep(P3, r3)                         # repeat each points r7 times
 M3 = matrix(R3, nrow = n3, ncol = r3)    # save ass matrix
#
 A3 = vector()
 B3 = vector()
# 
 for (i in 1:n3) {
   A3 = M3[i,]
   B3 = c(B3, A3)                          # vector with points repeated r7 times
 }
# 
 N3 = n1*n2
 Y3 = rep(B3, N3)
### 10. ----------------------------------------------------------------------- ###  
 
### 11. ---------- P2: TT at the maximum canopy cover value (te) -------- ###
 r2 = n3*n4*n5*n6*n7*n8
 R2 = rep(P2, r2)                         # repeat each points r7 times
 M2 = matrix(R2, nrow = n2, ncol = r2)    # save ass matrix
#
 A2 = vector()
 B2 = vector()
# 
 for (i in 1:n2) {
   A2 = M2[i,]
   B2 = c(B2, A2)                          # vector with points repeated r7 times
 }
# 
 N2 = n1
 Y2 = rep(B2, N2)
### 11. ------------------------------------------------------------------ ###  
 
### 12. ---------- P1: Maximum canopy cover index (wmax) -------- ###
 r1 = n2*n3*n4*n5*n6*n7*n8
 R1 = rep(P1, r1)                         # repeat each points r7 times
 M1 = matrix(R1, nrow = n1, ncol = r1)    # save ass matrix
#
 A1 = vector()
 B1 = vector()
# 
 for (i in 1:n1) {
   A1 = M1[i,]
   B1 = c(B1, A1)                          # vector with points repeated r7 times
 }
# 
 N1 = 1
 Y1 = rep(B1, N1)
### 12. ---------------------------------------------------------- ### 

 yP = data.frame(Y1, Y2, Y3, Y4, Y5, Y6, Y7, Y8)
 colnames(yP) = c('wmax', 'te', 'tm', 'A', 'tu', 'b', 'RUE', 'DMc')
 write.csv(yP, "Parameters - N points.csv")
 