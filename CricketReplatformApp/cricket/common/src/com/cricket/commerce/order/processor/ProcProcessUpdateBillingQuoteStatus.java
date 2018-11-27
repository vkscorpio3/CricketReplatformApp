package com.cricket.commerce.order.processor;

import java.net.MalformedURLException;
import java.rmi.RemoteException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.transaction.TransactionManager;
import javax.xml.rpc.ServiceException;

import atg.commerce.CommerceException;
import atg.commerce.order.InvalidParameterException;
import atg.commerce.order.OrderManager;
import atg.commerce.order.PipelineConstants;
import atg.core.util.StringUtils;
import atg.dtm.TransactionDemarcation;
import atg.dtm.TransactionDemarcationException;
import atg.nucleus.GenericService;
import atg.service.pipeline.PipelineProcessor;
import atg.service.pipeline.PipelineResult;
import atg.servlet.ServletUtil;
import atg.userprofiling.ProfileTools;

import com.cricket.checkout.order.CricketAccountHolderAddressData;
import com.cricket.commerce.order.CricketOrderImpl;
import com.cricket.commerce.order.CricketOrderTools;
import com.cricket.commerce.order.payment.CricketCreditCard;
import com.cricket.common.constants.CricketCommonConstants;
import com.cricket.common.constants.CricketESPConstants;
import com.cricket.esp.ESP.Namespaces.Types.Public.CricketDataModel_xsd.ESPApplicationException;
import com.cricket.exceptions.CricketException;
import com.cricket.integration.esp.CricketESPAdapter;
import com.cricket.integration.esp.vo.ESPResponseVO;
import com.cricket.integration.esp.vo.UpdateBillingQuoteStatusResponseVO;
import com.cricket.util.EspServiceResponseData;

public class ProcProcessUpdateBillingQuoteStatus extends GenericService implements PipelineProcessor {
  	  
	/** The profileTools. */
    private ProfileTools profileTools;

    /** The transactionManager. */
    private TransactionManager transactionManager;

    /** The orderManger. */
    private OrderManager orderManager;
    
    private CricketESPAdapter cricketESPAdapter;

    /** Value SUCCESS return. */
    private static final int SUCCESS = 1;
    private final int MANAGEABP = 2; 
    private static final String ESP_SUCCESS="0";
    private static final String UPDATE_BIILING_QUOTE_STATUS= "updateBillingQuoteStatus";
    private static final String UPDATE_BIILING_QUOTE_ERROR= "error while updating billing quote details in order repository";
    
 	  /**
	   * 1 - The processor completed
	   * @return an integer array of the valid return codes.
	   */ 
	  public int[] getRetCodes()
	  {
	    int[] ret = {SUCCESS,PipelineProcessor.STOP_CHAIN_EXECUTION,MANAGEABP};
	    return ret;
	  }                  
	
