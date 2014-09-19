using System;
using System.Collections;
using System.Collections.Generic;
using System.Reflection;
using System.Web.Caching;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HER
{
    public class Navegacion
    {
        public static string ObtenerValorControl(Control control)
        {
            if(control == null) return null;
            
            string textoControl = string.Empty;

            if (control is TextBox)
            {
                textoControl = (control as TextBox).Text;
                return textoControl;
            }
            else if (control is Label)
            {
                textoControl = (control as Label).Text;
                return textoControl;
            }
            else if (control is DropDownList)
            {
                textoControl = (control as DropDownList).SelectedValue;
                return textoControl;
            }
            else if (control is RadioButtonList)
            {
                textoControl = (control as RadioButtonList).SelectedValue;
                return textoControl;
            }
            else if (control is Button)
            {
                textoControl = (control as Button).Text;
                return textoControl;
            }
            else if (control is LinkButton)
            {
                textoControl = (control as LinkButton).Text;
                return textoControl;
            }
            else if (control is ImageButton)
            {
                textoControl = (control as ImageButton).AlternateText;
                return textoControl;
            }
            else if (control is HyperLink)
            {
                textoControl = (control as HyperLink).Text;
                return textoControl;
            }
            else if (control is CheckBox)
            {
                textoControl = (control as CheckBox).Checked ? "True" : "False";
                return textoControl;
            }
            return textoControl;
        }

        public static void AsignarValorDeControl(Control control, string valor)
        {
            if (control == null)
                return;

            if (control is TextBox)
            {
                (control as TextBox).Text = valor;
                return;
            }
            else if (control is Label)
            {
                (control as Label).Text = valor;
            }
            else if (control is DropDownList)
            {
                (control as DropDownList).SelectedValue = valor;
            }
            else if (control is RadioButtonList)
            {
                (control as RadioButtonList).SelectedValue = valor;
            }
            else if (control is Button)
            {
                (control as Button).Text = valor;
            }
            else if (control is LinkButton)
            {
                (control as LinkButton).Text = valor;
            }
            else if (control is ImageButton)
            {
                (control as ImageButton).AlternateText = valor;
            }
            else if (control is HyperLink)
            {
                (control as HyperLink).Text = valor;
            }
            else if (control is CheckBox)
            {
                if (valor == "True")
                {
                    (control as CheckBox).Checked = true;
                }
                else
                {
                    (control as CheckBox).Checked = false;
                }
            }
        }

        public static void AsignarPropiedadObjeto(object objeto, DictionaryEntry parametro)
        {
            object valorParametro = parametro.Value;
            PropertyInfo propiedadInfo = objeto.GetType().GetProperty(parametro.Key.ToString());
            if (propiedadInfo == null) return;
            Type tipoParametro = propiedadInfo.PropertyType;

            if (tipoParametro.IsGenericType &&
                tipoParametro.GetGenericTypeDefinition().Equals(typeof(Nullable<>)))
            {
                tipoParametro = Nullable.GetUnderlyingType(tipoParametro);
            }

            if (valorParametro != null)
            {
                if (valorParametro.ToString() != string.Empty)
                    valorParametro = Convert.ChangeType(parametro.Value, tipoParametro);
                else
                    valorParametro = null;
            }

            propiedadInfo.SetValue(objeto, valorParametro, null);
        }


        public static void AsignarPropiedadObjeto(object objeto, object nombrePropiedad, object valorPropiedad)
        {
            AsignarPropiedadObjeto(objeto, new DictionaryEntry(nombrePropiedad, valorPropiedad));
        }

        public static void ObtenerObjetoDeDiccionario(object objeto, IDictionary parametros)
        {
            foreach (DictionaryEntry parametro in parametros)
            {
                AsignarPropiedadObjeto(objeto, parametro);
            }
        }

        public static void ObtenerObjetoDeDiccionario(object objeto, DictionaryEntry[] parametros)
        {
            foreach (DictionaryEntry parametro in parametros)
            {
                AsignarPropiedadObjeto(objeto, parametro);
            }
        }

        public static void ObtenerObjetoDeDiccionario(object objeto, IEnumerable parametros)
        {
            foreach (DictionaryEntry parametro in parametros)
            {
                AsignarPropiedadObjeto(objeto, parametro);
            }
        }

        public static void ObtenerObjetoDeDiccionario(object objeto, List<DictionaryEntry> parametros)
        {
            foreach (DictionaryEntry parametro in parametros)
            {
                try
                {
                    AsignarPropiedadObjeto(objeto, parametro);
                }
                catch(Exception e)
                {
                    throw(e);
                }

            }
        }

        public static void ObtenerObjetoYOriginalDeDiccionario(object objeto, object originalObjeto, IDictionary parametros)
        {
            foreach (DictionaryEntry parametro in parametros)
            {
                string propiedadNombre = parametro.Key.ToString();
                if (propiedadNombre.Contains("original"))
                {
                    propiedadNombre = propiedadNombre.Replace("original", "");
                    AsignarPropiedadObjeto(originalObjeto, propiedadNombre, parametro.Value);
                }
                else
                {
                    AsignarPropiedadObjeto(objeto, propiedadNombre, parametro.Value);
                }
            }
        }

        public static void ObtenerOriginalDeDiccionario(object originalObjeto, List<DictionaryEntry> parametros)
        {
            foreach (DictionaryEntry parametro in parametros)
            {
                string propiedadNombre = parametro.Key.ToString();
                if (propiedadNombre.Contains("original"))
                {
                    propiedadNombre = propiedadNombre.Replace("original", "");
                    AsignarPropiedadObjeto(originalObjeto, propiedadNombre, parametro.Value);
                }
            }
        }

        public static void ObtenerObjetoYOriginalDeDiccionario(object objeto, object originalObjeto, DictionaryEntry[] parametros)
        {
            foreach (DictionaryEntry parametro in parametros)
            {
                string propiedadNombre = parametro.Key.ToString();
                if (propiedadNombre.Contains("original"))
                {
                    propiedadNombre = propiedadNombre.Replace("original", "");
                    AsignarPropiedadObjeto(originalObjeto, propiedadNombre, parametro.Value);
                }
                else
                {
                    AsignarPropiedadObjeto(objeto, propiedadNombre, parametro.Value);
                }
            }
        }

        public static void ObtenerObjetoYOriginalDeDiccionario(object objeto, object originalObjeto, List<DictionaryEntry> parametros)
        {
            foreach (DictionaryEntry parametro in parametros)
            {
                string propiedadNombre = parametro.Key.ToString();
                if (propiedadNombre.Contains("original"))
                {
                    propiedadNombre = propiedadNombre.Replace("original", "");
                    AsignarPropiedadObjeto(originalObjeto, propiedadNombre, parametro.Value);
                }
                else
                {
                    AsignarPropiedadObjeto(objeto, propiedadNombre, parametro.Value);
                }
            }
        }

        public static string ConstruirExpresionDeFiltrado(Dictionary<string, string> parametrosFiltrado, OperadorDeFiltardo operador)
        {
            string expresionDeFiltrado = string.Empty;
            bool primerParametro = true;
            foreach (KeyValuePair<string, string> parametro in parametrosFiltrado)
            {
                if(primerParametro)
                {
                    AgregarExpresionDeFiltrado(ref expresionDeFiltrado, parametro.Key, parametro.Value, OperadorDeFiltardo.SinOperador);
                    primerParametro = false;
                    continue;
                }
                AgregarExpresionDeFiltrado(ref expresionDeFiltrado, parametro.Key, parametro.Value, operador);
            }
           
            return expresionDeFiltrado;
        }

        public static bool AgregarExpresionDeFiltrado(ref string expresionDeFiltrado, string parametro, string valor, OperadorDeFiltardo operador)
        {

            if (string.IsNullOrEmpty(parametro) ||
                string.IsNullOrEmpty(valor)) return false;

            if (expresionDeFiltrado.Length > 0 || operador != OperadorDeFiltardo.SinOperador)
            {
                expresionDeFiltrado += " ";
                expresionDeFiltrado += ObtenerOperador(operador);
                expresionDeFiltrado += " ";
                expresionDeFiltrado += parametro;
                expresionDeFiltrado += " LIKE ";
                expresionDeFiltrado += "'";
                expresionDeFiltrado += valor + "%";
                expresionDeFiltrado += "'";
            }
            else if (expresionDeFiltrado.Length == 0)
            {
                expresionDeFiltrado += parametro;
                expresionDeFiltrado += " LIKE ";
                expresionDeFiltrado += "'";
                expresionDeFiltrado += valor + "%";
                expresionDeFiltrado += "'";
            }
            else
            {
                return false;
            }

            return true;
        }

        private static string ObtenerOperador(OperadorDeFiltardo operador)
        {
            string strOperacion = string.Empty;
            switch (operador)
            {
                case OperadorDeFiltardo.And:
                    strOperacion = "AND";
                    break;
                case OperadorDeFiltardo.Or:
                    strOperacion = "OR";
                    break;
                case OperadorDeFiltardo.SinOperador:
                    strOperacion = "";
                    break;
            }
            return strOperacion;
        }



       
    }




    public enum OperadorDeFiltardo
    {
        And = 0, Or = 1, SinOperador = 2
    }
}
