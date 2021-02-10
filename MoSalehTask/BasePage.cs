using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;

namespace MoSalehTask
{
    public class BasePage : System.Web.UI.Page
    {
        //For Change Lang Settings
        protected override void InitializeCulture()

        {

            String selectedLanguage = "ar";
            if (Request.Cookies["lang"] != null)
            {
                if (Request.Cookies["lang"].Value == "en")
                {
                    selectedLanguage = "en";
                }
            }

            UICulture = selectedLanguage;
            Culture = selectedLanguage;
            Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(selectedLanguage);
            Thread.CurrentThread.CurrentUICulture = new CultureInfo(selectedLanguage);
            base.InitializeCulture();

        }
    }
}