	/* (non-Javadoc)
	 * @see atg.service.pipeline.PipelineProcessor#runProcess(java.lang.Object, atg.service.pipeline.PipelineResult)
	 */
	public int runProcess(Object pParam, PipelineResult pResult) throws InvalidParameterException 
	{ 
		//logInfo("[ProcProcessUpdateBillingQuoteStatus->runProcess()]: Entering into runProcess()...");
		
		long starttime	= 0L;
		long endtime 	= 0L;		    
	    HashMap paramMap = (HashMap) pParam;
        Object order = paramMap.get(PipelineConstants.ORDER);
        
        boolean isAbpDiffCreditCard=false;
        if (order == null) {
            throw new InvalidParameterException("[ProcProcessUpdateBillingQuoteStatus->runProcess()]: order Id is not valid");
        }    
        CricketOrderImpl cricketOrder = (CricketOrderImpl) order;
        if (isLoggingDebug()) {			 				
	    		logDebug("Inside the ProcProcessUpdateBillingQuoteStatus class of runProcess() method :::" + CricketCommonConstants.SESSION_ID + getSessionId() + CricketCommonConstants.ORDER_ID + cricketOrder.getId());
		}
        Object accountHolderAddressDataObj = paramMap.get(CricketESPConstants.ACCOUNT_HOLDER_ADDDRESS_DATA);
        CricketAccountHolderAddressData  accountHolderAddressData = (CricketAccountHolderAddressData)accountHolderAddressDataObj;
         logInfo("[ProcProcessUpdateBillingQuoteStatus->runProcess()]: Entering into runProcess()...Order Id:"+cricketOrder.getId()+ " || For the User: "+
       			accountHolderAddressData.getAccountAddress().getFirstName()+ " "+accountHolderAddressData.getAccountAddress().getLastName()+" || Phone Number : "+
       			accountHolderAddressData.getAccountAddress().getPhoneNumber());
         
        List<?> pgs = cricketOrder.getPaymentGroups();
        CricketCreditCard creditCard=null;
		for(Object pg:pgs){
			 if(pg instanceof CricketCreditCard){
				 creditCard  =(CricketCreditCard)pg;
				 if(creditCard.isDiffernetCard()){
					 isAbpDiffCreditCard = true;
				 }
			 }
		}
        try
        {
        	EspServiceResponseData serviceResponseData =  (EspServiceResponseData) paramMap.get(CricketESPConstants.ESP_SERVICE_RESPONSE_DATA);
	        
	        if(null==serviceResponseData)
	        {
	        	throw new CricketException("[ProcProcessUpdateBillingQuoteStatus->runProcess()]: There is no EspServiceResponseData ");
	        }	        
	       
	        if(isLoggingDebug()){
	        	if(cricketOrder.getTaxPriceInfo() != null){
	        		logInfo("[ProcProcessUpdateBillingQuoteStatus->runProcess()]: Tax Info: "+ cricketOrder.getTaxPriceInfo().getAmount());
	        	}
	        }
	        
	        if(isLoggingDebug()){
	        	CricketOrderTools ordertools =(CricketOrderTools) getOrderManager().getOrderTools();
	    		logDebug("[ProcProcessUpdateBillingQuoteStatus->runProcess()]: Order Details :");
	    		logDebug(ordertools.orderDetailsToTrack(cricketOrder,null,this.getClass().getName())+	  		  "** EspServiceResponseData Details : "+serviceResponseData.toString());
               	}
	        starttime = System.currentTimeMillis();
	        boolean result = updateBillingQuoteStatus(cricketOrder,serviceResponseData,pResult);
	    	endtime = System.currentTimeMillis();
	    	
	    	logInfo("[ProcProcessUpdateBillingQuoteStatus->runProcess()]: time taken to get ESP response in milliseconds:  "+ (endtime - starttime));
			
	        
	        if (result) {
	        	 if(isAbpDiffCreditCard){
					 return MANAGEABP;
				  }else{
					  return SUCCESS;
				  }
	        } else {
	        	pResult.addError(UPDATE_BIILING_QUOTE_STATUS, UPDATE_BIILING_QUOTE_ERROR);
	        }
			    
	        logInfo("[ProcProcessUpdateBillingQuoteStatus->runProcess()]: Exiting runProcess(), with return SUCCESS..." + getCricketESPAdapter().getSessionOrderRequestConversationInfo(cricketOrder));
	        return SUCCESS;
		    	
        } 
        catch (ServiceException se) {
        	vlogError("[ProcProcessUpdateBillingQuoteStatus->runProcess()]:" + CricketESPConstants.WHOOP_KEYWORD +  " ServiceException while getting response:" + "ConversationId: " + getCricketESPAdapter().getConversationId() + CricketCommonConstants.SESSION_ID + getSessionId() + CricketCommonConstants.ORDER_ID +  cricketOrder.getId(), se);
			getCricketESPAdapter().showErrorLogs(pResult, CricketESPConstants.ESP_SYSTEM_EXCEPTIONS, CricketESPConstants.ESP_SYSTEM_EXCEPTIONS, se, "ServiceException");

			//pResult.addError(CricketESPConstants.ESP_SYSTEM_EXCEPTIONS,CricketESPConstants.ESP_SYSTEM_EXCEPTIONS);
		}
        catch (ESPApplicationException eae) {
        	vlogError("[ProcProcessUpdateBillingQuoteStatus->runProcess()]:" + CricketESPConstants.WHOOP_KEYWORD +  " ESPApplicationException while getting response:" + "ConversationId: " + getCricketESPAdapter().getConversationId() + CricketCommonConstants.SESSION_ID + getSessionId() + CricketCommonConstants.ORDER_ID +  cricketOrder.getId(), eae);
			String errorCode = getCricketESPAdapter().getEspFaultCode(eae);
			if(CricketESPConstants.ESP_TIMEOUT.equalsIgnoreCase(errorCode)){
				int returnCode = getCricketESPAdapter().retry(pParam, pResult, cricketOrder, this);	
				if(returnCode <= 0){
					getCricketESPAdapter().showErrorLogs(pResult, errorCode, errorCode, eae, "ESPApplicationException");
					//	pResult.addError(errorCode,errorCode);
				}else{
					return returnCode;
				}
			} else{
				getCricketESPAdapter().showErrorLogs(pResult, CricketESPConstants.ESP_BUSINESS_EXCEPTIONS, CricketESPConstants.ESP_BUSINESS_EXCEPTIONS, eae, "ESPApplicationException");

				//pResult.addError(CricketESPConstants.ESP_BUSINESS_EXCEPTIONS,CricketESPConstants.ESP_BUSINESS_EXCEPTIONS);
			}
		} 
        catch (RemoteException re) {
        	vlogError("[ProcProcessUpdateBillingQuoteStatus->runProcess()]:" + CricketESPConstants.WHOOP_KEYWORD +  " RemoteException while getting response:" + "ConversationId: " + getCricketESPAdapter().getConversationId() + CricketCommonConstants.SESSION_ID + getSessionId() + CricketCommonConstants.ORDER_ID +  cricketOrder.getId(), re);
			if(re.getCause() != null && re.getCause().getMessage() != null && re.getCause().getMessage().contains(CricketESPConstants.READ_TIMED_OUT)){
				int returnCode = getCricketESPAdapter().retry(pParam, pResult, cricketOrder, this);
				if(returnCode <= 0){
					getCricketESPAdapter().showErrorLogs(pResult, CricketESPConstants.ESP_TIMEOUT, CricketESPConstants.ESP_TIMEOUT, re, "ESPApplicationException");

				//	pResult.addError(CricketESPConstants.ESP_TIMEOUT,CricketESPConstants.ESP_TIMEOUT);
				}else{
					return returnCode;
				}
			}else{
				getCricketESPAdapter().showErrorLogs(pResult,CricketESPConstants.ESP_SYSTEM_EXCEPTIONS, CricketESPConstants.ESP_SYSTEM_EXCEPTIONS, re, "ESPApplicationException");

				//pResult.addError(CricketESPConstants.ESP_SYSTEM_EXCEPTIONS,CricketESPConstants.ESP_SYSTEM_EXCEPTIONS);
			}
		} catch (Exception e){
			vlogError("[ProcProcessUpdateBillingQuoteStatus->runProcess()]:" + CricketESPConstants.WHOOP_KEYWORD +  " Exception while getting response:" + "ConversationId: " + getCricketESPAdapter().getConversationId() + CricketCommonConstants.SESSION_ID + getSessionId() + CricketCommonConstants.ORDER_ID +  cricketOrder.getId(), e);
			getCricketESPAdapter().showErrorLogs(pResult,CricketESPConstants.ESP_SYSTEM_EXCEPTIONS, CricketESPConstants.ESP_SYSTEM_EXCEPTIONS, e, "ESPApplicationException");

			//pResult.addError(CricketESPConstants.ESP_SYSTEM_EXCEPTIONS,CricketESPConstants.ESP_SYSTEM_EXCEPTIONS);
		}
		return SUCCESS;
 
	  }
	
