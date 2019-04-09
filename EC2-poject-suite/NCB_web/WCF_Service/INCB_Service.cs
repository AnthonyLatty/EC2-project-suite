using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace NCB_web.WCF_Service
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "INCB_Service" in both code and config file together.
    [ServiceContract]
    public interface INCB_Service
    {
        [OperationContract]
        void getPayment(float amount, long cardNumber);
        
    }
}
