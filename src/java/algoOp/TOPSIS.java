/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package algoOp;
/**
 *
 * @author Ultra
 */
public final class TOPSIS
{
    double [] weights;
    double [][] InitialMatrix;
    int maxRows, maxColumns;    //max columns einai 4 panta :price,area_size,shared,year
    
    double [][] normalizedDecisionMatrix;
    double [][] weightedNormalizedDecisionMatrix;
    double [] positiveIdealSolution;
    double [] negativeIdealSolution;
    double []distanceAlternativeToPositiveIdealSolution;
    double []distanceAlternativeToNegativeIdealSolution;
    double [] closenesCoefficient;
    double [] sortClosenesCoefficient;
    
    public TOPSIS(double [] w,double [][] InitMat,int mrows,int mcolumns){
        weights = w;
        InitialMatrix = InitMat;
        maxRows = mrows;
        maxColumns = mcolumns;
        calculate();
    }
    public void calculate() 
    {
       calculateNormalizedDecisionMatrix();
       calculateWeightedNormalizedDecisionMatrix();
       calculatePositiveIdealSolution();
       calculateNegativeIdealSolution();
       calculateDistanceAlternativeToPositiveIdealSolution();
       calculateDistanceAlternativeToNegativeIdealSolution();
       calculateClosenessCoefficient();
       
    }
    
     public double [][] calculateNormalizedDecisionMatrix()
    {
        double [] sumPowSqrt = new double[maxColumns];
        normalizedDecisionMatrix = new double[maxRows][maxColumns];
       
        /*
         * Calculate Normalize Decision Matrix
         */
        for(int col = 0; col<maxColumns;col++)
        {
            
            double sumPow=0.d;
            for(int row = 0;row<maxRows;row++)
            {
                sumPow = sumPow + Math.pow(InitialMatrix[row][col],2);
            }
            sumPowSqrt[col]= Math.sqrt(sumPow);
            for(int row= 0;row<InitialMatrix.length;row++)
            {
                normalizedDecisionMatrix[row][col]=InitialMatrix[row][col]/sumPowSqrt[col];
            }
        }
        /*
         * Show normalize decision matrix
         */
        //System.out.println("+++++++++++++++++++NORMALIZED DECISION MATRIX++++++++++++++++++");
        for(int row = 0; row<maxRows;row++)
        {
            
            for(int col = 0;col<maxColumns;col++)
            {
                //System.out.print("\t" + Math.round(normalizedDecisionMatrix[row][col]));
            }
            //System.out.println(" ");
        }
        //System.out.println("+++++++++++++++++++NORMALIZED DECISION MATRIX++++++++++++++++++");
        return normalizedDecisionMatrix;
    }
    
    public double [][] calculateWeightedNormalizedDecisionMatrix()
    {
        weightedNormalizedDecisionMatrix = new double[maxRows][maxColumns]; 
        for(int col = 0; col<maxColumns;col++)
        {
            for(int row = 0;row<maxRows;row++)
            {
                weightedNormalizedDecisionMatrix[row][col] = normalizedDecisionMatrix[row][col] * weights[col];
            }
       }
        //System.out.println("+++++++++++++++++++WEIGHTED NORMALIZED DECISION MATRIX++++++++++++++++++");
        for(int i = 0; i<maxRows;i++)
        {
            for(int j = 0; j<maxColumns;j++)
            {
                //System.out.print("\t" +Math.round(weightedNormalizedDecisionMatrix[i][j]));
                
            }
            //System.out.println("");
        }
        //System.out.println("+++++++++++++++++++WEIGHTED NORMALIZED DECISION MATRIX++++++++++++++++++");
        return weightedNormalizedDecisionMatrix;
        
    }
    
    public double [] calculatePositiveIdealSolution()
    {
       positiveIdealSolution = new double[maxColumns];
       double max = 0d;
       for(int col = 0; col<maxColumns;col++)
        {
            max = 0d;
            for(int row = 0;row<maxRows;row++)
            {
                
                if(weightedNormalizedDecisionMatrix[row][col]>max)
                {
                    max=weightedNormalizedDecisionMatrix[row][col];
                }
                positiveIdealSolution[col]=max;    
            }
           
       }
        //System.out.println("+++++++++++++++++++POSITIF IDEAL SOLUTION++++++++++++++++++");
        for(int i = 0; i<maxColumns;i++)
        {
            //System.out.print("\t" + Math.round(positiveIdealSolution[i]));
        }
        //System.out.println("");
        //System.out.println("+++++++++++++++++++POSITIF IDEAL SOLUTION++++++++++++++++++");
           return positiveIdealSolution; 
    }
    
    public double [] calculateNegativeIdealSolution()
    {
        negativeIdealSolution = new double[maxColumns];
       double min = 0d;
       for(int col = 0; col<maxColumns;col++)
        {
           min = 1;
            for(int row = 0;row<maxRows;row++)
            {
                
                if(weightedNormalizedDecisionMatrix[row][col]<min)
                {
                    min=weightedNormalizedDecisionMatrix[row][col];
                }
                negativeIdealSolution[col]=min;    
            }
           
       }
        //System.out.println("+++++++++++++++++++NEGATIF IDEAL SOLUTION++++++++++++++++++");
        for(int i = 0; i<maxColumns;i++)
        {
            //System.out.print("\t" + Math.round(negativeIdealSolution[i]));
        }
        //System.out.println("");
        //System.out.println("+++++++++++++++++++NEGATIF IDEAL SOLUTION++++++++++++++++++");
           return negativeIdealSolution; 
    }
    
