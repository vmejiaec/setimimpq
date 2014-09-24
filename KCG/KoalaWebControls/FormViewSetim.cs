using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace Koala.KoalaWebControls
{
    /// <summary>
    /// Clase para evitar que el form view limpie los datos en caso de error.
    /// </summary>
    /// 
    public class FormViewSetim : FormView
    {
        // Atributo para conocer si existe algún error
        protected bool hayErrorInsUpd = false;
        public virtual bool HayErrorInsUpd 
        { 
            get { return hayErrorInsUpd; } 
            set { hayErrorInsUpd = value; } 
        }
        // Evita el que se limpie la forma luego de un error.
        protected override void OnDataSourceViewChanged(object sender, EventArgs e)
        {
            if (HayErrorInsUpd)
            {
                if (this.CurrentMode == FormViewMode.Insert)
                {
                    this.RequiresDataBinding = false;
                    HayErrorInsUpd = false;
                }
                if (this.CurrentMode == FormViewMode.Edit)
                {
                    this.RequiresDataBinding = false;
                    HayErrorInsUpd = false;
                }
            }
            else
            {
                base.OnDataSourceViewChanged(sender, e);
            }
        }
    }
}