	private String getSessionId() {
		 HttpSession session = ServletUtil.getCurrentRequest().getSession();
		 String sessionId = CricketCommonConstants.EMPTY_STRING;
		 if(null != session) {
			 sessionId = session.getId();
		 }
		 return sessionId;
	}
	
	/**
	 * @param pCricketOrder
	 * @param pServiceResponseData
	 * @param pPipelineresult 
	 * @return
	 * @throws ServiceException 
	 * @throws MalformedURLException 
	 * @throws RemoteException 
	 * @throws ESPApplicationException 
	 */
	private boolean updateBillingQuoteStatus(CricketOrderImpl pCricketOrder, EspServiceResponseData pServiceResponseData, PipelineResult pPipelineresult) throws ESPApplicationException, RemoteException, MalformedURLException, ServiceException {
			 
		UpdateBillingQuoteStatusResponseVO responseVO = null;
		if (isLoggingDebug()) {
    		logDebug("Inside the ProcProcessUpdateBillingQuote class of updateBillingQuoteStatus() method..." + CricketCommonConstants.SESSION_ID + getSessionId() + CricketCommonConstants.ORDER_ID + pCricketOrder.getId());
		}
		try {
			responseVO = getCricketESPAdapter().updateBillingQuoteStatus(pCricketOrder,pServiceResponseData);
		} catch (CricketException e) {
			vlogError("[ProcProcessUpdateBillingQuoteStatus->runProcess()]:" + CricketESPConstants.WHOOP_KEYWORD +  " Error when submitting the order: " + "ConversationId: " + getCricketESPAdapter().getConversationId() + CricketCommonConstants.SESSION_ID + getSessionId() + CricketCommonConstants.ORDER_ID +  pCricketOrder.getId() + "responseVO::" + responseVO, e);
		}		
		boolean status=true;
		
		if(null!= responseVO){			
			ESPResponseVO responseStatus[] = responseVO.getResponse();			
			for(ESPResponseVO res: responseStatus){
				if((null!=res.getCode() && !res.getCode().equalsIgnoreCase(ESP_SUCCESS))){
					status=false;
					if(!StringUtils.isBlank(res.getCode())){
						pPipelineresult.addError(res.getCode(), res.getDescription());
					}
					else{
						pPipelineresult.addError("ESP", res.getDescription());
					}
				}
				else{
					status=true;
				}
			}
			
			if(status)	
			{				
				String billingQuoteOrderId = responseVO.getOrderInfo().getOrderId();
			    String paymentApprTransId = pCricketOrder.getVestaTransactionId();//responseVO.getPaymentApprovalTransactionId();
				boolean rollback = true;
		        TransactionDemarcation td = new TransactionDemarcation();
		        if(null!=responseVO){
		        synchronized (pCricketOrder) {        		
	        		try {
						td.begin(getTransactionManager());
						if(!StringUtils.isEmpty(billingQuoteOrderId)){
							pCricketOrder.setBillingSystemOrderId(billingQuoteOrderId);
							pCricketOrder.setBillSysPaymentApprTransId(paymentApprTransId);
 					    }						
					  	pCricketOrder.updateVersion();
	                    getOrderManager().updateOrder(pCricketOrder);
	                    rollback = false;
					} catch (TransactionDemarcationException e) {
	                    if (isLoggingError()) {
	                    	vlogError("[ProcProcessUpdateBillingQuoteStatus->runProcess()]:" + CricketESPConstants.WHOOP_KEYWORD +  " TransactionDemarcationException in updateBillingQuoteStatus method: " + "ConversationId: " + getCricketESPAdapter().getConversationId() + CricketCommonConstants.SESSION_ID + getSessionId() + CricketCommonConstants.ORDER_ID +  pCricketOrder.getId() + "responseVO::" + responseVO, e);
	                    }
	                    return false;
	                } catch (CommerceException e) {
	                    if (isLoggingError()) {
	                    	vlogError("[ProcProcessUpdateBillingQuoteStatus->runProcess()]:" + CricketESPConstants.WHOOP_KEYWORD +  " CommerceException in updateBillingQuoteStatus method: " + "ConversationId: " + getCricketESPAdapter().getConversationId() + CricketCommonConstants.SESSION_ID + getSessionId() + CricketCommonConstants.ORDER_ID +  pCricketOrder.getId() + "responseVO::" + responseVO, e);
	                    }
	                    return false;
	                } finally {
		                    try {
		                        td.end(rollback);
		                    } catch (TransactionDemarcationException e) {
		                        if (isLoggingError()) {
		                        	vlogError("[ProcProcessUpdateBillingQuoteStatus->runProcess()]:" + CricketESPConstants.WHOOP_KEYWORD +  " A transaction error occurred closing the transaction for the order with id: " + "ConversationId: " + getCricketESPAdapter().getConversationId() + CricketCommonConstants.SESSION_ID + getSessionId() + CricketCommonConstants.ORDER_ID +  pCricketOrder.getId() + "responseVO::" + responseVO, e);
		                        }
		                    }
	                	}
		        	}
		        }
			}
		}
		if (isLoggingDebug()) {			
    		logDebug("Exiting from ProcProcessUpdateBillingQuoteStatus class of updateBillingQuoteStatus() method...");
		}
		return true;
	} 

