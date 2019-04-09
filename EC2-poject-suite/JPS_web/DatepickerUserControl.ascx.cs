using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JPS_web
{
    public partial class DatepickerUserControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public string MyText
        {
            get
            {
                return datetimepicker1.Text;
            }
        }
    }
}