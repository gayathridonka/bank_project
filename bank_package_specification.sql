CREATE OR REPLACE PACKAGE HCL_BANK IS
PROCEDURE PROC_ADD_CUSTOMER 
(P_CUST_FIRST_NAME BANK_CUST.CUST_FIRST_NAME%TYPE,
 P_INITIALS BANK_CUST.INITIALS%TYPE,
 P_CUST_LAST_NAME BANK_CUST.CUST_LAST_NAME%TYPE,
 P_CUST_GENDER BANK_CUST.CUST_GENDER%TYPE DEFAULT 'F',
 P_CUST_DOB BANK_CUST.CUST_DOB%TYPE,
 P_CUST_TYPE BANK_CUST.CUST_TYPE%TYPE DEFAULT 'IND');
 
 PROCEDURE PROC_ADD_CUST_CONTACT
(P_CUST_ID  BANK_CUST_CONTACT.CUST_ID%TYPE,
 P_CUST_PHONE BANK_CUST_CONTACT.CUST_PHONE%TYPE,
 P_CONTACT_TYPE BANK_CUST_CONTACT.CONTACT_TYPE%TYPE DEFAULT 'HOME',
 P_CUST_ADDR_LINE1 BANK_CUST_CONTACT.CUST_ADDR_LINE1%TYPE,
 P_CUST_ADDR_LINE2 BANK_CUST_CONTACT.CUST_ADDR_LINE2%TYPE,
 P_CUST_CITY BANK_CUST_CONTACT.CUST_CITY%TYPE,
 P_CUST_STATE BANK_CUST_CONTACT.CUST_STATE%TYPE,
 P_CUST_PIN BANK_CUST_CONTACT.CUST_PIN%TYPE);
 
 PROCEDURE PROC_DEL_CUST(P_BANK_CUST_ID BANK_CUST.CUST_ID%TYPE);
 PROCEDURE PROC_DEL_CUST(P_CUST_FIRST_NAME BANK_CUST.CUST_FIRST_NAME%TYPE);
 
 PROCEDURE PROC_ADD_SB_ACCOUNT (
  P_PRIMARY_CUST_ID BANK_SB_ACCOUNT.PRIMARY_CUST_ID%TYPE,
  P_SECONDARY_CUST_ID BANK_SB_ACCOUNT.SECONDARY_CUST_ID%TYPE DEFAULT NULL,
  P_CURR_BAL_AMT BANK_SB_ACCOUNT.CURR_BAL_AMT%TYPE,
  P_ACC_STATUS BANK_SB_ACCOUNT.ACC_STATUS%TYPE DEFAULT 'Active',
  P_START_DATE BANK_SB_ACCOUNT.START_DATE%TYPE DEFAULT SYSDATE,
  P_END_DATE BANK_SB_ACCOUNT.END_DATE%TYPE DEFAULT NULL
);

PROCEDURE PROC_SB_DEPOSIT (P_TRANS_ACC_NO BANK_TRANSACTION.TRANS_ACC_NO%TYPE,
                         P_TRANS_DESC BANK_TRANSACTION.TRANS_DESC%TYPE,
                         P_TRANS_AMT BANK_TRANSACTION.TRANS_AMT%TYPE);
                         
                         
PROCEDURE PROC_SB_WITHDRAW (P_TRANS_ACC_NO BANK_TRANSACTION.TRANS_ACC_NO%TYPE,
                          P_TRANS_DESC BANK_TRANSACTION.TRANS_DESC%TYPE,
                          P_TRANS_AMT BANK_TRANSACTION.TRANS_AMT%TYPE);

 ESTOP EXCEPTION;
 ESTOP1 EXCEPTION;
 ESTOP2 EXCEPTION;
 ESTOP3 EXCEPTION;
 ESTOP4 EXCEPTION;
END HCL_BANK;