	/**
	 * @return the profileTools
	 */
	public ProfileTools getProfileTools() {
		return profileTools;
	}

	/**
	 * @param pProfileTools the profileTools to set
	 */
	public void setProfileTools(ProfileTools pProfileTools) {
		profileTools = pProfileTools;
	}

	/**
	 * @return the transactionManager
	 */
	public TransactionManager getTransactionManager() {
		return transactionManager;
	}

	/**
	 * @param pTransactionManager the transactionManager to set
	 */
	public void setTransactionManager(TransactionManager pTransactionManager) {
		transactionManager = pTransactionManager;
	}

	/**
	 * @return the orderManager
	 */
	public OrderManager getOrderManager() {
		return orderManager;
	}

	/**
	 * @param pOrderManager the orderManager to set
	 */
	public void setOrderManager(OrderManager pOrderManager) {
		orderManager = pOrderManager;
	}

	/**
	 * @return the cricketESPAdapter
	 */
	public CricketESPAdapter getCricketESPAdapter() {
		return cricketESPAdapter;
	}

	/**
	 * @param pCricketESPAdapter the cricketESPAdapter to set
	 */
	public void setCricketESPAdapter(CricketESPAdapter pCricketESPAdapter) {
		cricketESPAdapter = pCricketESPAdapter;
	}
	
}
 