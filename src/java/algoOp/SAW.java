/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package algoOp;

/**
 *
 * @author bitsikokos
 */
public final class SAW {
    
    double [] weights;  //pinakas me ta vary p dinei o xrhsths
    double [][] InitialMatrix;  //o arxikos pinakas
    int maxRows, maxColumns;    //max columns einai 4 panta :price,area_size,shared,year
    double [] sum;
    
    public SAW(double [] w,double [][] InitMat,int mrows,int mcolumns){
        weights = w;
        InitialMatrix = InitMat;
        maxRows = mrows;
        maxColumns = mcolumns;
        calculate();
    }
    
    public double maxincolumn(int column){      
    //vriskei to max se mia sthlh:column disdiastatou
        double max = -1.0;
        for (int i=0;i<maxRows;i++){
            if (InitialMatrix[i][column]>max){
                max = InitialMatrix[i][column];
            }
        }
        return max;
        
    }
    
    public void calculate()
    {
        //ftiaxnei to athroisma kathe grammhs eperwthmatos pou dexetai
        sum = new double[maxRows];
        //normalizedDecisionMatrix = new double[maxRows][maxColumns];
       
        /*
         * Calculate
         */
        for(int col = 0; col<maxColumns;col++)
        {
            
            for(int row = 0;row<maxRows;row++)
            {
                sum[row] = sum[row] + weights[col]*(InitialMatrix[row][col]/maxincolumn(col));
            }
        }
    }
    
    public int getMaxRows() {
        return maxRows;
    }

    public void setMaxRows(int maxRows) {
        this.maxRows = maxRows;
    }

    public int getMaxColumns() {
        return maxColumns;
    }

    public void setMaxColumns(int maxColumns) {
        this.maxColumns = maxColumns;
    }

    public double[][] getInitialMatrix() {
        return InitialMatrix;
    }

    public void setInitialMatrix(double[][] InitialMatrix) {
        this.InitialMatrix = InitialMatrix;
    }

    public double[] getWeights() {
        return weights;
    }

    public void setWeights(double[] weights) {
        this.weights = weights;
    }
    
    public double[] getSum() {
        return sum;
    }

    public void setSum(double[] sum) {
        this.sum = sum;
    }
}
