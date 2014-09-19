
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using HER;
namespace FEL.FIS
{
    /// <summary>
    /// Acceso a los Web Services WS_FIS
    /// Modulo: Fiscalizaci
    /// Tabla: Fis_Planilla_Multa
    /// </summary>
    [DataObject]
    public class BO_Fis_Planilla_Multa
    {
        #region  Adapter
        private WS_FIS _Adapter;
        /// <summary>
        /// Acceso al servicio
        /// </summary>
        public WS_FIS Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new WS_FIS();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Fis_Planilla_Multa> Get(string sortExpression, Scope s)
        {
            List<Fis_Planilla_Multa> lista = new List<Fis_Planilla_Multa>(Adapter.Fis_Planilla_Multa_Get(s));
            lista.Sort(new Fis_Planilla_Multa_Comparar(sortExpression));
            return lista;
        }
        // Retorna un data table de objetos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable Get(Scope s)
        {
            return EntidadDT.GetDT(Adapter.Fis_Planilla_Multa_Get(s));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Fis_Planilla_Multa> GetByCodigo(string sortExpression, Scope s, string Codigo)
        {
            List<Fis_Planilla_Multa> lista = new List<Fis_Planilla_Multa>(Adapter.Fis_Planilla_Multa_GetByCodigo(s, Codigo));
            lista.Sort(new Fis_Planilla_Multa_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByCodigo(Scope s, string Codigo)
        {
            return EntidadDT.GetDT(Adapter.Fis_Planilla_Multa_GetByCodigo(s, Codigo));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Fis_Planilla_Multa> GetById(string sortExpression, Scope s, string Id)
        {
            List<Fis_Planilla_Multa> lista = new List<Fis_Planilla_Multa>(Adapter.Fis_Planilla_Multa_GetById(s, Id));
            lista.Sort(new Fis_Planilla_Multa_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetById(Scope s, string Id)
        {
            return EntidadDT.GetDT(Adapter.Fis_Planilla_Multa_GetById(s, Id));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Fis_Planilla_Multa> GetByPlanilla(string sortExpression, Scope s, string Fis_Planilla_Id)
        {
            List<Fis_Planilla_Multa> lista = new List<Fis_Planilla_Multa>(Adapter.Fis_Planilla_Multa_GetByPlanilla(s, Fis_Planilla_Id));
            lista.Sort(new Fis_Planilla_Multa_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByPlanilla(Scope s, string Fis_Planilla_Id)
        {
            return EntidadDT.GetDT(Adapter.Fis_Planilla_Multa_GetByPlanilla(s, Fis_Planilla_Id));
        }
        #endregion
        #region Operacion entre datos
        // Actualiza
        /// <summary>
        /// Actualiza la tabla Fis_Planilla_Multa
        /// </summary>
        /// <param name="o">Objeto que contiene la informacion a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Scope s, Fis_Planilla_Multa o, Fis_Planilla_Multa original)
        {
            return Adapter.Fis_Planilla_Multa_Update(s, o, original);
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Scope s, List<DictionaryEntry> parametros)
        {
            Fis_Planilla_Multa o = new Fis_Planilla_Multa();
            Fis_Planilla_Multa original = new Fis_Planilla_Multa();
            Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
            return Update(s, o, original);
        }
        // Inserta
        /// <summary>
        /// Inserta el objeto en Fis_Planilla_Multa
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public string Insert(Scope s, Fis_Planilla_Multa o)
        {
            return Adapter.Fis_Planilla_Multa_Insert(s, o);
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public string Insert(Scope s, List<DictionaryEntry> parametros)
        {
            Fis_Planilla_Multa o = new Fis_Planilla_Multa();
            Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
            return Insert(s, o);
        }
        // Borra
        /// <summary>
        /// Borra el objeto en  Fis_Planilla_Multa
        /// </summary>
        /// <param name="o">Objeto a borrar</param>
        /// <returns></returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Scope s, Fis_Planilla_Multa o)
        {
            return Adapter.Fis_Planilla_Multa_Delete(s, o);
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Scope s, List<DictionaryEntry> parametros)
        {
            Fis_Planilla_Multa original = new Fis_Planilla_Multa();
            Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
            return Delete(s, original);
        }
        #endregion
        #region Ordenar la lista
        class Fis_Planilla_Multa_Comparar : IComparer<Fis_Planilla_Multa>
        {
            private string _sortColumn;
            private bool _reverse;
            public Fis_Planilla_Multa_Comparar(string sortExpression)
            {
                _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
                if (_reverse)
                    _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
                else
                    _sortColumn = sortExpression;
            }
            public int Compare(Fis_Planilla_Multa x, Fis_Planilla_Multa y)
            {
                int retVal = 0;
                switch (_sortColumn)
                {
                    case "Id":
                        retVal = string.Compare(x.Id, y.Id);
                        break;
                    case "Nombre":
                        retVal = string.Compare(x.Nombre, y.Nombre);
                        break;
                    case "Codigo":
                        retVal = string.Compare(x.Codigo, y.Codigo);
                        break;
                    case "Estado":
                        retVal = string.Compare(x.Estado, y.Estado);
                        break;
                }
                return (retVal * (_reverse ? -1 : 1));
            }
        }
        #endregion
    }
}