    public double []calculateDistanceAlternativeToPositiveIdealSolution()
    {
        distanceAlternativeToPositiveIdealSolution= new double[maxRows];
        double [] temp = new double[maxRows];
        
        for(int i = 0; i<maxRows;i++)
        {
            temp[i]=0d;
        }
        
        for(int row = 0; row<maxRows;row++)
        {
            for(int col = 0;col<maxColumns;col++)
            {
                temp[row] = temp[row] + Math.pow((weightedNormalizedDecisionMatrix[row][col]- positiveIdealSolution[col]), 2);
                
            }
            
            distanceAlternativeToPositiveIdealSolution[row]= Math.sqrt(temp[row]);
       }
        //System.out.println("+++++++++++++++++++ALTERNATIF TO POSITIF IDEAL SOLUTION++++++++++++++++++");
        for(int i = 0; i<maxRows;i++)
        {
            //System.out.print("\t" + Math.round(distanceAlternativeToPositiveIdealSolution[i]));
        }
        //System.out.println("");
        //System.out.println("+++++++++++++++++++ALTERNATIF TO POSITIF IDEAL SOLUTION++++++++++++++++++");
       return distanceAlternativeToPositiveIdealSolution;
    }
    
    public double [] calculateDistanceAlternativeToNegativeIdealSolution()
    {
        distanceAlternativeToNegativeIdealSolution= new double[maxRows];
        double [] temp = new double[maxRows];
        
        for(int i = 0; i<maxRows;i++)
        {
            temp[i]=0d;
        }
        for(int row = 0; row<maxRows;row++)
        {
            for(int col = 0;col<maxColumns;col++)
            {
                temp[row] = temp[row] + Math.pow((weightedNormalizedDecisionMatrix[row][col]- negativeIdealSolution[col]), 2);
                
            }
            
            distanceAlternativeToNegativeIdealSolution[row]= Math.sqrt(temp[row]);
       }
        //System.out.println("+++++++++++++++++++ALTERNATIF TO NEGATIF IDEAL SOLUTION++++++++++++++++++");
        for(int i = 0; i<maxRows;i++)
        {
            //System.out.print("\t" + Math.round(distanceAlternativeToNegativeIdealSolution[i]));
        }
        //System.out.println("");
        //System.out.println("+++++++++++++++++++ALTERNATIF TO NEGATIF IDEAL SOLUTION++++++++++++++++++");
       return distanceAlternativeToNegativeIdealSolution;
    }
    
    public double [] calculateClosenessCoefficient()
    {
        closenesCoefficient = new double[maxRows];
         for(int i = 0; i<maxRows;i++)
        {
            closenesCoefficient[i] = distanceAlternativeToNegativeIdealSolution[i]/(distanceAlternativeToNegativeIdealSolution[i] + distanceAlternativeToPositiveIdealSolution[i]);
        }
        //System.out.println("+++++++++++++++++++CLOSENESS COEFFICIENT++++++++++++++++++");
         for(int i = 0; i<maxRows;i++)
        {
            //System.out.print("\t" + Math.round(closenesCoefficient[i]));
        }
        //System.out.println("");
        //System.out.println("+++++++++++++++++++CLOSENESS COEFFICIENT++++++++++++++++++");
        return closenesCoefficient;
    }
    
    public double [] calculateSortClosenessCoefficient()
    {
        sortClosenesCoefficient = new double[maxRows];
       
        return sortClosenesCoefficient;
    }
    
    public double[] getNegativeIdealSolution() {
        return negativeIdealSolution;
    }

    public double[][] getNormalizedDecisionMatrix() {
        return normalizedDecisionMatrix;
    }

    public double[] getPositiveIdealSolution() {
        return positiveIdealSolution;
    }

    public double[] getClosenesCoefficient() {
        return closenesCoefficient;
    }

    public double[] getSortClosenesCoefficient() {
        return sortClosenesCoefficient;
    }

    public double[][] getWeightedNormalizedDecisionMatrix() {
        return weightedNormalizedDecisionMatrix;
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

    public double[] getDistanceAlternativeToNegativeIdealSolution() {
        return distanceAlternativeToNegativeIdealSolution;
    }

    public void setDistanceAlternativeToNegativeIdealSolution(double[] distanceAlternativeToNegativeIdealSolution) {
        this.distanceAlternativeToNegativeIdealSolution = distanceAlternativeToNegativeIdealSolution;
    }

    public double[] getDistanceAlternativeToPositiveIdealSolution() {
        return distanceAlternativeToPositiveIdealSolution;
    }

    public void setDistanceAlternativeToPositiveIdealSolution(double[] distanceAlternativeToPositiveIdealSolution) {
        this.distanceAlternativeToPositiveIdealSolution = distanceAlternativeToPositiveIdealSolution;
    }

    public void setClosenesCoefficient(double[] closenesCoefficient) {
        this.closenesCoefficient = closenesCoefficient;
    }

    public void setNegativeIdealSolution(double[] negativeIdealSolution) {
        this.negativeIdealSolution = negativeIdealSolution;
    }

    public void setNormalizedDecisionMatrix(double[][] normalizedDecisionMatrix) {
        this.normalizedDecisionMatrix = normalizedDecisionMatrix;
    }

    public void setPositiveIdealSolution(double[] positiveIdealSolution) {
        this.positiveIdealSolution = positiveIdealSolution;
    }

    public void setSortClosenesCoefficient(double[] sortClosenesCoefficient) {
        this.sortClosenesCoefficient = sortClosenesCoefficient;
    }

    public void setWeightedNormalizedDecisionMatrix(double[][] weightedNormalizedDecisionMatrix) {
        this.weightedNormalizedDecisionMatrix = weightedNormalizedDecisionMatrix;
    }
      
    
}