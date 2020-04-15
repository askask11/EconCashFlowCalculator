/*
 * Johnson Gao
 *   This is the record generator for my econ project.
 */
package utils;

/**
 * This is an abstraction of the cash flow class.
 * @author jianqing Gao
 */
public class CashflowRecord {
  
    private double openingBalance, cashInflow, cashOutflow, netCashflow, closingBalance;

    /**
     * Input information for the first mo.
     * @param openingBalance
     * @param cashInflow
     * @param cashOutflow 
     */
    public CashflowRecord(double openingBalance, double cashInflow, double cashOutflow) {
        this.openingBalance = openingBalance;
        this.cashInflow = cashInflow;
        this.cashOutflow = cashOutflow;
        this.netCashflow = cashInflow - cashOutflow;
        this.closingBalance = this.openingBalance + netCashflow;
    }

    public double getOpeningBalance() {
        return openingBalance;
    }

    public void setOpeningBalance(double openingBalance) {
        this.openingBalance = openingBalance;
    }

    public double getCashInflow() {
        return cashInflow;
    }

    public void setCashInflow(double cashInflow) {
        this.cashInflow = cashInflow;
    }

    public double getCashOutflow() {
        return cashOutflow;
    }

    public void setCashOutflow(double cashOutflow) {
        this.cashOutflow = cashOutflow;
    }

    public double getNetCashflow() {
        return netCashflow;
    }

    public void setNetCashflow(double netCashflow) {
        this.netCashflow = netCashflow;
    }

    public double getClosingBalance() {
        return closingBalance;
    }

    public void setClosingBalance(double closingBalance) {
        this.closingBalance = closingBalance;
    }

    /**
     * {@inheritDoc }
     * @return 
     */
    @Override
    public String toString() {
        return "CashflowRecord{" + "openingBalance=" + openingBalance + ", cashInflow=" + cashInflow + ", cashOutflow=" + cashOutflow + ", netCashflow=" + netCashflow + ", closingBalance=" + closingBalance + '}';
    }
    
    
    
    public void nextMouth()
    {
        //the profit which I earned
        openingBalance = closingBalance;
        //netCashflow = cashInflow - cashOutflow;
        //the remaining balance in the bank after added the current profit.
        closingBalance = openingBalance + netCashflow;
        //
    }
    
    
    
    public static void main(String[] args) {
        CashflowRecord record = new CashflowRecord(0, 6500, 6000);
        System.out.println(record);
        record.nextMouth();
        System.out.println(record);
        record.nextMouth();
        System.out.println(record);
        
    }
   
    public static CashflowRecord createInstance(double openingBalance, double cashInflow, double cashOutflow)
    {
        return new CashflowRecord(openingBalance, cashInflow, cashOutflow);
    }
    
    
}
